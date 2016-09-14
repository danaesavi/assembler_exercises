TITLE Ejercicio para 07oct15	(Ejer01x28act15.asm)
; DumpMem de diferentes areas.

; Uso de instrucciones, Directivas data y operadores.

INCLUDE Irvine32.inc

.DATA
mensB BYTE 0dh,0ah,"--BYTE--",0dh,0ah,0
mensW BYTE 0dh,0ah,"--WORD--",0dh,0ah,0
mensD BYTE 0dh,0ah,"--DWORD--",0dh,0ah,0
adios BYTE 0dh,0ah,"++ADIOS++",0dh,0ah,0

oneWord DWORD 1A2B3C4Dh

.CODE
main PROC
; Ejer01
    ; Como DWORD
    mov edx,OFFSET mensD
    call WriteString
	mov esi, OFFSET oneWord
    mov ebx, TYPE oneWord
    mov ecx, LENGTHOF oneWord
    call DumpMem
	call Crlf

    ; Como WORD
    mov edx,OFFSET mensW
    call WriteString
	mov esi, OFFSET oneWord
    mov ebx, TYPE WORD PTR oneWord    ; o TYPE WORD
    mov ecx, (SIZEOF oneWord)/(TYPE WORD) 
    call DumpMem   
	call Crlf

    ; Como BYTE
    mov edx,OFFSET mensB
    call WriteString
	mov esi, OFFSET oneWord
    mov ebx, TYPE BYTE PTR oneWord    ; o TYPE BYTE
    mov ecx, (SIZEOF oneWord)/(TYPE BYTE)
    call DumpMem   
	call Crlf

    mov edx,OFFSET adios
    call WriteString
	call Crlf
    
	exit
main ENDP
END main