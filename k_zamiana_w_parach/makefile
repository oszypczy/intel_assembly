CC=gcc
ASMBIN=nasm

all : asm cc link

asm :
	$(ASMBIN) -o reversepairs.o -f elf -g -F dwarf reversepairs.asm
cc :
	$(CC) -m32 -c -g -O0 reversepairs_test.cpp
link :
	$(CC) -m32 -g -o rvrp reversepairs_test.o reversepairs.o

clean :
	rm *.o
	rm rvrp
