; Data Transfer Ejercicios BA       (EjerBC.asm)

; Uso de instrucciones, Directivas data y operadores.

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

arrWx WORD 3 DUP(?)

.CODE
main PROC
; Escriba comentarios

	exit
main ENDP
END main