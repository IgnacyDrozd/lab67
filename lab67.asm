;Ignacy Drozd lab67 due march 28
;calculates formula from lab assignment

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc

.data
	A SDWORD ?
	B SDWORD ?
	Cv SDWORD ?
	D SDWORD ?
	E SDWORD ?
	promptA BYTE "Enter A: ", 0
	promptB BYTE "Enter B: ", 0
	promptC BYTE "Enter C: ", 0
	promptD BYTE "Enter D: ", 0
	promptE BYTE "Enter E: ", 0
	TEMP SDWORD ?
	promptBad BYTE "Invalid input, please enter again",0

.code
main PROC
	
	mov ebx, OFFSET A
	mov esi, OFFSET promptA
	mov ecx, 5 ;counter

L1:
	mov edx, esi; argument for WriteString
	add esi, 10 ;next prompt
	call WriteString


read:
	call ReadInt
    jno  goodInput

    mov  edx,OFFSET promptBad
    call WriteString
    jmp  read        ;go input again

goodInput:
    mov  [ebx],eax  ;store good value
	add ebx, 4 ;next var
	LOOP L1

;now we can calculate the formula



	invoke ExitProcess,0
main ENDP




end main