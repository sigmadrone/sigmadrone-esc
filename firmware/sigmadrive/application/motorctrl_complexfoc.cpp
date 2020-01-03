#include "motorctrl_complexfoc.h"
#include "sdmath.h"
#include "uartrpcserver.h"

#include "minasa4encoder.h"
extern MinasA4Encoder ma4_abs_encoder;


extern UartRpcServer rpc_server;

MotorCtrlComplexFOC::MotorCtrlComplexFOC(MotorDrive* drive)
	: drive_(drive)
	, lpf_Iabs_disp_(config_.iabs_alpha_disp_)
	, lpf_RIdot_(config_.ridot_alpha_)
	, lpf_RIdot_disp_(config_.ridot_alpha_disp_)
	, pid_current_arg_(config_.pid_current_kp_, config_.pid_current_ki_, 0, config_.pid_current_leak_)
{
	props_= rexjson::property_map({
		{"iabs_alpha", rexjson::property(
				&config_.iabs_alpha_disp_,
				rexjson::property_access::readwrite,
				[](const rexjson::value& v){float t = v.get_real(); if (t < 0 || t > 1.0) throw std::range_error("Invalid value");},
				[&](void*)->void {
					lpf_Iabs_disp_.SetAlpha(config_.iabs_alpha_disp_);
				})},
		{"ridot_alpha", rexjson::property(
				&config_.ridot_alpha_,
				rexjson::property_access::readwrite,
				[](const rexjson::value& v){float t = v.get_real(); if (t < 0 || t > 1.0) throw std::range_error("Invalid value");},
				[&](void*)->void {
					lpf_RIdot_.SetAlpha(config_.ridot_alpha_);
		})},
		{"ridot_disp_alpha", rexjson::property(
				&config_.ridot_alpha_disp_,
				rexjson::property_access::readwrite,
				[](const rexjson::value& v){float t = v.get_real(); if (t < 0 || t > 1.0) throw std::range_error("Invalid value");},
				[&](void*)->void {
					lpf_RIdot_disp_.SetAlpha(config_.ridot_alpha_disp_);
		})},

		{"pid_current_kp", rexjson::property(
				&config_.pid_current_kp_,
				rexjson::property_access::readwrite,
				[](const rexjson::value& v){},
				[&](void*)->void {
					pid_current_arg_.SetGainP(config_.pid_current_kp_);
		})},
		{"pid_current_ki", rexjson::property(
				&config_.pid_current_ki_,
				rexjson::property_access::readwrite,
				[](const rexjson::value& v){},
				[&](void*)->void {
					pid_current_arg_.SetGainI(config_.pid_current_ki_);
		})},
		{"pid_current_leak", rexjson::property(
				&config_.pid_current_leak_,
				rexjson::property_access::readwrite,
				[](const rexjson::value& v){},
				[&](void*)->void {
					pid_current_arg_.SetDecayRate(config_.pid_current_leak_);
		})},
		{"ri_angle", &config_.ri_angle_},
		{"spin_voltage", &config_.spin_voltage_},
	});

	rpc_server.add("cfoc.start", rexjson::make_rpc_wrapper(this, &MotorCtrlComplexFOC::RunSpinTasks, "void ServoDrive::RunSpinTasks()"));
	rpc_server.add("cfoc.stop", rexjson::make_rpc_wrapper(this, &MotorCtrlComplexFOC::Stop, "void ServoDrive::Stop()"));
}

void MotorCtrlComplexFOC::UpdateRotor()
{
	uint32_t rotor_position = drive_->encoder_->GetPosition();
	if (rotor_position != (uint32_t)-1) {
		float theta = drive_->GetEncoderDir() * (drive_->encoder_->GetElectricPosition(rotor_position, drive_->GetPolePairs()));
		std::complex<float> r_prev = R_;
		R_ = std::complex<float>(cosf(theta), sinf(theta));
		std::complex<float> r_cur = R_;
		W_ = sdmath::cross(r_prev, r_cur);;
	}
}


std::complex<float> MotorCtrlComplexFOC::GetElecRotation()
{
	return R_;
}

float MotorCtrlComplexFOC::GetPhaseSpeedVector()
{
	return W_;
}

float MotorCtrlComplexFOC::GetEncoderPeriod()
{
	return drive_->GetUpdatePeriod() * (config_.enc_skip_updates + 1);
}


