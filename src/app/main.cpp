#include "../header/main.hpp"
#include <iostream>
#include <python3.12/Python.h>

int main(int argc, char **argv) {

    if (argc < 1) {
        exit(EXIT_FAILURE);
    }

    constexpr auto python_script_file{"src/python/main.py"};
    constexpr auto python_log_file{"src/python/python.log"};
    constexpr auto read_mode{"r"};

    FILE *pfo{fopen(python_script_file, read_mode)};
    if (!pfo) {
        perror("error to open python file");
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

    if (PyRun_SimpleFile(pfo, python_log_file) < 0) {
        std::cerr << "error in run python scritp ..." << NL;
        exit(EXIT_FAILURE);
    }

    if (Py_FinalizeEx() < 0) {
        std::cerr << "error in finalize python ..." << NL;
        exit(EXIT_FAILURE);
    }

    std::cout << "\n #(17:48:01): The End ..." << std::endl;
    return EXIT_SUCCESS;
}
