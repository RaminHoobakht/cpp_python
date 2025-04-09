#include "../header/utillib.hpp"

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

} // namespace util 
