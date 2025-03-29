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
	promptOV BYTE "Overflow! crash",0

.code
main PROC
	
	mov ebx, OFFSET A
	mov esi, OFFSET promptA
	mov ecx, 5 ;A to E


	;loop for all input prompts
L1:
	mov edx, esi; argument for WriteString in edx
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
	add ebx, 4		;next var
	LOOP L1

;now we can calculate the formula

	mov eax, A
	mov ebx, B
	sub eax,ebx
	jo OVERFLOW ;exit with code 1 if there was an overflow in the operation
	mov TEMP, eax

	
	mov edx, 0	;first multiplication
	neg eax		;this technically negates the parentheses, not C (which is -C in the formula), but it is easier to negate the value already in the register
	IMUL eax, Cv ;IMUL reg32/mem32, however overflow is possible in this case
	jo OVERFLOW
	

	mov ebx, D
	CDQ ;sign extend edx for IDIV
	IDIV ebx

	mov ebx, E ;final addition
	neg ebx
	add eax,ebx
	jo OVERFLOW

	call WriteInt ;output final value









	invoke ExitProcess,0
OVERFLOW:
	
	mov edx, OFFSET promptOV
	call WriteString
	invoke ExitProcess,1

main ENDP




end main