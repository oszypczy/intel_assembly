CC=gcc
ASMBIN=nasm

all : asm cc link

asm :
	$(ASMBIN) -o getdec.o -f elf -g -F dwarf getdec.asm
cc :
	$(CC) -m32 -c -g -O0 getdec_test.cpp
link :
	$(CC) -m32 -g -o gtd getdec_test.o getdec.o

clean :
	rm *.o
	rm gtd
