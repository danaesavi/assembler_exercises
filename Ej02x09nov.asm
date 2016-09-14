TITLE Ejercicio 2 del 28-oct-15	(Ej02x28oct.asm)*

; Descripcion:
; Ejemplo de implementacion de Estructuras Algoritmicas y operando indirecto.
; 

INCLUDE Irvine32.inc

.DATA

; Textos para la Consola
m1 BYTE "Total: ",0

; Variables
array  SDWORD 11,10,12,14,13,10,12
array2 SDWORD 209,-131,-96,160,-221,85,-49
aSize DWORD 4*7



 
.CODE
; Procedimiento principal
main PROC
   call Clrscr
   ; ecx es el index
   mov ecx, 0
   ;ebx es sum
   mov ebx, 0
    ;while
iniwh:
	
	CMP ecx, aSize
	JGE finwh
	    mov  eax, array[ecx]
		imul array2[ecx]
		add ebx, eax 
		add ecx, 4
	    JMP iniwh
			
finwh:

   call Clrscr
    mov edx,OFFSET m1
	call WriteString
	mov eax, ebx
	call Writeint
    
    

    exit
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main