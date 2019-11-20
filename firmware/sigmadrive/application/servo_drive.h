/*
 * servo_drive.h
 *
 *  Created on: Oct 15, 2019
 *      Author: mstoilov
 */

#ifndef _SERVO_DRIVE_H_
#define _SERVO_DRIVE_H_

#include "cmsis_os.h"
#include "iservodrive.h"
#include "lowpassfilter.h"
#include "property.h"
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
	};


	ServoDrive(IEncoder* encoder, IPwmGenerator *pwm, uint32_t update_hz);
	virtual ~ServoDrive();
	virtual IEncoder* GetEncoder() const override { return encoder_; }
	virtual IPwmGenerator* GetPwmGenerator() const override { return pwm_; }
	virtual void Start() override;
	virtual void Stop() override;
	virtual bool IsStarted() override;

	void PeriodElapsedCallback();
	void UpdateSpeed();

	void UpdateHandler_wip();

	void UpdateHandlerNoFb();

	void GetTimings(const std::complex<float>& vec);

//	friend void RunControlLoopWrapper(void const* ctx);
	void RunControlLoop();
	void SignalThreadUpdate();
	void StartControlThread();

	enum Signals {
        THREAD_SIGNAL_UPDATE = 1u << 0
    };

protected:
	bool WaitUpdate();





public:
	rexjson::property props_;

public:
	uint32_t update_hz_;
	float csa_gain_ = 10.0f;
	float Rsense_ = 0.010f;
	float position_temp_ = 0.0;
	float theta_old_ = 0;
	float theta_cur_ = 0;
	float speed_ = 0.0;		// counts per time slice
	uint32_t wait_timeout_ = (uint32_t)-1; // msec
	int32_t pole_pairs = 7;
	float voltage_bus_ = 15.0f;
	float resistance_ = 0.0f;
	float inductance_ = 0.0f;
	float bias_alpha_ = 0.00035f;
	float i_alpha_ = 0.25f;
	osThreadId control_thread_id_ = 0;

	LowPassFilter<decltype(speed_), float> lpf_speed_;
	LowPassFilter<std::complex<float>, float> lpf_R;
	LowPassFilter<std::complex<float>, float> lpf_I;
	LowPassFilter<std::complex<float>, float> lpf_Ipwm;
	LowPassFilter<float, float> lpf_bias_a;
	LowPassFilter<float, float> lpf_bias_b;
	LowPassFilter<float, float> lpf_bias_c;
	LowPassFilter<float, float> lpf_i_a;
	LowPassFilter<float, float> lpf_i_b;
	LowPassFilter<float, float> lpf_i_c;
	LowPassFilter<float, float> lpf_i_abs;
	float throttle_ = 0.05;
	float ri_angle = M_PI / 2.0;
	uint32_t update_counter_ = 0;
	uint32_t period_ = 0;
	TorqueLoop tql_;
	uint32_t timings_[3];
	IEncoder *encoder_ = nullptr;
	IPwmGenerator *pwm_ = nullptr;
	SampledData data_;
};

#endif /* _SERVO_DRIVE_H_ */
