
#ifndef _PICONTROLLER_H_
#define _PICONTROLLER_H_

/** PID controller implementation
 *
 * This is a straight forward implementation of PID controller
 * functionality. The implementation also supports max integral
 * output to prevent *integral windup*. Error decay rate and
 * bias output are also supported.
 *
 */
template<typename T>
class PIController {
public:
    /** Constructor
     *
     * @param kp Proportional gain
     * @param ki Integral gain
     * @param kd Differential gain
     * @param output_i_max Maximum integral output limit
     * @param bias Output bias
     */
    PIController(float kp = 0, float ki = 0, float output_max = 0)
        : kp_(kp)
        , ki_(ki)
        , output_max_((output_max < 0) ? -output_max : output_max)
        , last_error_(0)
        , output_p_(0)
        , output_i_(0)
    {
    }

    ~PIController()
    {
    }

    /** Input method
     *
     * This method is used to recalculate the
     * controller output.
     *
     * @param error The magnitude of the current measurement
     * @param dt Time interval (dT) since the previous input
     * @return The output from the PID controller
     */
    T Input(const T& error, float dt)
    {
        /*
         * Proportional output
         */
        output_p_ = error * kp_;

        /*
         * Integral output
         */
        output_i_ = output_i_ + 0.5f * ki_ * dt * (error + last_error_);

        last_error_ = error;
        return Output();
    }

    T Error() const
    {
        return last_error_;
    }

    /** Return the current output calculated during the last @ref Input call
     *
     * @return Return the cached output
     */
    T Output() const
    {
        T output = output_p_ + output_i_;
        if (output > output_max_)
            return output_max_;
        else if (output < -output_max_)
            return -output_max_;
        return output;
    }

    /** Return the proportional component of the PID controller output
     *
     * @return Proportional output
     */
    T OutputP() const
    {
        return output_p_;
    }

    /** Return the integral component of the PID controller output
     *
     * @return Integral output
     */
    T OutputI() const
    {
        return output_i_;
    }

    /** Set the maximum allowed output.
     *
     * @param output_max max output from the PID controller.
     */
    void SetMaxOutput(const T &output_max)
    {
        output_max_ = (output_max < 0) ? -output_max : output_max;
    }

    /** Return the output limit
     *
     * @return Output limit
     */
    T GetMaxOutput() const
    {
        return output_max_;
    }

    /** Set the proportional gain of the PID controller
     *
     * @param kp Proportional gain
     */
    void SetGainP(float kp)
    {
        kp_ = kp;
    }

    /** Set the integral gain of the PID controller
     *
     * @param ki Integral gain
     */
    void SetGainI(float ki)
    {
        ki_ = ki;
    }

    /** Reset the controller output
     *
     * Please note this call doesn't reset the bias.
     * After this call the PID output would be 0, unless
     * the PID controller is biased. If there is bias set
     * the output will be the bias value.
     *
     */
    void Reset()
    {
        last_error_ = 0;
        output_p_ = 0;
        output_i_ = 0;
    }

public:
    float kp_;              /**< Proportional gain */
    float ki_;              /**< Integral gain */
    T output_max_;          /**< Output limit */
    T last_error_;          /**< Cached error value from the @ref InputError method call */
    T output_p_;            /**< Proportional output */
    T output_i_;            /**< Integral output */
};

#endif /* _PIDCONTROLLER_H_ */
