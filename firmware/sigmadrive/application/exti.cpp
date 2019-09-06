/*
 * Exti.cpp
 *
 *  Created on: Sep 4, 2019
 *      Author: mstoilov
 */

#include "exti.h"

Exti::exti_map_type Exti::map_;

Exti::Exti(uint16_t gpio_pin, const std::function<void(void)>& callback)
	: gpio_pin_(gpio_pin)
{
	set_callback(callback);
}

Exti::~Exti()
{
	exti_map_type::iterator it = map_.find(gpio_pin_);
	if (it != map_.end())
		map_.erase(it);
}

void Exti::set_callback(const std::function<void(void)>& callback)
{
	callback_ = callback;
	map_[gpio_pin_] = this;
}

void Exti::gpio_exti_callback(uint16_t gpio_pin_)
{
	exti_map_type::iterator it = map_.find(gpio_pin_);
	if (it != map_.end())
		it->second->callback_();
}

extern "C" void HAL_GPIO_EXTI_Callback(uint16_t pin)
{
	Exti::gpio_exti_callback(pin);
}
