#! /bin/bash

clear 

rm -rf ./*glob*.out
rm -rf ./*glob*.o
rm -rf ./*glob*.a
rm -rf main
rm -rf runnable

rm -rf build/*.out
rm -rf build/*.o
rm -rf build/*.a
rm -rf build/main
rm -rf build/runnable

clear

# compile the source program
# nice -n 20 gcc -std=gnu23 -O0 -g3 -pthread -lpthread -pedantic -Wall -Wextra -Wconversion -Wcast-align -Wcast-qual -Wdisabled-optimization -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs -Wredundant-decls -Wshadow -Wsign-conversion -Wswitch-default -Wundef -Wfloat-equal -fmessage-length=0 -v -fPIC -fPIE -m64 -march=corei7-avx -lm -lulfius -c src/app/main.c -o build/main.o
  nice -n 20 g++ -std=c++26 -g3 -fgnu-tm -pthread -lpthread -fconcepts -pedantic -pedantic-errors -Wall -Wextra -Wconversion -Wcast-align -Wcast-qual -Wctor-dtor-privacy -Wdisabled-optimization -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs -Wnoexcept -Wold-style-cast -Woverloaded-virtual -Wredundant-decls -Wshadow -Wsign-conversion -Wsign-promo -Wstrict-null-sentinel -Wswitch-default -Wundef -Weffc++ -Wfloat-equal -fmessage-length=0 -v -fPIC -fPIE -m64 -march=corei7-avx -c src/app/main_"$1".cpp -o build/main.o

# compile headers and corresponding sources
# nice -n 20 gcc -std=gnu23 -O0 -g3 -pthread -lpthread -pedantic -Wall -Wextra -Wconversion -Wcast-align -Wcast-qual -Wdisabled-optimization -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs -Wredundant-decls -Wshadow -Wsign-conversion -Wswitch-default -Wundef -Wfloat-equal -fmessage-length=0 -v -fPIC -fPIE -m64 -march=corei7-avx -lm -lulfius -c src/header/*.c -o build/libs.o
  nice -n 20 g++ -std=c++26 -g3 -fgnu-tm -pthread -lpthread -fconcepts -pedantic -pedantic-errors -Wall -Wextra -Wconversion -Wcast-align -Wcast-qual -Wctor-dtor-privacy -Wdisabled-optimization -Wlogical-op -Wmissing-declarations -Wmissing-include-dirs -Wnoexcept -Wold-style-cast -Woverloaded-virtual -Wredundant-decls -Wshadow -Wsign-conversion -Wsign-promo -Wstrict-null-sentinel -Wswitch-default -Wundef -Weffc++ -Wfloat-equal -fmessage-length=0 -v -fPIC -fPIE -m64 -march=corei7-avx -c src/header/*.cpp -o build/libs.o

# linkage process
# nice -n 20 gcc -o build/runnable build/main.o build/libs.o -m64
  nice -n 20 g++ -o build/runnable build/main.o build/libs.o -m64

# create static library
# nice -n 20 ar rcs lib_%$1.a build/main.o

printf '\n'
printf '\n'
printf '\n'
printf '%s\n' "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
printf '\n'
build/runnable
printf '\n'
printf '%s\n' "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
printf '\n'
printf '\n'
