#! /bin/bash

  nice -n 20 cmake -B build -S .
  nice -n 20 cmake --build build --config debug --clean-first
  nice -n 20 printf '\n'
  nice -n 20 printf '\n'
  #nice -n 20 echo "PRESS ANY KEY TO EXECUTE PROGRAM ..."
  #read
  nice -n 20 printf '\n'
  nice -n 20 printf '%s\n' "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  nice -n 20 printf '\n'
  nice -n 20 ls -lthra ./build/lib*.a
  nice -n 20 printf '\n'
  nice -n 20 printf '%s\n' "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
