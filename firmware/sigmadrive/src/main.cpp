#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <iostream>
#include <algorithm>
#include "diag/Trace.h"
#include "cmsis_device.h"

#include "cortexm/ExceptionHandlers.h"
#include "arm/semihosting.h"

#include "FreeRTOS.h"
#include "FreeRTOSConfig.h"
#include "task.h"

#include "interruptmanager.h"
#include "digitalin.h"
#include "digitalout.h"
#include "pwmdecoder.h"
#include "quadraturedecoder.h"
#include "pwmsine.h"
#include "pwm6step.h"
#include "trigger.h"
#include "adc.h"
#include "usartde.h"
#include "mathtest.h"
#include "spimaster.h"
#include "drv8323.h"
#include "minas_a4_abs_encoder.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"

#define CURRENT_FB_A	LL_ADC_CHANNEL_0
#define CURRENT_FB_B	LL_ADC_CHANNEL_1
#define CURRENT_FB_C	LL_ADC_CHANNEL_2

#define BEMF_FB_A	LL_ADC_CHANNEL_12
#define BEMF_FB_B	LL_ADC_CHANNEL_11
#define BEMF_FB_C	LL_ADC_CHANNEL_10


#define LED_WARN PD_14
#define LED_STATUS PD_15
#define BTN_USER PD_11
#define GATE_ENABLE PE_14
#define DRV_FAULT PC_15

#define SPI_CLK PC_10
#define SPI_MISO PC_11
#define SPI_MOSI PC_12
#define DRV1_CS PC_13
#define DRV2_CS PC_14

DigitalOut gate_enable(GATE_ENABLE, DigitalOut::SpeedDefault, DigitalOut::OutputDefault, DigitalOut::PullUp, DigitalOut::ActiveDefault, 1);
DigitalOut led_warn(LED_WARN, DigitalOut::SpeedHigh, DigitalOut::OutputDefault, DigitalOut::PullDown, DigitalOut::ActiveDefault, 0);
DigitalOut led_status(LED_STATUS, DigitalOut::SpeedHigh, DigitalOut::OutputDefault, DigitalOut::PullNone, DigitalOut::ActiveLow, 0);
DigitalIn btn_user(BTN_USER, DigitalIn::PullDefault, DigitalIn::InterruptFalling);
DigitalIn encoder_z(PB_5, DigitalIn::PullDown, DigitalIn::InterruptRising);
DigitalIn drv_fault(DRV_FAULT, DigitalIn::PullNone, DigitalIn::InterruptNone);

//#define TEST_RS485
#ifdef TEST_RS485

USARTDE usart2(PD_4,
	{{PD_5, GPIO_MODE_AF_PP, GPIO_NOPULL, GPIO_SPEED_FAST, GPIO_AF7_USART2},
	{PD_6, GPIO_MODE_AF_PP, GPIO_NOPULL, GPIO_SPEED_FAST, GPIO_AF7_USART2}},
	2500000,
	USART2,
	DMA1,
	LL_DMA_STREAM_6,
	LL_DMA_STREAM_5,
	LL_DMA_CHANNEL_4,
	LL_USART_HWCONTROL_NONE,
	0);

USARTDE usart3(PD_12,
	{{PD_8, GPIO_MODE_AF_PP, GPIO_NOPULL, GPIO_SPEED_FAST, GPIO_AF7_USART3},
	{PD_9, GPIO_MODE_AF_PP, GPIO_NOPULL, GPIO_SPEED_FAST, GPIO_AF7_USART3}},
	2500000,
	USART3,
	DMA1,
	LL_DMA_STREAM_3,
	LL_DMA_STREAM_1,
	LL_DMA_CHANNEL_4,
	LL_USART_HWCONTROL_NONE,
	0);
#endif


PWMDecoder pwm3({
		{PB_4, LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_2}},
		TIM3, TimeSpan::from_milliseconds(25), Frequency::from_hertz(SystemCoreClock), 0);

QuadratureDecoder pwm4({
		{PB_6, LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_2},
		{PB_7, LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_2}},
		TIM4,  2048*4, 0);

