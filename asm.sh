#! /bin/bash

# 32-bit ELF binary:
# nasm -f elf32 -o <filename>.o <filename>.asm
# ld -m elf_i386 -o <filename> <filename>.o

# 64-bit ELF binary:
# nasm -f elf64 -o <filename>.o <filename>.asm
# ld -o <filename> <filename>.o

### ----------------------------------------------------------------------------------

# 32-bit ELF binary with libc:
#nasm -f elf32 -o <filename>.o <filename>.asm
#ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o <filename> -lc <filename>.o

# 64-bit ELF binary with libc:
#nasm -f elf64 -o <filename>.o <filename>.asm
#ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o <filename> -lc <filename>.o

### ----------------------------------------------------------------------------------

nice -n 20 clear

if [[ $1 == 0 ]]; then
    nice -n 20 ls -ltrha bin/asm_result.out
    nice -n 20 printf '\n'
    nice -n 20 printf '%s\n' "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    nice -n 20 printf '\n'
    nice -n 20 bin/asm_result.out
    nice -n 20 printf '\n'
    nice -n 20 printf '%s\n' "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
else
    nice -n 20 rm -rf bin/*.o
    nice -n 20 rm -rf bin/*.out
    nice -n 20 rm -rf bin/*result*
    nice -n 20 rm -rf bin/*main*
    nice -n 20 clear
    
    nasm -f elf64 -o bin/asm_result.o src/asm/main_"$1".asm
    ld  -o bin/asm_result.out bin/asm_result.o

    nice -n 20 printf '\n'
    nice -n 20 printf '\n'
    #nice -n 20 echo "PRESS ANY KEY TO EXECUTE PROGRAM ..."
    #read
    nice -n 20 ls -ltrha bin/asm_result.out
    nice -n 20 printf '\n'
    nice -n 20 printf '%s\n' echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    nice -n 20 printf '\n'
    nice -n 20 bin/asm_result.out
    nice -n 20 printf '\n'
    nice -n 20 printf '%s\n' echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi