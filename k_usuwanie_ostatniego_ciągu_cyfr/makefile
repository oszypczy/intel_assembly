CC=gcc
ASMBIN=nasm

all : asm cc link

asm :
	$(ASMBIN) -o remlastnum.o -f elf -g -F dwarf remlastnum.asm
cc :
	$(CC) -m32 -c -g -O0 remlastnum_test.cpp
link :
	$(CC) -m32 -g -o rln remlastnum_test.o remlastnum.o

clean :
	rm *.o
	rm rln
