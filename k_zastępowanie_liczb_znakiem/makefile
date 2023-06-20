CC=gcc
ASMBIN=nasm

all : asm cc link

asm :
	$(ASMBIN) -o replnum.o -f elf -g -F dwarf replnum.asm
cc :
	$(CC) -m32 -c -g -O0 replnum_test.cpp
link :
	$(CC) -m32 -g -o rpln replnum_test.o replnum.o

clean :
	rm *.o
	rm rpln
