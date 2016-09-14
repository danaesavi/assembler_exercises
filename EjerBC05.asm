; Data Transfer Ejercicios BA       (EjerBC.asm)

; Uso de instrucciones, Directivas data y operadores.

INCLUDE Irvine32.inc

.DATA
val1  WORD 1000h
val2  WORD 2000h
val3  BYTE 32
val4  WORD 400

arrB BYTE  10h,20h,30h,40h,50h
arrW WORD  100h,200h,300h
arrD DWORD 10000h,20000h

arrSW SWORD  -140,200,-300
arrSD SDWORD 10000,-20000

m1 BYTE "Copiar arrW en arrWx en orden inverso",0

arrWx WORD 3 DUP(?)

.CODE
main PROC
; Escriba comentarios

    
	
	mov ax, arrW + type arrW + type arrW
	mov arrWx, ax

	mov ax, arrW + type arrW
	mov arrWx + type arrWx, ax

	mov ax, arrW
	mov arrWx  + type arrW + type arrW, ax

	mov edx,OFFSET m1
    call WriteString
	call Crlf

	mov ESI, OFFSET arrWx ; desde dónde
    mov EBX, type arrWx ; longitud del tipo de dato (bytes)
    mov ECX, lengthof arrWx ; cantidad de datos    
    call DumpMem


	exit
main ENDP
END main