#include "../header/main.hpp"
#include <iostream>
#include <python3.12/Python.h>

int main(int argc, char **argv) {

    std::cout << "number of args are: " << argc << NL;
    constexpr auto *python_file_name{"src/python/main.py"};
    constexpr auto *read_mode{"r"};

    FILE *my_file;
    my_file = fopen(python_file_name, read_mode);


    PyStatus status{};
    PyConfig config{};
    PyConfig_InitPythonConfig(&config);

    /* ------------------------------ */

    status = PyConfig_SetBytesString(&config, &config.program_name, argv[0]);
    if (PyStatus_Exception(status)) {
        PyConfig_Clear(&config);
        Py_ExitStatusException(status);
    }

    /* ------------------------------ */

    PyConfig_Clear(&config);
    Py_Initialize();

    /* ------------------------------  */

    // PyRun_SimpleString("print('Hello Python ...')");

    PyRun_SimpleFile(my_file, "src/python/");
    fclose(my_file);

    /* ------------------------------  */


    if (Py_FinalizeEx() < 0) {
        exit(120);
    }


    std::cout << "\n #(02:01:33): The End ..." << std::endl;
    return EXIT_SUCCESS;
}
