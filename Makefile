PWD := $(shell pwd)

toupper: toupper.o
	ld -o toupper toupper.o
toupper.o: toupper.asm
	nasm -f elf64 -g -F stabs toupper.asm

clean:
	rm -f toupper.o toupper
