CC=gcc
ASMBIN=nasm

all : asm cc link

asm :
	$(ASMBIN) -o removebutnchar.o -f elf -g -F dwarf removebutnchar.asm
cc :
	$(CC) -m32 -c -g -O0 removebutnchar_test.cpp
link :
	$(CC) -m32 -g -o rmvt removebutnchar_test.o removebutnchar.o

clean :
	rm *.o
	rm rmvt
