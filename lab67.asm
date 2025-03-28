

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc

.data
	A SDWORD ?
	B SDWORD ?
	C SDWORD ?
	D SDWORD ?
	E SDWORD ?


.code
main PROC

	invoke ExitProcess,0
main ENDP




end main