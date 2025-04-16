#ifndef HEADER_MAIN_CPP
#define HEADER_MAIN_CPP

#include <ios>
#include <iostream>
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

#endif /* HEADER_MAIN_CPP */
