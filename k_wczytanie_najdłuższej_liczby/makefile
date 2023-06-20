CC=gcc
ASMBIN=nasm

all : asm cc link

asm :
	$(ASMBIN) -o leavelongestnum.o -f elf -g -F dwarf leavelongestnum.asm
cc :
	$(CC) -m32 -c -g -O0 leavelongestnum_test.cpp
link :
	$(CC) -m32 -g -o lln leavelongestnum_test.o leavelongestnum.o

clean :
	rm *.o
	rm lln
