#include <iostream>
#include <python3.12/Python.h>


int main(int argc, char **argv) {

    std::cout << "Number of arguments are: " << argc << '\n';

    PyStatus status{};
    PyConfig config{};
    PyConfig_InitPythonConfig(&config);

    /* optional but recommended */
    status = PyConfig_SetBytesString(&config, &config.program_name, argv[0]);

    if (PyStatus_Exception(status)) {
        PyConfig_Clear(&config);
        Py_ExitStatusException(status);
        std::cerr << "error in config python ..." << '\n';
        exit(EXIT_SUCCESS);
    }

    PyConfig_Clear(&config);

    Py_Initialize();

    /* ------------------------------------------------------ */

    PyRun_SimpleString("from time import time, ctime\n\n"
                       "if __name__ == \"__main__\":"
                       "    print(\"To Day is: \", ctime(time()))");

    PyRun_SimpleString("print('Hello Python ...')");


    /* ------------------------------------------------------ */

    if (Py_FinalizeEx() < 0) {
        exit(120);
    }

    std::cout << "\n #(00:00:00): The End ..." << std::endl;
    return (EXIT_SUCCESS);
}
