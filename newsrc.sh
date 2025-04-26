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

printf '%s\n' "/* Subject:   */

#include \"main.hpp\"


int main() {


    out << \"\n #($now): The End ...\" << eln;
    return EXIT_SUCCESS;
}" >> src/app/main.cpp

### ----------------------------------------------

printf '%s\n' "/*   */

#pragma once

#include \"../header/testmodule.hpp\"
#include \"../header/utillib.hpp\"


" >> src/app/main.hpp

### ----------------------------------------------

printf '%s\n' "#ifndef HEADER_MAIN_CPP
#define HEADER_MAIN_CPP

#include <cstring>
#include <ios>
#include <iostream>
#include <string>
#include <typeinfo>

constexpr char NL{'\n'};
constexpr char RT{'\r'};
constexpr char SP{'\x20'};

#define out
    std::cout << std::boolalpha;                                               \
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

    template<typename T>
    const char *data_type_name(T dt) noexcept {

        const char *dts{typeid(dt).name()};

        if (std::strcmp(dts, \"c\") == 0) {
            return \"char\";
        } else if (std::strcmp(dts, \"h\") == 0) {
            return \"unsigned char\";
        } else if (std::strcmp(dts, \"i\") == 0) {
            return \"signed integer\";
        } else if (std::strcmp(dts, \"j\") == 0) {
            return \"unsigned integer\";
        } else if (std::strcmp(dts, \"l\") == 0) {
            return \"signed long int\";
        } else if (std::strcmp(dts, \"m\") == 0) {
            return \"unsigend long int\";
        } else if (std::strcmp(dts, \"x\") == 0) {
            return \"signed long long int \";
        } else if (std::strcmp(dts, \"y\") == 0) {
            return \"unsigned long long int\";
        } else if (std::strcmp(dts, \"f\") == 0) {
            return \"float\";
        } else if (std::strcmp(dts, \"d\") == 0) {
            return \"double\";
        } else if (std::strcmp(dts, \"e\") == 0) {
            return \"long double\";
        } else if (std::strcmp(dts, \"pc\") == 0) {
            return \"pinter char\";
        } else if (std::strcmp(dts, \"ph\") == 0) {
            return \"pinter unsigned char\";
        } else if (std::strcmp(dts, \"pi\") == 0) {
            return \"pinter signed integer\";
        } else if (std::strcmp(dts, \"pj\") == 0) {
            return \"pinter unsigned integer\";
        } else if (std::strcmp(dts, \"pl\") == 0) {
            return \"pinter signed long int\";
        } else if (std::strcmp(dts, \"pm\") == 0) {
            return \"pinter unsigend long int\";
        } else if (std::strcmp(dts, \"px\") == 0) {
            return \"pinter signed long long int\";
        } else if (std::strcmp(dts, \"py\") == 0) {
            return \"pinter unsigned long long int\";
        } else if (std::strcmp(dts, \"pf\") == 0) {
            return \"pinter float\";
        } else if (std::strcmp(dts, \"pd\") == 0) {
            return \"pinter double\";
        } else if (std::strcmp(dts, \"pe\") == 0) {
            return \"pinter long double\";
        } else if (std::strcmp(dts, \"ppc\") == 0) {
            return \"pinter pinter char\";
        } else if (std::strcmp(dts, \"pph\") == 0) {
            return \"pinter pinter unsigned char\";
        } else if (std::strcmp(dts, \"ppi\") == 0) {
            return \"pinter pinter signed integer\";
        } else if (std::strcmp(dts, \"ppj\") == 0) {
            return \"pinter pinter unsigned integer\";
        } else if (std::strcmp(dts, \"ppl\") == 0) {
            return \"pinter pinter signed long int\";
        } else if (std::strcmp(dts, \"ppm\") == 0) {
            return \"pinter pinter unsigend long int\";
        } else if (std::strcmp(dts, \"ppx\") == 0) {
            return \"pinter pinter signed long long int\";
        } else if (std::strcmp(dts, \"ppy\") == 0) {
            return \"pinter pinter unsigned long long int\";
        } else if (std::strcmp(dts, \"ppf\") == 0) {
            return \"pinter pinter float\";
        } else if (std::strcmp(dts, \"ppd\") == 0) {
            return \"pinter pinter double\";
        } else if (std::strcmp(dts, \"ppe\") == 0) {
            return \"pinter pinter long double\";
        } else {
            return \"unknown data-type\";
        }
    }

    /* -------------------------------------------------- */

    class publicexception;

} // namespace util

#endif /* HEADER_MAIN_CPP */" >> src/header/utillib.hpp

### ----------------------------------------------

printf '%s\n' "#include \"utillib.hpp\"

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

### ----------------------------------------------

printf '%s\n' "#ifndef HEADER_TEST_MODULE_HPP
#define HEADER_TEST_MODULE_HPP

/* declaration */
namespace cpp {



} // namespace cpp

#endif /* HEADER_TEST_MODULE_HPP */" >> src/header/testmodule.hpp

### ----------------------------------------------

printf '%s\n' "#include \"testmodule.hpp\"

/* definition */
namespace cpp {



} // namespace cpp


" >> src/header/testmodule.cpp


git add --all
git commit -m 'after creating new source file'

