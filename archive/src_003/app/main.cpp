#include <iostream>
#include <python3.12/Python.h>


int main(int argc, char **argv) {

    int s{1};
    PyObject *g{PyDict_New()};
    PyObject *l{PyDict_New()};
    constexpr int FEC{120};

    std::cout << "Number of argument are: " << argc << '\n';

    PyStatus status{};
    PyConfig config{};
    PyConfig_InitPythonConfig(&config);

    status = PyConfig_SetBytesString(&config, &config.program_name, argv[0]);
    if (PyStatus_Exception(status)) {
        PyConfig_Clear(&config);
        Py_ExitStatusException(status);
    }

    PyConfig_Clear(&config);
    Py_Initialize();

    /* ------------------------------------------- */

    PyRun_StringFlags("print('Hello Python ...')", s, g, l, NULL);


    /* ------------------------------------------- */


    if (Py_FinalizeEx() < 0) {
        std::cerr << "error in python finalize ..." << '\n';
        exit(FEC);
    }


    std::cout << "The End ..." << std::endl;
    return EXIT_SUCCESS;
}
