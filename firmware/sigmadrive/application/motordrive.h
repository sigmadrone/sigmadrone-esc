/*
 * servo_drive.h
 *
 *  Created on: Oct 15, 2019
 *      Author: mstoilov
 */

#ifndef _MOTOR_DRIVE_H_
#define _MOTOR_DRIVE_H_

#include <complex>
#include "iencoder.h"
#include "ipwmgenerator.h"
#include "lowpassfilter.h"
#include "rexjsonrpc/property.h"
#include "scheduler.h"
#include "pidcontroller.h"
#include "errorinfo.h"

#include "hrtimer.h"
extern HRTimer hrtimer;

/** The MotorDrive class is important class responsible
 * for driving the motor (applying the SVM voltage to the motor phases)
 *
 */
class MotorDrive {
public:
    struct SampledData {
        int32_t injdata_[3];
        float phase_current_a_;
        float phase_current_b_;
        float phase_current_c_;
        int32_t vbus_ = 0;
        uint32_t update_counter_ = 0;
        uint32_t bias_counter_ = 0;
    };

    struct Config {
        int32_t encoder_dir_ = 1;				            /**< Encoder direction: (1) - encoder increasing or (-1) encoder decreasing */
        uint32_t reset_hz_ = 35;                            /**< Rotor reset rate. The rotor is oscilated with this rate during the reset process */
        uint32_t pole_pairs = 7;                            /**< Motor pole pairs */
        uint32_t adc_full_scale = (1 << 12);                /**< ADC converter full scale */
        uint32_t display_div_ = 2999;
        uint32_t enc_skip_updates_ = 2;                     /**< How many update interrupts to skip, before initiating a new encoder update */
        uint32_t csa_gain_ = 10;                            /**< Current sensing amplifier gain */
        bool svm_saddle_ = false;                           /**< Use space vector modulation (SVM) saddle form */
        float Vref_ = 3.3;                                  /**< ADC reference voltage */
        float max_modulation_duty_ = 0.95;                  /**< Maximum modulation duty */
        float Vbus_resistor_ratio_ = (47.0 + 3.3) / 3.3;    /**< Vbus divider ratio used to measure the Vbus voltage  */
        float reset_voltage_ = 3.5f;                        /**< Voltage used during the rotor reset process. @see reset_hz_ */
        float Rsense_ = 0.010f;                             /**< Shunt resistor value */
        float calib_v_ = 12;                                /**< Calibration voltage. This voltage is used for the calibration process */
        float calib_max_i_ = 4;                             /**< Calibration max allowed current. */
        float resistance_ = 0.05f;                          /**< Phase resistance */
        float inductance_ = 5.56e-05f;                      /**< Phase inductance */
        float bias_alpha_ = 0.00035f;                       /**< RC filter alpha coefficient */
        float vbus_alpha_ = 0.2f;                           /**< Vbus filter alpha coefficient */
        float iabc_alpha_ = 0.75;                           /**< phase current filter alpha coefficient */
        float trip_i_ = 5.0f;                               /**< Trip current, the max phase allowed current. */
        float trip_v_ = 45.0f;                              /**< Trip voltage, the max allowed voltage */
    };

    void Run();
    void RunWaitForCompletion();
    void Abort();
    bool IsStarted();

    MotorDrive(IEncoder *encoder, IPwmGenerator *pwm, uint32_t update_hz);
    virtual ~MotorDrive();

    void Attach();
    void IrqUpdateCallback();

    float CalculatePhaseCurrent(float adc_val, float adc_bias);
    float VoltageToDuty(float voltage, float v_bus);

    void UpdateRotor();
    void UpdateVbus();
    void UpdateCurrent();

