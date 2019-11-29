/*
 * servo_drive.h
 *
 *  Created on: Oct 15, 2019
 *      Author: mstoilov
 */

#ifndef _SERVO_DRIVE_H_
#define _SERVO_DRIVE_H_

#include "iservodrive.h"
#include "lowpassfilter.h"
#include "property.h"
#include "scheduler.h"
#include "torque_loop.h"
#include "pidcontroller.h"


class ServoDrive : public IServoDrive {
public:
	struct SampledData {
		int32_t injdata_[3];
		int32_t vbus_ = 0;
		uint32_t counter_dir_ = 0;
		float theta_ = 0.0f;
		uint32_t processing_ = 0;
		uint32_t update_counter_ = 0;
	};


	ServoDrive(IEncoder* encoder, IPwmGenerator *pwm, uint32_t update_hz);
	virtual ~ServoDrive();
	virtual IEncoder* GetEncoder() const override { return encoder_; }
	virtual IPwmGenerator* GetPwmGenerator() const override { return pwm_; }
	virtual void Start() override;
	virtual void Stop() override;
	virtual bool IsStarted() override;

	void Attach();
	void SignalThreadUpdate();

	float CalculatePhaseCurrent(float adc_val, float adc_bias);
	float VoltageToDuty(float v_bus, float v_abs);

	void UpdateRotor();
	void UpdateVbus();
	void UpdateCurrent();
	void UpdateCurrentBias();

	bool GetTimings(const std::complex<float>& angle, uint32_t timing_period, uint32_t& timing_a, uint32_t& timing_b, uint32_t& timing_c);

	bool RunUpdateHandler(const std::function<bool(void)>& update_handler);
	void RunSimpleTasks();
	void RunRotateTasks();
	float RunResistanceMeasurement();

protected:
	bool WaitUpdate();



public:
	Scheduler sched;


public:
	rexjson::property props_;

public:
	std::complex<float> Pa_;
	std::complex<float> Pb_;
	std::complex<float> Pc_;

	uint32_t runtasks = 0;
	uint32_t update_hz_;
	uint32_t adc_full_scale = (1<<12);
	float Vref_ = 2.9;
	float Vbus_resistor_ratio_ = (47.0 + 3.3) / 3.3;
	float csa_gain_ = 10.0f;
	float Rsense_ = 0.010f;
	float position_temp_ = 0.0;
	float theta_old_ = 0;
	float theta_cur_ = 0;
	uint32_t wait_timeout_ = (uint32_t)-1; // msec
	int32_t pole_pairs = 7;
	float resistance_ = 0.0f;
	float inductance_ = 0.0f;
	float bias_alpha_ = 0.00035f;
	float i_alpha_ = 0.25f;
	float rotor_alpha_ = 1.0f;
	float speed_alpha_ = 0.3f;
	float ridot_alpha_ = 0.1f;
	float iabs_alpha_ = 0.001f;

	float throttle_ = 0.05;
	float ri_angle_ = 1.805;
	uint32_t period_ = 0;
	TorqueLoop tql_;
	IEncoder *encoder_ = nullptr;
	IPwmGenerator *pwm_ = nullptr;
	SampledData data_;

/*
 * Derived Data
 */
	LowPassFilter<float, float> lpf_bias_a;
	LowPassFilter<float, float> lpf_bias_b;
	LowPassFilter<float, float> lpf_bias_c;
	LowPassFilter<std::complex<float>, float> lpf_e_rotor_;
	LowPassFilter<std::complex<float>, float> lpf_Iab_;
	LowPassFilter<std::complex<float>, float> lpf_Idq_;
	LowPassFilter<float, float> lpf_Iabs_;
	LowPassFilter<float, float> lpf_RIdot_;
	LowPassFilter<float, float> lpf_vbus_;
	LowPassFilter<float, float> lpf_speed_;


};

#endif /* _SERVO_DRIVE_H_ */
