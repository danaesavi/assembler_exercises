; Data Transfer Ejercicios BA       (EjerBC.asm)

; Uso de instrucciones, Directivas data y operadores.

INCLUDE Irvine32.inc
.DATA



m1 BYTE "Teclee el dato N",0
m2 BYTE "Total",0
m3 BYTE "Siguiente termino:",0


.CODE
main PROC
	; dado un valor n entero, calcule e imprima la
	; siguiente serie sumatoria de n términos:
	;1 + 4 + 7 + 10 + 13 + 16 + 
	call Clrscr
   ;Imprimir Mensaje
   
   mov edx,OFFSET m1
   call WriteString ; desplegar mensaje
   call ReadInt ; entero se guarda en EAX 
   call Crlf ; ir a la siguiente línea de salida
   mov ecx,eax
   mov eax,-2
   mov ebx,0
   
   dow: 
   add eax,3
    mov edx,OFFSET m3
   call WriteString ; desplegar mensaje
   call WriteInt
    call Crlf
   add ebx,eax
   Loop dow
   
   call Crlf 
   mov edx,OFFSET m2
   call WriteString ; desplegar mensaje
   call Crlf 
   mov eax,ebx
   call WriteInt
   	

	exit
main ENDP
END main