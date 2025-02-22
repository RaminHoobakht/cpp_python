#include <iostream>
#include <python3.12/Python.h>
#include "../header/main.hpp"

int main(int argc, char **argv) {

    std::cout << "Number of the arguments are: " << argc << NL;
    PyStatus status{};
    PyConfig config{};
    PyConfig_InitPythonConfig(&config);

    status = PyConfig_SetBytesString(&config, &config.program_name, argv[0]);
    if (PyStatus_Exception(status)) {
        PyConfig_Clear(&config);
        Py_ExitStatusException(status);
        // std::cerr << "error in python configuration ..." << NL;
        // exit(EXIT_FAILURE);
    }

    PyConfig_Clear(&config);
    Py_Initialize();

    PyRun_SimpleString("print('I am Python script come from C++')");

    if (Py_FinalizeEx() < 0) {
        std::cerr << "error in python finalize ..." << NL;
        exit(120);
    }

    std::cout << "The End ..." << std::endl;
    return EXIT_SUCCESS;
}
