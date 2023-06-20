CC=gcc
ASMBIN=nasm

all : asm cc link

asm :
	$(ASMBIN) -o removerng.o -f elf -g -F dwarf removerng.asm
cc :
	$(CC) -m32 -c -g -O0 removerng_test.cpp
link :
	$(CC) -m32 -g -o rmvt removerng_test.o removerng.o

clean :
	rm *.o
	rm rmvt
