#! /bin/bash

clear
ls -ls archive
echo "enter file number: "
read -r file_no

git add --all
git commit -m 'before creating new source file'

mv src/app/main.cpp sample/main_"$file_no".cpp

now="$(date +"%T")"

printf '%s\n' "#include <iostream>
#include \"../header/main.hpp\"
#include <python3.12/Python.h>


int main(int argc, char **argv) {



    std::cout << \"\n #($now): The End ...\" << std::endl;
    return EXIT_SUCCESS;
}" >> src/app/main.cpp

git add --all
git commit -m 'after creating new source file'

