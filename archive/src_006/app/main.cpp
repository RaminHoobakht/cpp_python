#include "../header/main.hpp"
#include <iostream>
#include <python3.12/Python.h>

int main(int argc, char **argv) {

    if (argc == 0)
        exit(EXIT_FAILURE);

    constexpr auto python_script_file{"src/python/main.py"};
    constexpr auto python_log_file{"src/python/python.log"};
    constexpr auto read_mode{"r"};

    FILE *my_file{fopen(python_script_file, read_mode)};
    if (!my_file) {
        perror(" error in open python script file");
        exit(EXIT_FAILURE);
    }

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

    int result{PyRun_SimpleFile(my_file, python_log_file)};
    std::clog << " value of result is: " << result << NL;

    if (Py_FinalizeEx() < 0) {
        exit(120);
    }

    std::cout << "\n #(08:44:43): The End ..." << std::endl;
    return EXIT_SUCCESS;
}
