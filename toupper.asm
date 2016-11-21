;  Build using these commands:
;    nasm -f elf64 -g -F stabs eatsyscall.asm
;    ld -o eatsyscall eatsyscall.o
;
	
SECTION .bss			; Section containing uninitialized data	
	Buff resb 1

SECTION .data			; Section containing initialised data

SECTION .text			; Section containing code

global 	_start			; Linker needs this to find the entry point!
	
_start:
	
Read:	mov eax,3
	mov ebx,0
	mov ecx,Buff
	mov edx,1
	int 80h
	
	cmp eax,0
	je Exit
	
	cmp byte [Buff],61H
	jb Write
	
	cmp byte [Buff],7bH
	ja Write
	
	sub byte [Buff],20H
	jmp Write
	

Write:	mov eax,4
	mov ebx,1
	mov ecx,Buff
	mov edx,1
	
	int 80h
	
	;cmp eax,0
	;je Read
	jmp Read

Exit:	mov eax,1
	mov ebx,0
	int 80h
