#include "include/lynxscript.hpp"
#include <iostream>
#include <string>

static void repl()
{
	std::cout << "LynxScript REPL\n";
	std::cout << "LynxScript version " << LYNXSCRIPT_VERSION_STRING << "\n";

	char line[1024];
	for (;;)
	{
		std::cout << "> ";
		std::cin.getline(line, 1024);
		lxExecuteScript(line);
	}
}

static void errorCallback(int code)
{
	fprintf(stderr, "Error code %d\n", code);
}

int main(int argc, const char* argv[])
{
	lxInitVM();
	lxSetErrorCallback(errorCallback);

	if (argc == 1)
		repl();
	else if (argc == 2)
		lxExecuteFile(argv[1]);
	else
	{
		fprintf(stderr, "Usage: lxscript [path]\n");
		exit(64);
	}

	lxFreeVM();
	return 0;
}