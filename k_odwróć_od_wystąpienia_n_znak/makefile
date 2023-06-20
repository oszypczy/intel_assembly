CC=gcc
ASMBIN=nasm

all : asm cc link

asm :
	$(ASMBIN) -o reversenfrom.o -f elf -g -F dwarf reversenfrom.asm
cc :
	$(CC) -m32 -c -g -O0 reversenfrom_test.cpp
link :
	$(CC) -m32 -g -o rvrnf reversenfrom_test.o reversenfrom.o

clean :
	rm *.o
	rm rvrnf
