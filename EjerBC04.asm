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

m1 BYTE "Intercambio entre val1 y val2",0

arrWx WORD 3 DUP(?)

.CODE
main PROC
; Escriba comentarios

	mov eax, 0
	mov ecx, 0
	mov ax, val1
	mov cx, val2
	xchg ax, cx
	
	mov val1, ax
	mov val2, cx
	
	mov edx,OFFSET m1
    call WriteString
	call Crlf
	
	 mov ESI, OFFSET val1 ; desde dónde
    mov EBX, type val1 ; longitud del tipo de dato (bytes)
    mov ECX, lengthof val1 ; cantidad de datos    
    call DumpMem
	
	 mov ESI, OFFSET val2 ; desde dónde
    mov EBX, type val2 ; longitud del tipo de dato (bytes)
    mov ECX, lengthof val2 ; cantidad de datos    
    call DumpMem

	exit
main ENDP
END main