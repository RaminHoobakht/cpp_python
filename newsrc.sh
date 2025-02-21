#! /bin/bash

clear
ls -ls archive/src_*
echo "enter file number: "
read -r file_no

git add --all
git commit -m 'before creating new source file'

mv src/ archive/src_"$file_no"
cp CMakeLists.txt archive/src_"$file_no"/
cp cmake_default.txt CMakeLists.txt

mkdir src
mkdir src/app
mkdir src/header

now="$(date +"%T")"

printf '%s\n' "#include <iostream>
#include \"../header/main.hpp\"


int main() {



    std::cout << \"\n #($now): The End ...\" << std::endl;
    return EXIT_SUCCESS;
}" >> src/app/main.cpp

printf '%s\n' "#ifndef HEADER_MAIN_CPP
#define HEADER_MAIN_CPP

#include <iostream>

#define NL '\n'
#define SP '\x20'

namespace util {

    constexpr size_t min{0LLU};

    void separator(size_t, char) noexcept;


    void separator(const size_t no = 64, const char ch = '-') noexcept {
        for (size_t i{min}; i < no; ++i) {
            std::cout << ch;
        }
        std::cout << NL;
    }


} // namespace util

#endif /* HEADER_MAIN_CPP */" >> src/header/main.hpp

git add --all
git commit -m 'after creating new source file'

