#include "../header/main.hpp"
#include <iostream>
#include <python3.12/Python.h>

int main(const int argc, char **argv) {
    /* Code */

    if (argc < 1) {
        std::cerr << "invalid parameter ..." << NL;
        exit(EXIT_FAILURE);
    }

    constexpr auto script_file_name{"src/python/main.py"};
    constexpr auto log_file_name{"src/python/python.log"};
    constexpr auto read_mode{"r"};

    FILE *py_file{};
    py_file = fopen(script_file_name, read_mode);
    if (!py_file) {
        perror("error in open file");
        exit(EXIT_SUCCESS);
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

    if (PyRun_SimpleFile(py_file, log_file_name) < 0) {
        std::cerr << "error in run python script ..." << NL;
    }

    if (Py_FinalizeEx() < 0) {
        std::cerr << "error in python finalizing ..." << NL;
    }

    std::cout << "\nThe End ..." << std::endl;
    return EXIT_SUCCESS;
}
