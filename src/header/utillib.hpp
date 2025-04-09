#ifndef HEADER_MAIN_CPP
#define HEADER_MAIN_CPP

#include <cstddef>
#include <iostream>
#include <string>

constexpr char NL{'\n'};
constexpr char RT{'\r'};
constexpr char SP{'\x20'};

#define LF std::cout << NL
#define SEP util::separator()

using str = std::string;
using cstr = const std::string;
using rstr = std::string &;
using crstr = const std::string &;

namespace util {

    constexpr size_t zero{0LU};

    /* -------------------------------------------------- */

    void separator(size_t no = 64LU, char ch = '-') noexcept;

    std::string &trim(std::string &str, bool right, bool left) noexcept;

    /* -------------------------------------------------- */

    class publicexception;

} // namespace util

#endif /* HEADER_MAIN_CPP */
