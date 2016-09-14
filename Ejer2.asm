; Data Transfer Ejercicios BA       (EjerBC.asm)

; Uso de instrucciones, Directivas data y operadores.

INCLUDE Irvine32.inc
.DATA



m1 BYTE "Teclee el dato entero M",0
m2 BYTE "Teclee el dato entero N",0
m3 BYTE "Total M*N:",0



.CODE
main PROC
	; dados los datos m y n (m  1, n  0, ambos datos enteros) calcule 
	;m*n sin utilizar la operación de multiplicación.
    ;HINT, se sugiere repetir m veces n.

	call Clrscr
   ;Imprimir Mensaje
   
   mov edx,OFFSET m1
   call WriteString ; desplegar mensaje
   call ReadInt ; entero se guarda en EAX 
   call Crlf ; ir a la siguiente línea de salida
   mov ecx,eax; M está en ecx
   
   mov edx,OFFSET m2
   call WriteString ; desplegar mensaje
   call ReadInt ; entero se guarda en EAX 
   call Crlf ; ir a la siguiente línea de salida
			;N está en eax
   
   mov ebx, eax
   mov eax,0
   
   dow: 
   add eax,ebx
   Loop dow
   
   call Crlf 
   mov edx,OFFSET m3
   call WriteString ; desplegar mensaje
   call Crlf 
   call WriteInt
   	

	exit
main ENDP
END main