QuadratureDecoder *p_encoder = &pwm4;

#undef USE_6STEP
#ifdef USE_6STEP
PWM6Step pwm1({
		{PE_8,  LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_1},
		{PE_9,  LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_1},
		{PE_10, LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_1},
		{PE_11,  LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_1},
		{PE_12,  LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_1},
		{PE_13,  LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_1}},
		TIM1, Frequency::from_hertz(50000), Frequency::from_hertz(SystemCoreClock), Timer::TrigUpdate, Timer::PWM1, Timer::High, Timer::High, 30, 0);

Adc adc({
	{PC_0,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},
	{PC_1,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},
	{PC_2,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},},
	{
			BEMF_FB_A, BEMF_FB_B, BEMF_FB_C,
	},
	ADC1, LL_ADC_RESOLUTION_12B, LL_ADC_SAMPLINGTIME_15CYCLES, LL_ADC_INJ_TRIG_EXT_TIM2_CH1, 0);

Adc adc_current({
	{PA_0,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},
	{PA_1,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},
	{PA_2,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},},
	{
			 CURRENT_FB_A, CURRENT_FB_B, CURRENT_FB_C, CURRENT_FB_A
	},
	ADC2, LL_ADC_RESOLUTION_12B, LL_ADC_SAMPLINGTIME_3CYCLES, LL_ADC_INJ_TRIG_EXT_TIM3_CH2, 0);

Trigger adc_trigger(TIM2, TimeSpan::from_nanoseconds(750), Frequency::from_hertz(SystemCoreClock));


Trigger adc_current_trigger(TIM3, TimeSpan::from_nanoseconds(750), Frequency::from_hertz(SystemCoreClock),
		Timer::SlaveTrigger, Timer::TriggerInternal0, Timer::TrigOC2REF, Timer::CH2, Timer::PWM1);


#else
PWMSine pwm1({{PE_8,  LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_1},
		{PE_9,  LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_1},
		{PE_10, LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_1},
		{PE_11,  LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_1},
		{PE_12,  LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_1},
		{PE_13,  LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_DOWN, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_1}},
		TIM1, Frequency::from_hertz(50000), Frequency::from_hertz(SystemCoreClock), Timer::TrigUpdate, Timer::PWM1,  Timer::High,  Timer::High, 30, 0);

Adc adc1({
		{PA_0,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},
		{PA_1,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},
		{PA_2,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},
		},
		{
				CURRENT_FB_A, // CURRENT_FB_B, CURRENT_FB_C,
		},
		ADC1, LL_ADC_RESOLUTION_12B, LL_ADC_SAMPLINGTIME_28CYCLES, LL_ADC_INJ_TRIG_EXT_TIM2_CH1, LL_ADC_INJ_TRIG_EXT_FALLING, 0);

#if 1
Adc adc2({
		{PA_0,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},
		{PA_1,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},
		{PA_2,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},
		},
		{
				CURRENT_FB_B,
		},
		ADC2, LL_ADC_RESOLUTION_12B, LL_ADC_SAMPLINGTIME_28CYCLES, LL_ADC_INJ_TRIG_EXT_TIM2_CH1, LL_ADC_INJ_TRIG_EXT_FALLING, 0);

Adc adc3({
		{PA_0,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},
		{PA_1,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},
		{PA_2,  LL_GPIO_MODE_ANALOG, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_LOW, LL_GPIO_AF_0},
		},
		{
				CURRENT_FB_C,
		},
		ADC3, LL_ADC_RESOLUTION_12B, LL_ADC_SAMPLINGTIME_28CYCLES, LL_ADC_INJ_TRIG_EXT_TIM2_CH1, LL_ADC_INJ_TRIG_EXT_FALLING, 0);

#endif

Trigger adc_trigger(TIM2, TimeSpan::from_nanoseconds(17000), Frequency::from_hertz(SystemCoreClock));

#endif

