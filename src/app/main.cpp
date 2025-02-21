#include "../header/main.hpp"
#include <iostream>
#include <python3.12/Python.h>


int main(int argc, char **argv) {

    std::cout << "Number of arguments are: " << argc << '\n';

    // Initialize Python configuration
    PyStatus status{};
    PyConfig config{};
    PyConfig_InitPythonConfig(&config);

    // Optional but recommended
    status = PyConfig_SetBytesString(&config, &config.program_name, argv[0]);
    if (PyStatus_Exception(status)) {
        PyConfig_Clear(&config);
        Py_ExitStatusException(status);
        std::cerr << "Error in Python configuration..." << '\n';
        exit(EXIT_FAILURE);
    }

    PyConfig_Clear(&config);
    Py_Initialize();

    // Execute Python code
    PyRun_SimpleString("from time import time, ctime\n"
                       "if __name__ == '__main__':\n"
                       "    print('Today is:', ctime(time()))");

    PyRun_SimpleString("print('Hello Python...')");

    // Finalize the Python interpreter
    if (Py_FinalizeEx() < 0) {
        exit(120);
    }

    std::cout << "\n #(00:20:03): The End ..." << std::endl;
    return (EXIT_SUCCESS);
}
