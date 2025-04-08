#! /bin/bash

clear
ls -ltrh archive
echo "enter file number: "
read -r fileno

git add --all
git commit -m 'before creating new source file'

mv src/app/main.cpp archive/main_"$fileno".cpp

now="$(date +"%T")"

printf '%s\n' "/*  */

#include \"../header/utillib.hpp\"
#include <iostream>

#define out std::cout
#define log std::clog
#define err std::cerr


int main() {


    std::cout << \"\n #($now): The End ...\" << std::endl;
    return EXIT_SUCCESS;
}" >> src/app/main.cpp

git add --all
git commit -m 'before creating new source file'

