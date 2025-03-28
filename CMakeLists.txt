cmake_minimum_required(VERSION 3.5)

set(CMAKE_PROJECT_NAME cpp_result)
set(CMAKE_PROJECT_VERSION 1)
set(CMAKE_PROJECT_VERSION_MAJOR 0)
set(CMAKE_PROJECT_VERSION_MINOR 1)
set(CMAKE_PROJECT_DESCRIPTION "training C++")

set(CMAKE_TOOLCHAIN_FILE "")

project(
        ${CMAKE_PROJECT_NAME}
        VERSION ${CMAKE_PROJECT_VERSION_MAJOR}.${CMAKE_PROJECT_VERSION_MINOR}
        LANGUAGES CXX C ASM
        DESCRIPTION ${CMAKE_PROJECT_DESCRIPTION})

#set(CMAKE_C_COMPILER "/usr/bin/gcc-14")
#set(CMAKE_CXX_COMPILER "/usr/bin/g++-14")

set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_DEFAULT 23)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_DEFAULT 26)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++26 -O0 -g3 -pthread -lpthread ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pedantic -Wall -Wextra -Wconversion ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wcast-align -Wcast-qual -Wdisabled-optimization ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wlogical-op -Wmissing-declarations ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wmissing-include-dirs -Wredundant-decls ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wshadow -Wsign-conversion -Wswitch-default ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wundef -Wfloat-equal -fmessage-length=0 ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wctor-dtor-privacy -Wformat=2 -Winit-self ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wnoexcept -Wold-style-cast -Wsign-promo ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Woverloaded-virtual -Wstrict-null-sentinel ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wsign-promo -Wstrict-overflow=5 -Werror -Wno-unused ")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Weffc++ -Winline -Winvalid-pch -Wstrict-aliasing=2 ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstack-protector -Wstack-protector -Wswitch-enum ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunsafe-loop-optimizations -Wunused-parameter ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wformat-nonliteral -Wformat-security -Wpacked ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wimport -Wwrite-strings -Wvariadic-macros ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wmissing-field-initializers -Wmissing-format-attribute ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wunused-parameter -Wunreachable-code -Wunused ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wpadded -Wpointer-arith -Wmissing-noreturn ")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -v -fPIC -fPIE -m64 -march=corei7-avx  ")

add_executable(${CMAKE_PROJECT_NAME}
        src/app/main.cpp
        src/header/utillib.hpp
        src/header/utillib.cpp
        src/header/test.hpp
        src/header/test.cpp
)

# This project will output an static library file
# add_library(${CMAKE_PROJECT_NAME} STATIC
#     src/app/library.h
#     src/app/library.c
# )

# Create a simple configuration header
#configure_file(config.h.in config.h)

#target_link_libraries(${PROJECT_NAME}
#        PUBLIC
#        Poco::Foundation
#        Poco::JSON
#        Poco::Net
#        Poco::XML
#        Poco::Util
#        Poco::NetSSL
#        Poco::Encodings
#        Poco::Prometheus
#        Poco::Crypto
#        Poco::JWT
#        Poco::Data
#        Poco::ActiveRecord
#        Poco::Zip
#        Poco::ActiveRecord
#        Poco::MongoDB
#        Poco::Redis
#        # Poco::DataPostgreSQL
#)

#find_package(Poco REQUIRED
#        COMPONENTS
#        Foundation
#        JSON
#        Net
#        XML
#        Util
#        NetSSL
#        Encodings
#        Prometheus
#        Crypto
#        JWT
#        Data
#        ActiveRecord
#        Zip
#        ActiveRecord
#        MongoDB
#        Redis
#        # DataPostgreSQL
#)


find_library(MATH_LIBRARY m)
if (MATH_LIBRARY)
    target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC ${MATH_LIBRARY})
endif ()

find_library(CURL_LIBRARY curl)
if (CURL_LIBRARY)
    target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC ${CURL_LIBRARY})
endif ()

find_library(PQ_LIBRARY pq)
if (PQ_LIBRARY)
    target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC ${PQ_LIBRARY})
endif ()

find_library(PQX_LIBRARY pqxx)
if (PQX_LIBRARY)
    target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC ${PQX_LIBRARY})
endif ()

find_package(Python3 COMPONENTS Interpreter Development)
target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE Python3::Python)

# Create a simple configuration header
# configure_file(config.h.in config.h)

# Include the configuration header in the build
target_include_directories(${CMAKE_PROJECT_NAME} PUBLIC "${PROJECT_BINARY_DIR}")

include(GNUInstallDirs)
install(
        TARGETS ${CMAKE_PROJECT_NAME}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})


