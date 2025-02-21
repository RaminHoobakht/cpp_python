#! /bin/bash

nice -n 20 clear

if [[ $1 == 0 ]]; then
    nice -n 20 ls -ltrha bin/result.out
    nice -n 20 printf '\n'
    nice -n 20 printf '%s\n' "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    nice -n 20 printf '\n'
    nice -n 20 bin/result.out
    nice -n 20 printf '\n'
    nice -n 20 printf '%s\n' "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
else
    nice -n 20 rm -rf bin/*.o
    nice -n 20 rm -rf bin/*.out
    nice -n 20 rm -rf bin/*result*
    nice -n 20 rm -rf bin/*main*
    nice -n 20 clear
    ./compiler.sh "$1"
    nice -n 20 printf '\n'
    nice -n 20 printf '\n'
    #nice -n 20 echo "PRESS ANY KEY TO EXECUTE PROGRAM ..."
    #read
    nice -n 20 ls -ltrha bin/result.out
    nice -n 20 printf '\n'
    nice -n 20 printf '%s\n' "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    nice -n 20 printf '\n'
    nice -n 20 bin/result.out
    nice -n 20 printf '\n'
    nice -n 20 printf '%s\n' "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi