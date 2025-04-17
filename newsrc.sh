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

printf '%s\n' "/*   */

#include \"main.hpp\"


int main() {


    out << \"\n #($now): The End ...\" << end;
    return EXIT_SUCCESS;
}" >> src/app/main.cpp

### ----------------------------------------------

printf '%s\n' "/*   */

#include \"../header/utillib.hpp\"


" >> src/app/main.hpp

### ----------------------------------------------

printf '%s\n' "#ifndef HEADER_MAIN_CPP
#define HEADER_MAIN_CPP

#include <iostream>
#include <ios>
#include <string>

constexpr char NL{'\n'};
constexpr char RT{'\r'};
constexpr char SP{'\x20'};

#define out                                                                    \
    std::cout << std::fixed;                                                   \
    std::cout << SP
#define log                                                                    \
    std::cout << std::fixed;                                                   \
    std::clog << SP
#define err                                                                    \
    std::cout << std::fixed;                                                   \
    std::cerr << SP
#define eln	std::endl    
#define cin std::cin

#define LF std::cout << NL
#define SEP util::separator()
#define LF_SEP util::lf_separator()
#define LF_SEP_LF util::lf_separator_lf()

using str = std::string;
using cstr = const std::string;
using rstr = std::string &;
using crstr = const std::string &;

namespace util {

    constexpr size_t zero{0LU};

    /* -------------------------------------------------- */

    void separator(size_t no = 64LU, char ch = '-') noexcept;
    void lf_separator(size_t no = 64LU, char ch = '-') noexcept;
    void lf_separator_lf(size_t no = 64LU, char ch = '-') noexcept;

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

    void lf_separator(const size_t no, const char ch) noexcept {
        LF;
        for (size_t i{zero}; i < no; ++i) {
            std::cout << ch;
        }
        std::cout << NL;
    }

    void lf_separator_lf(const size_t no, const char ch) noexcept {
        LF;
        for (size_t i{zero}; i < no; ++i) {
            std::cout << ch;
        }
        std::cout << NL;
        LF;
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

