TITLE Ejercicio para 07oct15	(ejercicio01.asm)*

; Descripcion:
; R = -A + 9 – B + C + 1
; 
; Fecha de ultima modificacion:
; 07-oct-2015

INCLUDE Irvine32.inc

.DATA
mensRegs BYTE 0dh,0ah,"DumpMem de A, B, C y R en hexadecimal",0dh,0ah,0
mensMem BYTE 0dh,0ah,"DumpMem de A, B, C y R en hexadecimal",0dh,0ah,0
promptIN BYTE "Dato entero decimal: ",0
promptOUT BYTE "Resultado entero decimal: ",0

A  SDWORD 7
B  SDWORD ?
CC  SDWORD -15
R  SDWORD  ?
 
.CODE
; Procedimiento principal
main PROC
    call Clrscr

    ; Leer dato para B
	call Crlf
    mov edx,OFFSET promptIN
    call WriteString
	call ReadInt
	mov B, eax
	
	; -A
	mov ebx, A
	neg ebx
	; -A + 9
	add ebx, 9
	; -A + 9 - B
	sub ebx, eax
	mov eax, ebx
	; -A + 9 - B + C
	add eax, CC
	; -A + 9 - B + C + 1	
	inc eax
	mov R, eax
	
	call Crlf
    mov edx,OFFSET promptOUT
    call WriteString
	call WriteInt  ; de eax
	call Crlf

    mov edx,OFFSET mensRegs
    call DumpRegs

	call Crlf
    mov edx,OFFSET mensMem
    call WriteString
	mov esi, OFFSET A
    mov ebx, 4
    mov ecx, 4
    call DumpMem   

    exit
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main