SPIMaster spi3(SPI3, SPIMaster::Data16Bit, SPIMaster::Div32, SPIMaster::PolarityLow, SPIMaster::Edge2, {
		{SPI_CLK, LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_6},
		{SPI_MISO, LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_6},
		{SPI_MOSI, LL_GPIO_MODE_ALTERNATE, LL_GPIO_PULL_NO, LL_GPIO_SPEED_FREQ_HIGH, LL_GPIO_AF_6},
}, {
		{DRV1_CS, LL_GPIO_MODE_OUTPUT, LL_GPIO_PULL_UP, LL_GPIO_SPEED_FREQ_HIGH, 0},
		{DRV2_CS, LL_GPIO_MODE_OUTPUT, LL_GPIO_PULL_UP, LL_GPIO_SPEED_FREQ_HIGH, 0},
});

Drv8323 drv1(spi3, 0);
Drv8323 drv2(spi3, 1);

volatile uint64_t jiffies = 0;


uint32_t drv_read_reg(uint32_t cs, uint32_t addr)
{
	uint16_t data = (0x1 << 15) | ((addr & 0xF) << 11);
	spi3.spi_chip_select(cs, true);
	data = spi3.spi_write_read16(data);
	spi3.spi_chip_select(cs, false);
	return data & 0x7FF;
}

uint32_t drv_write_reg(uint32_t cs, uint32_t addr, uint32_t data)
{
	uint16_t data16 = (uint16_t)(((addr & 0xF) << 11) | (data & 0x7FF));
	spi3.spi_chip_select(cs, true);
	data = spi3.spi_write_read16(data16);
	spi3.spi_chip_select(cs, false);
	return data & 0x7FF;
}


void drv_dump_regs(uint32_t cs)
{
	for (int i = 0; i < 7; i++) {
		printf("DRV: Reg %d: 0x%x\n", i, (unsigned int) drv_read_reg(cs, i));
	}
	printf("\n\n");
}

void emergency_stop()
{
	pwm1.DisableOutputs();
	pwm1.DisableCounter();
}


extern USART* ptrUsart1;

void pwm1_toggle()
{
	if (!pwm1.IsEnabledCounter()) {
		pwm1.Start();
	} else {
		pwm1.Stop();
	}
}


void CallbackPWMCC(uint32_t pulse, uint32_t period)
{
#ifdef USE_6STEP
	float throttle = pwm3.GetPulseLength().seconds_float() * 1000.0 - 0.7;
	pwm1.SetThrottle(throttle);
	if (!pwm1.IsEnabledCounter() && throttle > PWM6Step::MIN_THROTTLE)
		pwm1.Start();
	if (pwm1.IsEnabledCounter() && throttle < PWM6Step::MIN_THROTTLE)
		pwm1.Stop();
#endif
}

void RunFloatingPointTest()
{
#if 0
	using namespace std::complex_literals;
	int64_t jend = 0, jbegin = jiffies;
	int iterations = 4000000;

	printf("----- Starting FPU Test\n");
	printf("Iterations : %d\n", iterations);

	for (int i = 0; i < iterations; i++) {
		mul_float(2.0, 3.0);
	}
	jend = jiffies;

	printf("mul_float  : %5ld\n", (int32_t)(jend - jbegin));

	jbegin = jiffies;
	for (int i = 0; i < iterations; i++) {
		div_float(2.0, 3.0);
	}
	jend = jiffies;
	printf("div_float  : %5ld\n", (int32_t)(jend - jbegin));

	std::complex<float> a = 0.25 + 2.0i, b = 0.5 + 1.25i;
	jbegin = jiffies;
	for (int i = 0; i < iterations; i++) {
		dot(a, b);
	}
	jend = jiffies;
	printf("dot        : %5ld\n", (int32_t)(jend - jbegin));
	printf("----- Done.\n");
#endif
}

//#define DUMP_MINAS_A4_STATE
#define DUMP_DRV_FAULT

MinasA4AbsEncoder* ma4_abs_encoder_ptr = nullptr;

