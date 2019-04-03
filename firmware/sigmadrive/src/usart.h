#ifndef _USART_H_
#define _USART_H_

#include <stdint.h>
#include <vector>
#include <array>
#include <queue>
#include <string>
#include <stdexcept>

#include "stm32f4xx_ll_usart.h"
#include "stm32f4xx_ll_dma.h"
#include "stm32f4xx_ll_bus.h"
#include "stm32f4xx.h"

#include "gpiopin.h"
#include "pinnames.h"
#include "dma.h"
#include "interruptmanager.h"
#include "ring.h"
#include "digitalout.h"

class USART {
public:
	USART(const std::vector<GPIOPin>& data_pins = {},
			uint32_t baudrate = 230400,
			USART_TypeDef* usart_device = USART1,
			DMA_TypeDef *dma_device = DMA2,
			uint32_t tx_stream = LL_DMA_STREAM_7,
			uint32_t rx_stream = LL_DMA_STREAM_5,
			uint32_t dma_channel = LL_DMA_CHANNEL_4,
			uint32_t hwflowctrl = LL_USART_HWCONTROL_NONE,
			uint32_t irq_priority = 0,
			uint32_t dma_irq_priority = 0);
	virtual ~USART();

	void Enable(void)			{ LL_USART_Enable(USARTx_); }
	void Disable(void)			{ LL_USART_Disable(USARTx_); }
	bool IsEnable(void)			{ return LL_USART_IsEnabled(USARTx_) ? true : false; }

	ssize_t Write(const char* buf, size_t nbytes);
	ssize_t WriteDMA(const char* buf, size_t nbytes);
	ssize_t ReadDMA(char* buf, size_t nbytes);
	ssize_t ReadDMAOrBlock(char* buf, size_t nbytes);
	size_t GetRxSize();
	std::string Read();
	void Write(const std::string& str);


private:
	void EnableDMAReq_TX(void)	{ LL_USART_EnableDMAReq_TX(USARTx_); }
	void EnableDMAReq_RX(void)	{ LL_USART_EnableDMAReq_RX(USARTx_); }
	void DisableDMAReq_TX(void)	{ LL_USART_DisableDMAReq_TX(USARTx_); }
	void DisableDMAReq_RX(void)	{ LL_USART_DisableDMAReq_RX(USARTx_); }
	void CallbackTX_DmaTC(void);
	void StartDmaRx();
	void StartDmaTx(size_t nbytes);
	void IrqHandlerUSART(void);

protected:
	virtual void OnTxBegin(void) { };
	virtual void OnTxComplete(void) { };

public:
	Ring<char, 256> output_queue_;
	Ring<char, 2048> input_queue_;
	USART_TypeDef* USARTx_;
	Dma dma_tx_;
	Dma dma_rx_;
	volatile size_t outputNDT_ = 0;
};

#endif /* _USART_H_ */
