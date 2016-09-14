; Data Transfer Ejercicios BA       (EjerBC.asm)

; Uso de instrucciones, Directivas data y operadores.

INCLUDE Irvine32.inc
.DATA



m1 BYTE "Teclee el dato entero M",0
m2 BYTE "Teclee el dato entero N",0
m3 BYTE "Total M*N:",0
m4 BYTE "Siguiente termino:",0
CBS SDWORD -1



.CODE
main PROC
	; dado un valor n entero, calcule e imprima la 
	;siguiente serie sumatoria de n términos:
    ;-1 + 4 - 7 + 10 - 13 + 16 - . . .
   ; n es un dato entero >= 1.


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
	   imul eax, CBS 
	   add ebx,eax
	   mov edx,OFFSET m4
       call WriteString ; desplegar mensaje
       call WriteInt
	   call Crlf
	   imul eax,CBS 
	   neg CBS   
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