void encoder_reader_task(void *pvParameters)
{
	USARTDE usart3(PD_12, {
			{PD_8, GPIO_MODE_AF_PP, GPIO_PULLUP, GPIO_SPEED_FAST, GPIO_AF7_USART3},
			{PD_9, GPIO_MODE_AF_PP, GPIO_NOPULL, GPIO_SPEED_FAST, GPIO_AF7_USART3}},
			2500000, // 2.5 Mbps
			USART3,
			DMA1,
			LL_DMA_STREAM_3,
			LL_DMA_STREAM_1,
			LL_DMA_CHANNEL_4);

	MinasA4AbsEncoder ma4_abs_encoder(usart3);

	ma4_abs_encoder.init();

	ma4_abs_encoder_ptr = &ma4_abs_encoder;

	while (1) {
		if (!ma4_abs_encoder.update()) {
			ma4_abs_encoder.reset_all_errors();
		}
	}

}


void main_task(void *pvParameters)
{
	uint32_t old_encoder_idx = 0, new_encoder_idx = 0;
	uint32_t old_decoder_value = 0, new_decoder_value = 0;

	uint32_t count = 0;

	btn_user.Callback(pwm1_toggle);

	// At this stage the system clock should have already been configured
	// at high speed.
	printf("System clock: %lu Hz\n", SystemCoreClock);

	drv1.WriteReg(2, 0x0);
	drv1.WriteReg(3, 0x0);
	drv1.WriteReg(4, 0x0);
	drv1.WriteReg(5, 0x0);
	drv1.WriteReg(6, 0x0);

	drv1.SetIDriveP_HS(Drv8323::IDRIVEP_370mA);
	drv1.SetIDriveN_HS(Drv8323::IDRIVEN_1360mA);
	drv1.SetIDriveP_LS(Drv8323::IDRIVEP_370mA);
	drv1.SetIDriveN_LS(Drv8323::IDRIVEN_1360mA);
	drv1.SetTDrive(Drv8323::TDRIVE_4000ns);
	drv1.EnableCBC();
	drv1.DisableCPUV();
	drv1.EnableCPUV();
	drv1.DisableGDF();
	drv1.EnableGDF();
	drv1.EnableOTW();
	drv1.DisableOTW();
	drv1.SetPWMMode(Drv8323::PWM_MODE_6X);
	drv1.SetDeadTime(Drv8323::DEADTIME_100ns);
	drv1.SetOCPMode(Drv8323::OCP_RETRY_FAULT);
	drv1.SetOCPDeglitch(Drv8323::OCP_DEG_4us);
	drv1.SetVDSLevel(Drv8323::VDS_LVL_060V);
	drv1.EnableVREFDiv();
	drv1.SetCSAGain(Drv8323::CSA_GAIN_40VV);
	drv1.SetOCPSenseLevel(Drv8323::SEN_LVL_100V);

	drv1.ModifyReg(0x6, Drv8323::CSA_CAL_A|Drv8323::CSA_CAL_B|Drv8323::CSA_CAL_C, Drv8323::CSA_CAL_A|Drv8323::CSA_CAL_B|Drv8323::CSA_CAL_C);
	HAL_Delay(500);
	drv1.ModifyReg(0x6, Drv8323::CSA_CAL_A|Drv8323::CSA_CAL_B|Drv8323::CSA_CAL_C, 0);

	printf("DRV1: \n");
	drv1.DumpRegs();


	pwm3.Callback_PWMCC(CallbackPWMCC);
	pwm3.Start();

	encoder_z.Callback([&](){ p_encoder->CallbackIndex(); });
	pwm4.Start();

	adc1.Start();
	adc2.Start();
	adc3.Start();


#ifdef USE_6STEP
	pwm1.SetThrottle(0.35);
	adc.CallbackJEOS(&pwm1, &PWM6Step::HandleCurrentJEOS);
	adc_current.CallbackJEOS(&pwm1, &PWM6Step::HandleCurrentJEOS);
	adc_current.Start();
#else
	pwm1.SetElectricalRotationsPerSecond(Frequency::from_millihertz(500 * PWMSine::M2E_RATIO));
	pwm1.SetThrottle(0.05);
	adc1.CallbackJEOS([=](int32_t *injdata, size_t size){pwm1.HandleCurrentJEOS(injdata, 0, size);});
	adc2.CallbackJEOS([=](int32_t *injdata, size_t size){pwm1.HandleCurrentJEOS(injdata, 1, size);});
	adc3.CallbackJEOS([=](int32_t *injdata, size_t size){pwm1.HandleCurrentJEOS(injdata, 2, size);});
#endif

	PWM6Step::LogEntry log;

#ifdef TEST_RS485
	std::string rs485_test = "Do you see this? From RS485 ...\n";
	usart2.WriteDMA(rs485_test.c_str(), rs485_test.size());
	char buf[128];
	int ret = 0;
	HAL_Delay(100UL);
	if ((ret = usart3.ReadDMA(buf, sizeof(buf))) > 0) {
		std::string echo(buf, ret);
		std::cout << echo;
	}
#endif

	while (1) {
		std::string tmp;
		vTaskDelay(10 / portTICK_RATE_MS);
		led_status.Toggle();
		led_warn.Write(pwm1.IsEnabledCounter());

//#define ECHO_TEST

#ifdef ECHO_TEST
		char buf[128];
		int ret = 0;
		if ((ret = ptrUsart1->ReadDMA(buf, sizeof(buf))) > 0) {
			std::string echo(buf, ret);
			std::cout << echo;
		}
#endif

		if (drv_fault.Read() == 0) {
			pwm1.Stop();
#ifdef DUMP_DRV_FAULT
			printf("Driver Fault Detected: \n");
			drv1.DumpRegs();
#endif
			drv1.ClearFault();

		}

		count++;

#ifdef DUMP_MINAS_A4_STATE
		if (count % 20 == 0 && !!ma4_abs_encoder_ptr) {
			printf("Servo Angle: %3.4f\n", ma4_abs_encoder_ptr->get_absolute_angle_deg());
			printf("Servo Revs:  %u\n", ma4_abs_encoder_ptr->get_revolutions());
			MA4Almc almc = ma4_abs_encoder_ptr->get_last_error();
			printf("OS: %u, FS: %u, CE: %u, OF: %u, ME: %u, SYD: %u, BA: %u\n\n",
					almc.overspeed_, almc.full_abs_status_, almc.count_error_,
					almc.counter_overflow_, almc.multiple_revolution_error_, almc.system_down_,
					almc.battery_alarm_);
		}
#endif

#ifdef USE_6STEP
		if (pwm1.log_entry_.serial_ != log.serial_) {
			__disable_irq();
			log = pwm1.log_entry_;
			__enable_irq();

			uint32_t hz = (uint32_t) (pwm1.GetSwitchingFrequency() / log.last_counter_ / PWM6Step::M2E_RATIO / PWM6Step::SINE_STATES).hertz();

			printf("%1lu: Speed: %5lu, slp: %7ld, incpt: %5ld, ibemf: %5ld, zero_c: %3ld (%3ld), %2d->[%6ld %6ld %6ld ] %2d->[%6ld %6ld %6ld], Current: [%6ld %6ld %6ld %6ld]\n",
					log.state_,
					hz,
					log.bemf_mslope_,
					log.bemf_intercept_,
					log.integral_bemf_,
					log.zero_crossing_,
					log.last_counter_,
					pwm1.adc_data_counter1,
					log.adc_data1_[0],
					log.adc_data1_[1],
					log.adc_data1_[2],
					pwm1.adc_data_counter2,
					log.adc_data2_[0],
					log.adc_data2_[1],
					log.adc_data2_[2],
					log.adc_current_[0],
					log.adc_current_[1],
					log.adc_current_[2],
					log.adc_current_[3]

			);

		}

//		pwm1.SetThrottle(pwm3.GetPulseLength().seconds_float() * 1000.0 - 0.7);



#endif

//		std::cout << "Counter: " << pwm1.GetCounterValue() << std::endl;
//		std::cout << "PWM: " << pwm3.GetPulseLength().seconds_float() * 1000.0 << " mSec, (Pulse/Period): " << pwm3.GetPWMPulse() << " / " << pwm3.GetPWMPeriod() << std::endl;

#if 0
		new_decoder_value = (pwm4.GetPosition() >> 2);
		if (new_decoder_value != old_decoder_value) {
			old_decoder_value = new_decoder_value;
			std::cout << jiffies << " : " << old_decoder_value;

			if (new_encoder_idx != old_encoder_idx) {
				old_encoder_idx = new_encoder_idx;
				std::cout << " (Encoder Z)";
			}

			std::cout << std::endl;
		}
#endif

	}

}

