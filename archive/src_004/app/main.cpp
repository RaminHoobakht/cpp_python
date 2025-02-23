#include "../header/main.hpp"
#include <iostream>
#include <python3.12/Python.h>

int main(int argc, char **argv) {


    const std::string python_command{"print('this is python call from C++')"};
    constexpr int FEX{120};
    std::cout << "Number of the argument is: " << argc << NL;

    PyStatus status{};
    PyConfig config{};
    PyConfig_InitPythonConfig(&config);
    status = PyConfig_SetBytesString(&config, &config.program_name, argv[0]);

    if (PyStatus_Exception(status)) {
        PyConfig_Clear(&config);
        /* below line cause terminate the program */
        Py_ExitStatusException(status);
    }

    /* -------------------------- */

    PyConfig_Clear(&config);
    Py_Initialize();

    /* -------------------------- */

    PyRun_SimpleString(python_command.c_str());

    /* -------------------------- */

    if (Py_FinalizeEx() < 0) {
        std::cerr << "error in python finalize ..." << NL;
        exit(FEX);
    }

    std::cout << "\n #(03:34:48): The End ..." << std::endl;
    return EXIT_SUCCESS;
}
