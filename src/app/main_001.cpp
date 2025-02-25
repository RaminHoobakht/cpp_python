#include <iostream>
#include <python3.12/Python.h>
#include "../header/main.hpp"

int main(int argc, char **argv) {

    std::clog << "passing 1 ..............." << NL;

    if (argc != 1)
        exit(EXIT_FAILURE);

    std::clog << "passing 2 ..............." << NL;

    // int start{1};
    // PyObject *globals = PyDict_New();
    // PyObject *locals = PyDict_New();

    PyObject *globals = PyDict_New();
    PyObject *locals = PyDict_New();

    std::clog << "passing 3 ..............." << NL;

    PyStatus status{};
    PyConfig config{};
    PyConfig_InitPythonConfig(&config);

    std::clog << "passing 4 ..............." << NL;

    status = PyConfig_SetBytesString(&config, &config.program_name, argv[0]);
    if (PyStatus_Exception(status)) {
        std::cerr << "error in python configurtaion ..." << NL;
        PyConfig_Clear(&config);
        Py_ExitStatusException(status);
    }

    std::clog << "passing 5 ..............." << NL;

    Py_DECREF(globals);
    Py_DECREF(locals);


    // PyConfig_Clear(&config);
    // Py_Initialize();
    //
    // std::clog << "step 1 ..............." << NL;
    //
    // constexpr auto code{"print('Hello from python ...')\n"
    //"x = 42\n"
    //"print('The value of x is: ', x)\n"};
    //
    // std::clog << "step 2 ..............." << NL;
    //
    // PyObject *result{PyRun_StringFlags(code, start, globals, locals, NULL)};
    //
    // std::clog << "step 3 ..............." << NL;
    //
    // if (!result) {
    // PyErr_Print();
    // std::cerr << "error in python code ..." << NL;
    //} else {
    // std::clog << "python code was executed successfully ..." << NL;
    //}
    //
    // std::clog << "step 4 ..............." << NL;
    //
    // Py_XDECREF(result);
    // Py_DECREF(globals);
    // Py_DECREF(locals);
    //
    // std::clog << "step 5 ..............." << NL;
    //
    // if (Py_FinalizeEx() < 0) {
    // std::cerr << "error in finalize python ..." << NL;
    // exit(EXIT_FAILURE);
    //}
    //
    // std::clog << "step 6 ..............." << NL;
    //
    std::cout << "\n #(20:32:00): The End ..." << std::endl;
    return EXIT_SUCCESS;
}
