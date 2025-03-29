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

printf '%s\n' "/*  */

#include \"../header/utillib.hpp\"
#include <iostream>


int main() {


    std::cout << \"\n #($now): The End ...\" << std::endl;
    return EXIT_SUCCESS;
}" >> src/app/main.cpp

### ----------------------------------------------

printf '%s\n' "#ifndef HEADER_MAIN_CPP
#define HEADER_MAIN_CPP

#include <iostream>
#include <string>

#define NL '\n'
#define RT '\r'
#define SP '\x20'
#define LINEFEED std::cout << NL
#define SEP util::separator()

namespace util {

    constexpr size_t zero{0LU};

    /* -------------------------------------------------- */

    void separator(const size_t no = 64LU, const char ch = '-') noexcept;

    std::string &trim(std::string &str, bool right, bool left) noexcept;

    /* -------------------------------------------------- */

    class publicexception;
    
} // namespace util

#endif /* HEADER_MAIN_CPP */" >> src/header/utillib.hpp

### ----------------------------------------------

printf '%s\n' "#include \"../header/utillib.hpp\"

namespace util {


    void separator(const size_t no, const char ch) noexcept {
        for (size_t i{zero}; i < no; ++i) {
            std::cout << ch;
        }
        std::cout << NL;
    }

    std::string &trim(std::string &str, const bool right,
                      const bool left) noexcept {

        if (right) {
            while (str[0] < 33) {
                str.erase(0, 1);
            }
        }

        if (left) {
            while (str[str.size() - 1] < 33) {
                str.erase(str.size() - 1, 1);
            }
        }

        return str;
    }


    /* -------------------------------------------------- */

    class publicexception final : public std::exception {
    private:
        std::string message_{};

    public:
        explicit publicexception(std::string message) :
            message_(std::move(message)) {}

        // publicexception(const exception &exception, std::string message) :
        //     std::exception(exception), message_(std::move(message)) {}

        // publicexception(exception &&exception, std::string message) :
        //     std::exception(exception), message_(std::move(message)) {}

        [[nodiscard]] const char *what() const noexcept override {
            return this->message_.c_str();
        }
    };

} // namespace util " >> src/header/utillib.cpp

git add --all
git commit -m 'after creating new source file'

