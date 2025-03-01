#include <iostream>
#include <python3.12/Python.h>

int main(/*int argc, char **argv*/) {

    std::clog << "start init PyObject ..." << '\n';

    int start{1}; // Typically, 1 indicates a single-statement mode
    PyObject *globals = PyDict_New(); // Initialize global dictionary
    PyObject *locals = PyDict_New(); // Initialize local dictionary

    std::clog << "pass the PyObject ... " << '\n';

    // Initialize the Python interpreter
    Py_Initialize();

    // Sample Python code to be executed
    const char *code = "print('Hello from Python...')\n"
                       "x = 42\n"
                       "print('The value of x is:', x)";

    // Execute the Python code using PyRun_StringFlags
    PyObject *result = PyRun_StringFlags(code, start, globals, locals, NULL);

    // Check if the execution returned an error
    if (!result) {
        PyErr_Print(); // Print the error if any
        std::cerr << "Error running Python code..." << std::endl;
    } else {
        std::clog << "Python code executed successfully..." << std::endl;
    }

    // Clean up
    Py_XDECREF(result);
    Py_DECREF(globals);
    Py_DECREF(locals);

    // Finalize the Python interpreter
    if (Py_FinalizeEx() < 0) {
        std::cerr << "Error in Python finalize..." << '\n';
        exit(120);
    }

    std::cout << "The End..." << std::endl;
    return EXIT_SUCCESS;
}