    void SineSVM(float duty, const std::complex<float> &v_theta, float &duty_a, float &duty_b, float &duty_c);
    void SaddleSVM(float duty, const std::complex<float> &v_theta, float &duty_a, float &duty_b, float &duty_c);
    bool GetDutyTimings(float duty_a, float duty_b, float duty_c, uint32_t timing_period, uint32_t &timing_a, uint32_t &timing_b,
            uint32_t &timing_c);
    bool ApplyPhaseModulation(float v_duty, const std::complex<float> &v_theta);
    bool ApplyPhaseVoltage(float v_abs, const std::complex<float> &v_theta);
    bool ApplyPhaseVoltage(float v_alpha, float v_beta);
    bool ApplyPhaseDuty(float duty_a, float duty_b, float duty_c);
    bool RunUpdateHandler(const std::function<bool(void)> &update_handler);
    IEncoder* GetEncoder() const;
    void SetEncoder(IEncoder *encoder);
    int32_t GetEncoderDir() const;
    uint32_t GetUpdateFrequency() const;
    float GetTimeSlice() const;
    float GetEncoderTimeSlice() const;
    uint32_t GetPolePairs() const;
    float GetBusVoltage() const;
    std::complex<float> GetElecRotation();
    std::complex<float> GetMechRotation();
    float GetPhaseSpeedVector();

    std::complex<float> GetPhaseCurrent() const;
    void DefaultIdleTask();
    bool CheckPhaseCurrentViolation(float current);
    bool CheckPhaseVoltageViolation(float voltage);
    bool CheckTripViolations();
    void RegisterRpcMethods();
    rexjson::property GetPropertyMap();

    /*
     * UpdateHandlers
     */
    bool RunUpdateHandlerRotateMotor(float angle, float speed, float voltage, bool dir);

    /*
     * Scheduler Tasks
     */
    void AddTaskRotateMotor(float angle, float speed, float voltage, bool dir);
    void AddTaskArmMotor();
    void AddTaskDisarmMotor();
    void AddTaskResetRotorWithParams(float reset_voltage, uint32_t reset_hz, bool reset_encoder = true);
    void AddTaskMeasureResistance(float seconds, float test_voltage);
    void AddTaskMeasureInductance(float seconds, float test_voltage, uint32_t test_hz);
    void AddTaskDetectEncoderDir();
    void RunTaskAphaPoleSearch();
    void RunTaskRotateMotor(float angle, float speed, float voltage, bool dir);
    void RunSimpleTasks();
    void AddTaskCalibrationSequence(bool reset_rotor);
    float RunResistanceMeasurement(float seconds, float test_voltage);
    float RunInductanceMeasurement(float seconds, float test_voltage, uint32_t test_hz);

    void SchedulerRun();
    void SchedulerAbort();

public:
    Scheduler sched_;

public:
    Config config_;
    std::complex<float> Pa_;
    std::complex<float> Pb_;
    std::complex<float> Pc_;

    uint32_t update_hz_;
    float time_slice_;
    float enc_time_slice_;
    uint32_t t1_begin_ = 0;
    uint32_t t1_span_ = 0;
    uint32_t t2_begin_ = 0;
    uint32_t t2_end_ = 0;
    uint32_t t2_span_ = 0;
    uint32_t delay_trip_check_ = 0;

    uint32_t t2_to_t2_ = 0;
    bool run_simple_tasks_ = false;
    IEncoder *encoder_ = nullptr;
    IPwmGenerator *pwm_ = nullptr;
    SampledData data_;
    ErrorInfo error_info_;

    /*
     * Derived Data
     */
    LowPassFilter<float, float> lpf_bias_a;
    LowPassFilter<float, float> lpf_bias_b;
    LowPassFilter<float, float> lpf_bias_c;
    LowPassFilter<float, float> lpf_vbus_;
    LowPassFilter<float, float> lpf_Ia_;
    LowPassFilter<float, float> lpf_Ib_;
    LowPassFilter<float, float> lpf_Ic_;
    std::complex<float> Iab_;
    std::complex<float> E_;
    std::complex<float> R_;
    float W_;

};

#endif /* _MOTOR_DRIVE_H_ */
