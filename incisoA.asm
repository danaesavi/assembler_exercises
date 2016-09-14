TITLE *MASM Template	(incisoA.asm)*

; Descripcion:
;Tarea para el martes 3 de noviembre de 2015
; 
; Fecha de ultima modificacion:
; 30-oct-2015

INCLUDE Irvine32.inc

.DATA
mensaje BYTE "ADIOS",0
m1 BYTE "Impresion como palabra doble: ", 0
m2 BYTE "Impresion como dos palabras: ", 0
m3 BYTE "Impresion como cuatro bytes: ", 0
oneWord DWORD 1A2B3C4Dh
aux1 WORD ?
aux2 BYTE ?

.CODE
; Procedimiento principal
main PROC
    call Clrscr
	
    mov edx,OFFSET m1 ;impresión como palabra doble
    call WriteString
	call Crlf
	
	mov ESI, OFFSET oneWord
	mov ECX, LENGTHOF oneWord
	mov EBX, TYPE DWORD
	call DumpMem ;imprime oneWord completa
	call Crlf
	
	
	mov edx,OFFSET m2 ;impresión como dos palabras
    call WriteString
	call Crlf
	
	mov AX, WORD PTR oneWord ;primero toma 3C4D y lo guarda en AX
	mov aux1, AX ;lo pasa a aux1
	mov ESI, OFFSET aux1
	mov ECX, LENGTHOF aux1
	mov EBX, TYPE WORD
	call DumpMem ;imprime 3C4D
	
	mov AX, WORD PTR [oneWord+2] ;luego toma 1A2B y lo guarda en AX
	mov aux1, AX ;lo pasa a aux1
	mov ESI, OFFSET aux1
	mov ECX, LENGTHOF aux1
	mov EBX, TYPE WORD
	call DumpMem ;imprime 1A2B
	call Crlf
	
	
	mov edx,OFFSET m3 ;impresión como cuatro bytes
    call WriteString 
	call Crlf
	
	mov AL, BYTE PTR oneWord ;toma 4D y lo guarda en AL
	mov aux2, AL ;lo pasa a aux2
	mov ESI, OFFSET aux2
	mov ECX, LENGTHOF aux2
	mov EBX, TYPE BYTE
	call DumpMem ;imprime 4D
	
	mov AL, BYTE PTR [oneWord+1] ;toma 3C y lo guarda en AL
	mov aux2, AL ;lo pasa a aux2
	mov ESI, OFFSET aux2
	mov ECX, LENGTHOF aux2
	mov EBX, TYPE BYTE
	call DumpMem ;imprime 3C
	
	mov AL, BYTE PTR [oneWord+2] ;toma 2B y lo guarda en AL
	mov aux2, AL ;lo pasa a aux2
	mov ESI, OFFSET aux2
	mov ECX, LENGTHOF aux2
	mov EBX, TYPE BYTE
	call DumpMem ;imprime 2B
	
	mov AL, BYTE PTR [oneWord+3] ;toma 1A y lo guarda en AL
	mov aux2, AL ;lo pasa a aux2
	mov ESI, OFFSET aux2
	mov ECX, LENGTHOF aux2
	mov EBX, TYPE BYTE
	call DumpMem ;imprime 1A
	call Crlf
	
	mov edx,OFFSET mensaje ;mensaje de adiós
    call WriteString

    exit
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main