int main(int argc, char* argv[])
{
	InterruptManager& im = InterruptManager::instance();

	TaskHandle_t main_task_handle = 0;
	TaskHandle_t encoder_reader_task_handle = 0;

	vTaskSuspendAll();

	/* Create tasks */
	xTaskCreate(
			main_task, /* Function pointer */
			"main_task", /* Task name - for debugging only*/
			4 * configMINIMAL_STACK_SIZE, /* Stack depth in words */
			(void*) NULL, /* Pointer to tasks arguments (parameter) */
			tskIDLE_PRIORITY + 3UL, /* Task priority*/
			&main_task_handle /* Task handle */
	);

	xTaskCreate(
			encoder_reader_task, /* Function pointer */
			"encoder_reader_task", /* Task name - for debugging only*/
			4 * configMINIMAL_STACK_SIZE, /* Stack depth in words */
			(void*) NULL, /* Pointer to tasks arguments (parameter) */
			tskIDLE_PRIORITY + 1UL, /* Task priority*/
			&encoder_reader_task_handle /* Task handle */
	);

	im.VectorHandler(SVCall_IRQn, vPortSVCHandler);
	im.VectorHandler(PendSV_IRQn, xPortPendSVHandler);
	im.VectorHandler(SysTick_IRQn, xPortSysTickHandler);

	xTaskResumeAll();

	vTaskStartScheduler();
	vTaskSuspendAll();

#if defined(DEBUG)
  __DEBUG_BKPT();
#endif
	while(1) {
	}
}