void MotorCtrlComplexFOC::Stop()
{
	drive_->Abort();
}

void MotorCtrlComplexFOC::RunSpinTasks()
{
	drive_->AddTaskArmMotor();
	drive_->AddTaskResetRotor();
	if (drive_->GetEncoderDir() == 0)
		drive_->AddTaskDetectEncoderDir();
	drive_->sched_.AddTask([&](){
		bool ret = false;
		uint32_t display_counter = 0;
		drive_->data_.update_counter_ = 0;
		do {
			ret = drive_->sched_.RunUpdateHandler([&]()->bool {
				if (drive_->data_.update_counter_ % (config_.enc_skip_updates + 1) == 0) {
					drive_->encoder_->Update();
					UpdateRotor();
				}

				std::complex<float> I = drive_->GetPhaseCurrent();
				std::complex<float> rotor = GetElecRotation();
				float Iarg = std::arg(I);
				float Iabs = std::abs(I);
				std::complex<float> Inorm = std::polar<float>(1.0f, Iarg);
				float ri_dot = sdmath::dot(rotor, Inorm);
				lpf_RIdot_.DoFilter(ri_dot);
				lpf_RIdot_disp_.DoFilter(ri_dot);
				lpf_Iabs_disp_.DoFilter(Iabs);
				pid_current_arg_.Input(lpf_RIdot_.Output(), 1.0f / drive_->GetUpdateFrequency());
				std::complex<float> ri_vec = std::polar<float>(1.0f, config_.ri_angle_);// + pid_current_arg_.Output());
				drive_->ApplyPhaseVoltage(config_.spin_voltage_, rotor * ri_vec, drive_->GetBusVoltage());
				if ((display_counter++ % 143) == 0) {
#if 1
					float diff = acosf(lpf_RIdot_disp_.Output());
					float Rarg = std::arg(rotor);
					if (Rarg < 0.0f)
						Rarg += M_PI * 2.0f;
					if (Iarg < 0.0f)
						Iarg += M_PI * 2.0f;
					float speed = asinf(GetPhaseSpeedVector()) / (GetEncoderPeriod() * M_PI * 2 * drive_->GetPolePairs());

					fprintf(stderr, "ProcTime: %5lu EncTime: %5lu, EncErr: %8lu, Vbus: %4.2f, RPM: %6.1f, arg(R): %6.1f, arg(I): %6.1f, abs(I): %6.3f, DIFF: %+7.1f (%+4.2f), Pid.Out: %8.5f (%5.2f)\n",
							hrtimer.GetTimeElapsedMicroSec(drive_->t2_begin_, hrtimer.GetCounter()),
							ma4_abs_encoder.update_time_ms_,
							ma4_abs_encoder.error_count_,
							drive_->GetBusVoltage(),
							speed,
							Rarg / M_PI * 180.0f,
							Iarg / M_PI * 180.0f,
							lpf_Iabs_disp_.Output(),
							diff / M_PI * 180.0f,
							lpf_RIdot_disp_.Output(),
							pid_current_arg_.Output(),
							pid_current_arg_.Output() / M_PI * 180.0f);

#elif 1
					uint32_t t4 = hrtimer.GetCounter();
					fprintf(stderr, "Mot t1: %5lu,  Mot t2: %5lu,  Mot t3: %5lu,  Mot t4: %5lu,  Enc t1: %5lu,  Enc t2: %5lu,  UpdTime: %5lu uSec,  EncTime: %5lu uSec,  UpdC: %10lu,  DispC: %10lu\n",
							((drive_->t1_ / 108) & 0xFF),
							((drive_->t2_begin_ / 108) & 0xFF),
							((drive_->t3_ / 108) & 0xFF),
							((t4 / 108) & 0xFF),
							((ma4_abs_encoder.t1_ / 108) & 0xFF),
							((ma4_abs_encoder.t2_begin_ / 108) & 0xFF),
							hrtimer.GetTimeElapsedMicroSec(drive_->t2_begin_, hrtimer.GetCounter()),
							ma4_abs_encoder.update_time_ms_,
							drive_->data_.update_counter_,
							display_counter);

#else


#endif

				}
				return false;
			});
		} while (ret);
	});

	drive_->sched_.Run();
}
