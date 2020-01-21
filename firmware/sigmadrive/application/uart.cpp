/*
 * hal_uart.cpp
 *
 *  Created on: Aug 30, 2019
 *      Author: mstoilov
 */

#include <assert.h>
#include "uart.h"
#include "dcache.h"

Uart::handle_map_type Uart::handle_map_;

extern "C" void tx_complete(UART_HandleTypeDef* huart)
{
	Uart* ptr = Uart::handle_map_[huart];
	if (ptr) {
		ptr->TransmitCompleteCallback();
	}
}

extern "C" void rx_complete(UART_HandleTypeDef* huart)
{
	Uart* ptr = Uart::handle_map_[huart];
	if (ptr) {
		ptr->ReceiveCompleteCallback();
	}
}

Uart::Uart()
{
}

Uart::~Uart()
{
	Detach();
}

void Uart::Attach(UART_HandleTypeDef* huart)
{
	huart_ = huart;
	assert(huart_);
	assert(huart_->hdmatx);

	assert(handle_map_.find(huart_) == handle_map_.end());
	handle_map_[huart_] = this;
	huart_->TxCpltCallback = ::tx_complete;

	if (huart_->Init.Mode & UART_MODE_RX) {
		/*
		 * The DMA must be initialized in DMA_CIRCULAR mode.
		 */
		assert(huart_->hdmarx);
		assert(huart_->hdmarx->Init.Mode == DMA_CIRCULAR);

		rx_ringbuf_.reset_wp(0);
		rx_ringbuf_.reset_rp(0);
		HAL_UART_Receive_DMA(huart_, (uint8_t*)rx_ringbuf_.get_write_ptr(), rx_ringbuf_.capacity());
	}
}

void Uart::Detach()
{
	handle_map_type::iterator it = handle_map_.find(huart_);

	HAL_UART_AbortReceive(huart_);

	if (it != handle_map_.end())
		handle_map_.erase(it);
	huart_ = nullptr;
}

size_t Uart::TransmitOnce(const char* buffer, size_t nsize)
{
	uint32_t vector = __get_xPSR() & 0xFF;
	if ((vector && !tx_ringbuf_.space_size()) || !nsize) {
		/* Nothing to send
		 *
		 * or
		 *
		 * If this is called from interrupt and the queue is out of space
		 * just drop the write request.
		 */
		return nsize;
	}

	while (!tx_ringbuf_.write_size())
		;
	nsize = std::min(tx_ringbuf_.write_size(), nsize);
	std::copy(buffer, buffer + nsize, tx_ringbuf_.get_write_ptr());
	tx_ringbuf_.write_update(nsize);
	if (transmitting_)
		return nsize;
	transmitting_ = true;
	if (HAL_UART_Transmit_DMA(huart_, (uint8_t*)tx_ringbuf_.get_read_ptr(), tx_ringbuf_.read_size()) != HAL_OK) {
		transmitting_ = false;
	}

	return nsize;
}

size_t Uart::Transmit(const char* buffer, size_t nsize)
{
	const char *p = buffer;
	size_t size = nsize;
	size_t offset = 0;
	size_t ret = 0;
	while (size) {
		ret = TransmitOnce(p + offset, size);
		offset += ret;
		size -= ret;
	}
	return nsize;
}

size_t Uart::Transmit(const std::string& str)
{
	return Transmit(str.c_str(), str.size());
}

void Uart::TransmitCompleteCallback()
{
	tx_ringbuf_.read_update(huart_->TxXferSize);
	if (tx_ringbuf_.read_size()) {
		if (HAL_UART_Transmit_DMA(huart_, (uint8_t*)tx_ringbuf_.get_read_ptr(), tx_ringbuf_.read_size()) != HAL_OK) {
			transmitting_ = false;
		}
	} else {
		transmitting_ = false;
	}
}

size_t Uart::ReceiveOnce(char* buffer, size_t nsize)
{
	if (!nsize)
		return 0;
	rx_ringbuf_.reset_wp(rx_ringbuf_.capacity() - __HAL_DMA_GET_COUNTER(huart_->hdmarx));
	nsize = std::min(rx_ringbuf_.read_size(), nsize);
	if (nsize) {
		const char *src = rx_ringbuf_.get_read_ptr();
		for (size_t i = 0; i < nsize; i++) {
			buffer[i] = src[i];
			if (buffer[i] == '\n')
				nsize = i + 1;
		}
		rx_ringbuf_.read_update(nsize);
	}
	return nsize;
}

size_t Uart::Receive(char* buffer, size_t nsize)
{
	size_t recvsiz = 0;
	size_t ret = 0;
	size_t offset = 0;
	while (nsize) {
		recvsiz = ReceiveOnce(buffer + offset, nsize);
		if (recvsiz == 0)
			break;
		ret += recvsiz;
		offset += recvsiz;
		nsize -= recvsiz;
	}
	return ret;
}

void Uart::ReceiveCompleteCallback()
{
}