extern "C" void
HardFault_Handler_C (ExceptionStackFrame* frame __attribute__((unused)),
                     uint32_t lr __attribute__((unused)))
{
	emergency_stop();



#if defined(TRACE)
  uint32_t mmfar = SCB->MMFAR; // MemManage Fault Address
  uint32_t bfar = SCB->BFAR; // Bus Fault Address
  uint32_t cfsr = SCB->CFSR; // Configurable Fault Status Registers
#endif

#if defined(OS_USE_SEMIHOSTING) || defined(OS_USE_TRACE_SEMIHOSTING_STDOUT) || defined(OS_USE_TRACE_SEMIHOSTING_DEBUG)

  // If the BKPT instruction is executed with C_DEBUGEN == 0 and MON_EN == 0,
  // it will cause the processor to enter a HardFault exception, with DEBUGEVT
  // in the Hard Fault Status register (HFSR) set to 1, and BKPT in the
  // Debug Fault Status register (DFSR) also set to 1.

  if (((SCB->DFSR & SCB_DFSR_BKPT_Msk) != 0)
      && ((SCB->HFSR & SCB_HFSR_DEBUGEVT_Msk) != 0))
    {
      if (isSemihosting (frame, 0xBE00 + (AngelSWI & 0xFF)))
        {
          // Clear the exception cause in exception status.
          SCB->HFSR = SCB_HFSR_DEBUGEVT_Msk;

          // Continue after the BKPT
          return;
        }
    }

#endif

#if defined(TRACE)
  trace_printf ("[HardFault]\n");
  dumpExceptionStack (frame, cfsr, mmfar, bfar, lr);
#endif // defined(TRACE)

#if defined(DEBUG)
  __DEBUG_BKPT();
#endif
  while (1)
    {
    }
}

#pragma GCC diagnostic pop

// ----------------------------------------------------------------------------
