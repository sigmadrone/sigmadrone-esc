#include <assert.h>
#include <string.h>
#include <sstream>
#include <iterator>
#include <algorithm>
#include "main.h"
#include "unistd.h"
#include "command_task.h"
#include "ClEditLine.h"
#include "ClHistory.h"
#include "ClPort.h"
#include "rexjson++.h"
#include "uartrpcserver.h"

char cl_heap[4096];

extern UartRpcServer rpc_server;

std::string CommandToJson(std::string str)
{
	str.erase(str.begin(), std::find_if(str.begin(), str.end(),
					std::not1(std::ptr_fun<int, int>(std::isspace))));
	if (str.length() && str[0] == '{')
		return str;
	std::istringstream ss(str);
	std::istream_iterator<std::string> it(ss), eos;
	std::string json;
	if (it == eos)
		return json;
	json = "{\"method\" : ";
	json += "\"" + *it++ + "\"";
	json += ", \"params\" : [";
	for (size_t i = 0; it != eos; it++, i++) {
		std::string token = *it; //tokens[i];
		if (i != 0)
			json += ", ";
		if (std::isdigit(token[0]) || token[0] == '.' || token == "true" || token == "false")
			json += token;
		else
			json += "\"" + token + "\"";
	}
	json += "]}";
	return json;
}

extern "C"
void RunCommandTask(void *argument)
{
	*_impure_ptr = *_impure_data_ptr;

	cl_mem_init(cl_heap, sizeof(cl_heap), 100);
	cl_history_init();
	char szBuffer[512];
	int elret;
	/*
	 * wait for input from the terminal.
	 */
//	getchar();
	while (1) {
		if ((elret = cl_editline("sigmadrive # ", szBuffer, sizeof(szBuffer), 15)) > 0) {
			printf("\r\n");
			assert(elret == (int)strlen(szBuffer));
			try {
				std::string str(szBuffer, 0, elret);
				rexjson::value ret = rpc_server.call(CommandToJson(str));
				if (ret["error"].get_type() != rexjson::null_type) {
					std::cout << "ERROR: " << ret["error"]["message"].to_string() << std::endl;
				} else {
					if (ret["result"].get_type() == rexjson::obj_type || ret["result"].get_type() == rexjson::array_type)
						std::cout << ret["result"].write(false, true, 4, 4) << std::endl;
					else
						std::cout << ret["result"].to_string() << std::endl;
				}
			} catch (std::runtime_error& e) {
				std::cout << e.what() << std::endl;
			}
		}
		printf("\r\n");
	}

}
