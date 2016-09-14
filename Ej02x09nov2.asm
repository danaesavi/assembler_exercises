TITLE Ejercicio 2 del 28-oct-15	(Ej02x28oct.asm)*

; Descripcion:
; Ejemplo de implementacion de Estructuras Algoritmicas y operando indirecto.
; 

INCLUDE Irvine32.inc

.DATA
; Textos para la Consola
m1 BYTE "Teclee una n>=1 y <=20  ",0
m2 BYTE "Teclee la temperatura ",0
m3 BYTE "Total3 ",0
index DWORD 0
index2 DWORD 0
temps SDWORD 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
n DWORD ?
adios BYTE "Adios",0
m4 BYTE "Temperatura ",0
dos DWORD 2
par BYTE "P",0
imp BYTE "I",0

.CODE
main PROC
	
	call Clrscr
   ;Imprimir Mensaje
   
	   mov edx,OFFSET m1
	   call WriteString ; desplegar mensaje
	   call ReadInt 
	   call Crlf ; ir a la siguiente línea de salida
	   mov ecx,eax; n está en ecx
	   mov n, ecx
	  mov ESI, offset temps

	 
	ciclo: 
	   
	   mov edx,OFFSET m2
	   call WriteString ; desplegar mensaje
	     
	   mov  eax, index
	   call WriteInt
      call ReadInt 	  
	   inc index
	   
       mov [ESI], eax
       add ESI, type temps
	   loop ciclo
	   
	   	
	;es par o impar
	   mov edx,0
	   mov eax, n
	   mov ebx,2
	   idiv ebx ; eax tiene la div y edx el residuo
	  
	  mov ecx, eax
	   mov eax,0
	   mov ebx,0
	   
	   
	   mov edx,  n
	   imul edx,4
	   sub edx,4
	 
	 	 
	 ciclo2:
	    mov ebx, temps[eax]
		mov esi,temps[edx]
		mov temps[eax], esi
		mov temps[edx], ebx
		add eax, 4
		sub edx, 4
		loop ciclo2
	  
	   mov ecx,n
	   mov ebx,0
	   
	 ciclo3:
       mov edx,OFFSET m4
	   call WriteString ; desplegar mensaje
	     
	   mov  eax, index2
	   call WriteInt
	   
       mov eax, temps[ebx]	  
	   call WriteInt
	   mov edx,0
	   idiv dos
	   CMP edx,0
	   JNE impar 
       mov edx,OFFSET par
	   call WriteString ; desplegar mensaje   
	   JMP finif
	   
	 impar:
	   mov edx,OFFSET imp
	   call WriteString ; desplegar mensaje 
	  
	finif:
	  call Crlf
	     
	   inc index2
	   add ebx,4
	        
	   loop ciclo3
	
		mov edx,OFFSET adios
	    call WriteString ; desplegar mensaje
		
	   
	   call Crlf
    exit
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main