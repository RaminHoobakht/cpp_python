#include <iostream>
#include <python3.12/Python.h>


int main(int argc, char **argv) {

    std::cout << "Number of arguments are: " << argc << '\n';

    Py_Initialize();

    PyStatus status{};
    PyConfig config{};
    PyConfig_InitPythonConfig(&config);

    /* optional but recommended */
    status = PyConfig_SetBytesString(&config, &config.program_name, argv[0]);
    if (PyStatus_Exception(status)) {
        goto exception;
    }
    PyConfig_Clear(&config);

    /* ------------------------------------------------------ */

    std::clog << "first python invocation ..." << '\n';

    PyRun_SimpleString("from time import time, ctime\n\n"
                       "if __name__ == \"__main__\":"
                       "    print(\"To Day is: \", ctime(time()))");

    std::clog << "second python invocation ..." << '\n';

    PyRun_SimpleString("print('Hello Python ...')");

    std::clog << "the end of python process ..." << '\n';


    /* ------------------------------------------------------ */

    if (Py_FinalizeEx() < 0) {
        exit(120);
    }

    std::clog << "step 3 ..." << '\n';

exception:
    PyConfig_Clear(&config);
    Py_ExitStatusException(status);

    std::cout << "\n #(00:00:00): The End ..." << std::endl;
    return (EXIT_SUCCESS);
}
