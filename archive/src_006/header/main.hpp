#ifndef HEADER_MAIN_CPP
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

#endif /* HEADER_MAIN_CPP */
