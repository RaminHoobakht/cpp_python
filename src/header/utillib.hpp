#ifndef HEADER_MAIN_CPP
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
    std::cout << std::boolalpha;                                               \                                                                    \
    std::cout << std::fixed;                                                   \
    std::cout << SP
#define log                                                                    \
    std::cout << std::fixed;                                                   \
    std::clog << SP
#define err                                                                    \
    std::cout << std::fixed;                                                   \
    std::cerr << SP
#define eln std::endl
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

        if (std::strcmp(dts, "c") == 0) {
            return "char";
        } else if (std::strcmp(dts, "h") == 0) {
            return "unsigned char";
        } else if (std::strcmp(dts, "i") == 0) {
            return "signed integer";
        } else if (std::strcmp(dts, "j") == 0) {
            return "unsigned integer";
        } else if (std::strcmp(dts, "l") == 0) {
            return "signed long int";
        } else if (std::strcmp(dts, "m") == 0) {
            return "unsigend long int";
        } else if (std::strcmp(dts, "x") == 0) {
            return "signed long long int ";
        } else if (std::strcmp(dts, "y") == 0) {
            return "unsigned long long int";
        } else if (std::strcmp(dts, "f") == 0) {
            return "float";
        } else if (std::strcmp(dts, "d") == 0) {
            return "double";
        } else if (std::strcmp(dts, "e") == 0) {
            return "long double";
        } else if (std::strcmp(dts, "pc") == 0) {
            return "pinter char";
        } else if (std::strcmp(dts, "ph") == 0) {
            return "pinter unsigned char";
        } else if (std::strcmp(dts, "pi") == 0) {
            return "pinter signed integer";
        } else if (std::strcmp(dts, "pj") == 0) {
            return "pinter unsigned integer";
        } else if (std::strcmp(dts, "pl") == 0) {
            return "pinter signed long int";
        } else if (std::strcmp(dts, "pm") == 0) {
            return "pinter unsigend long int";
        } else if (std::strcmp(dts, "px") == 0) {
            return "pinter signed long long int";
        } else if (std::strcmp(dts, "py") == 0) {
            return "pinter unsigned long long int";
        } else if (std::strcmp(dts, "pf") == 0) {
            return "pinter float";
        } else if (std::strcmp(dts, "pd") == 0) {
            return "pinter double";
        } else if (std::strcmp(dts, "pe") == 0) {
            return "pinter long double";
        } else if (std::strcmp(dts, "ppc") == 0) {
            return "pinter pinter char";
        } else if (std::strcmp(dts, "pph") == 0) {
            return "pinter pinter unsigned char";
        } else if (std::strcmp(dts, "ppi") == 0) {
            return "pinter pinter signed integer";
        } else if (std::strcmp(dts, "ppj") == 0) {
            return "pinter pinter unsigned integer";
        } else if (std::strcmp(dts, "ppl") == 0) {
            return "pinter pinter signed long int";
        } else if (std::strcmp(dts, "ppm") == 0) {
            return "pinter pinter unsigend long int";
        } else if (std::strcmp(dts, "ppx") == 0) {
            return "pinter pinter signed long long int";
        } else if (std::strcmp(dts, "ppy") == 0) {
            return "pinter pinter unsigned long long int";
        } else if (std::strcmp(dts, "ppf") == 0) {
            return "pinter pinter float";
        } else if (std::strcmp(dts, "ppd") == 0) {
            return "pinter pinter double";
        } else if (std::strcmp(dts, "ppe") == 0) {
            return "pinter pinter long double";
        } else {
            return "unknown data-type";
        }
    }

    /* -------------------------------------------------- */

    class publicexception;

} // namespace util

#endif /* HEADER_MAIN_CPP */
