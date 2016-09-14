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

m1 BYTE "Se suma el 2do el. de arrSD con 2do el. de arrSW",0

arrWx WORD 3 DUP(?)

.CODE
main PROC
; Escriba comentarios

	mov eax, 0
	movzx eax, arrSW + type arrSW
    add eax, arrSD + type arrSD
	mov edx,OFFSET m1
    call WriteString
	call Crlf
	call WriteInt
	call Crlf

	exit
main ENDP
END main