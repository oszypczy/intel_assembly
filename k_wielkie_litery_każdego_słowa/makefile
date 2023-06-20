CC=gcc
ASMBIN=nasm

all : asm cc link

asm :
	$(ASMBIN) -o capwords.o -f elf -g -F dwarf capwords.asm
cc :
	$(CC) -m32 -c -g -O0 capwords_test.cpp
link :
	$(CC) -m32 -g -o cap capwords_test.o capwords.o

clean :
	rm *.o
	rm cap
