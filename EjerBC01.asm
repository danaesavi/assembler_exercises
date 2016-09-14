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

m1 BYTE "ArregloB",0
m2 BYTE "ArregloW",0
m3 BYTE "ArregloD",0


arrWx WORD 3 DUP(?)

.CODE
main PROC
; Escriba comentarios
	call Clrscr
    
	mov edx,OFFSET m1
    call WriteString
	call Crlf
	
	mov ESI, OFFSET arrB ;desde dónde
	mov ECX, LENGTHOF arrB ;cantidad de datos
	mov EBX, TYPE arrB ;longitud del tipo de dato en bytes
	call DumpMem 

	mov edx,OFFSET m2
    call WriteString
	call Crlf 
	
	mov ESI, OFFSET arrW ;desde dónde
	mov ECX, LENGTHOF arrW ;cantidad de datos
	mov EBX, TYPE arrW ;longitud del tipo de dato en bytes
	call DumpMem 
	
	mov edx,OFFSET m3
    call WriteString
	call Crlf
	
	mov ESI, OFFSET arrD ;desde dónde
	mov ECX, LENGTHOF arrD ;cantidad de datos
	mov EBX, TYPE arrD ;longitud del tipo de dato en bytes
	call DumpMem 

	exit
main ENDP
END main