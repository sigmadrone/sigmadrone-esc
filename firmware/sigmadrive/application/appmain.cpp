#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stddef.h>
#include <iostream>
#include <cstring>
#include <string>
#include <vector>
#include <type_traits>
#include <algorithm>
#include <iterator>
#include <assert.h>
#include "cmsis_os2.h"
#include "FreeRTOS.h"
#include "FreeRTOSConfig.h"
#include "task.h"

#include "main.h"
#include "appmain.h"
#include "command_task.h"


#include "adc.h"
#include "uart.h"
#include "spimaster.h"
#include "drv8323.h"
#include "exti.h"
#include "pwm_generator.h"
#include "quadrature_encoder.h"
#include "servo_drive.h"
#include "ring.h"
#include "cdc_iface.h"
#include "rpcproperty.h"

#define MOTOR_POLE_PAIRS 7

osThreadId_t commandTaskHandle;
Adc adc1;
Uart uart1;
SPIMaster spi3;
PwmGenerator tim1;
CdcIface usb_cdc;
QuadratureEncoder tim4(0x2000, MOTOR_POLE_PAIRS);
Drv8323 drv1(spi3, GPIOC, GPIO_PIN_13);
Drv8323 drv2(spi3, GPIOC, GPIO_PIN_14);
Exti encoder_z(ENCODER_Z_Pin, []()->void{tim4.CallbackIndex();});
ServoDrive servo(&tim4, &tim1);
std::vector<IServoDrive*> g_motors{&servo};


//RpcProperty props = RpcPropertyMap({
//	{"throttle", RpcProperty(&servo.throttle_)},
//});

float throttle = 0;
//RpcProperty props = RpcPropertyMap({
//	{"throttle", RpcProperty(&throttle, RpcObjectAccess::readwrite)},
//});



//RpcProperty g_properties = RpcPropertyMap{{"0", servo.props_}, };

RpcProperty props =
		RpcPropertyMap {
			{"throttle", RpcProperty(&throttle, RpcObjectAccess::readwrite, [](const rexjson::value& v)->void{}, [](void *ctx)->void{}, nullptr)},
			{"clock_hz", RpcProperty(&SystemCoreClock, RpcObjectAccess::readonly)},
			{"servo", RpcPropertyArray({servo.props_})},
		};
RpcProperty* g_properties = &props;


extern "C"
void TIM1_IRQHandler()
{
	if (LL_TIM_IsActiveFlag_UPDATE(htim1.Instance)) {
		LL_TIM_ClearFlag_UPDATE(htim1.Instance);
		servo.PeriodElapsedCallback();
	}

}

void AdcBiasSetup()
{
	drv1.EnableCalibration();
	for (size_t i = 0; i < Adc::ADC_HISTORY_SIZE; i++) {
		vTaskDelay(10 / portTICK_RATE_MS);
		adc1.InjectedSwTrig();
	}
	drv1.DisableCalibration();

	memset(adc1.bias_, 0, sizeof(adc1.bias_));
	for (size_t i = 0; i < Adc::ADC_HISTORY_SIZE; i++) {
		adc1.bias_[0] += adc1.injhistory_[i][0];
		adc1.bias_[1] += adc1.injhistory_[i][1];
		adc1.bias_[2] += adc1.injhistory_[i][2];
	}
	adc1.bias_[0] = adc1.bias_[0]/Adc::ADC_HISTORY_SIZE;
	adc1.bias_[1] = adc1.bias_[1]/Adc::ADC_HISTORY_SIZE;
	adc1.bias_[2] = adc1.bias_[2]/Adc::ADC_HISTORY_SIZE;
}

extern "C"
int application_main()
{
	Exti exti_usr_button(USER_BTN_Pin, []()->void{HAL_GPIO_TogglePin(LED_STATUS_GPIO_Port, LED_STATUS_Pin);});

	/*
	 * Attach the HAL handles to the
	 * C++ wrapper objects. At this point the HAL handles
	 * should be fully initialized.
	 */
	adc1.Attach(&hadc1);
	uart1.Attach(&huart1);
	spi3.Attach(&hspi3);
	tim1.Attach(&htim1);
	tim4.Attach(&htim4);
	usb_cdc.Attach(&hUsbDeviceFS);

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


	fprintf(stderr, "main_task 1\r\n");
	fprintf(stderr, "DRV1: \r\n");
	drv1.DumpRegs();

	AdcBiasSetup();

	osThreadAttr_t commandTask_attributes;
	memset(&commandTask_attributes, 0, sizeof(commandTask_attributes));
	commandTask_attributes.name = "commandTask";
	commandTask_attributes.priority = (osPriority_t) osPriorityNormal;
	commandTask_attributes.stack_size = 16000;
	commandTaskHandle = osThreadNew(StartCommandTask, NULL, &commandTask_attributes);

	uint32_t old_counter = 0, new_counter = 0;

#if 1
	g_properties->EnumChildren("props", [](const std::string& path, RpcProperty& prop)->void{std::cout << path << " : " << prop.GetProp().to_string() << std::endl;});
#endif

	tim4.Start();


//	g_motors.push_back(&servo);

	for (;;) {
//		HAL_Delay(10);
		HAL_GPIO_WritePin(GPIOD, GPIO_PIN_14, GPIO_PIN_RESET);

		std::string *str = new std::string("Counter");

		new_counter = tim4.GetCounter();
		if (new_counter != old_counter) {
//			printf("%s: %lu\n", str->c_str(), new_counter);
			old_counter = new_counter;
		}

		delete str;
//		HAL_Delay(10);
		HAL_GPIO_WritePin(GPIOD, GPIO_PIN_14, GPIO_PIN_SET);
	}

	return 0;
}
