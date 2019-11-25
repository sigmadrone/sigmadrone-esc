/*
 * scheduler.h
 *
 *  Created on: Nov 22, 2019
 *      Author: mstoilov
 */

#ifndef _SCHEDULER_H_
#define _SCHEDULER_H_

#include "cmsis_os2.h"
#include "FreeRTOS.h"
#include "task.h"

#include <functional>
#include <deque>

class Scheduler {
public:
	Scheduler();
	virtual ~Scheduler();

	void StartDispatcherThread();
	void Abort();
	void Run();
	void RunWaitForCompletion();
	bool IsDispatching();
	void SetIdleTask(const std::function<void(void)>& task);
	void AddTask(const std::function<void(void)>& task);
	void RunSchedulerLoop();
	void SignalThreadUpdate();
	void SignalThreadTask();
	void SignalThreadAbort();
	void EventThreadIdle();

	bool WaitSignalUpdate(uint32_t timeout_msec);
	bool WaitSignalTask(uint32_t timeout_msec);
	bool WaitSignalAbort(uint32_t timeout_msec);
	bool WaitEventIdle(uint32_t timeout_msec);

	static const uint32_t THREAD_FLAG_TASK = (1u << 0);
	static const uint32_t THREAD_FLAG_UPDATE = (1u << 1);
	static const uint32_t THREAD_FLAG_ABORT = (1u << 2);
	static const uint32_t EVENT_FLAG_IDLE = (1u << 3);

	uint32_t WaitSignals(uint32_t s, uint32_t timeout_msec);
	uint32_t WaitEvents(osEventFlagsId_t event, uint32_t s, uint32_t timeout_msec);

	uint32_t wait_timeout_ = (uint32_t)-1;
	osThreadId_t scheduler_thread_id_ = 0;

protected:
	uint32_t run_idle_ms_ = 20;
	bool dispatching_ = false;
	std::function<void(void)> idle_task_;
	osEventFlagsId_t event_dispatcher_idle_;
	std::deque<std::function<void(void)>> dispatch_queue_;

};

#endif /* _SCHEDULER_H_ */
