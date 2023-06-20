CC=gcc
ASMBIN=nasm

all : asm cc link

asm :
	$(ASMBIN) -o removenchar.o -f elf -g -F dwarf removenchar.asm
cc :
	$(CC) -m32 -c -g -O0 removenchar_test.cpp
link :
	$(CC) -m32 -g -o rmvt removenchar_test.o removenchar.o

clean :
	rm *.o
	rm rmvt
