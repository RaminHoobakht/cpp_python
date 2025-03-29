#! /bin/bash

# for run poco server
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

./format.sh

if [[ $1 == 0 ]]; then
    nice -n 20 ./build/cpp_result
else
  nice -n 20 cmake -B build -S .
  nice -n 20 cmake --build build --config debug --clean-first
  nice -n 20 printf '\n'
  nice -n 20 printf '\n'
  #nice -n 20 echo "PRESS ANY KEY TO EXECUTE PROGRAM ..."
  #read
  nice -n 20 ls -lthra ./build/cpp_result
  nice -n 20 printf '\n'
  nice -n 20 printf '%s\n' "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  nice -n 20 printf ""
  nice -n 20 ./build/cpp_result
  nice -n 20 printf '\n'
  nice -n 20 printf '%s\n' "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi
