SECTION .bss
	BUFFLEN equ 1024
	Buff: resb BUFFLEN

SECTION .data

SECTION .text

global _start

_start:
	nop	;suppose it's needed
Read:	mov eax,3
	mov ebx,0
	mov ecx,Buff
	mov edx,BUFFLEN
	int 80H
	
	cmp eax,0
	je Exit
	
	mov esi,eax
	mov ebp,Buff
	mov ecx,esi
Scan:	dec ecx
	cmp byte [ebp+ecx],61H
	jb Next
	
	cmp byte [ebp+ecx],7bH
	ja Next
	
	sub byte [ebp+ecx],20H
Next:	cmp ecx,0
	jnz Scan
Write:	mov eax,4
	mov ebx,1
	mov ecx,Buff
	mov edx,esi
	int 80H
	
	jmp Read
Exit:	mov eax,1
	mov ebx,0
	int 80H
