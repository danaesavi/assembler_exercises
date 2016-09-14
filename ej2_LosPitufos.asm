TITLE Program Template          (InvStrP.asm)


INCLUDE Irvine32.inc

.data
m3 BYTE "Teclee el dato n>=0: ",0
m4 BYTE "Teclee el ",0
m5 BYTE " salario: ",0
m6 BYTE "Resultado: ",0
index DWORD 1
fila BYTE 8
adios BYTE "ADIOS",0

.code
main PROC
  
   call Clrscr
   
  ;posicionar el cursor
   mov dh,fila ;row
   mov dl,14 ;column
   call Gotoxy ;locate cursor
   add fila,1 
   
   ;pide el dato n
   mov edx,OFFSET m3 
   call WriteString ; desplegar mensaje
   call ReadInt ; entero se guarda en EAX 
   call Crlf ; ir a la siguiente línea de salida
   mov ecx, eax ; poner el entero en ecx 
   mov ebx,0
   
   ;llamada a salarios
   call Salarios
   
   ;imprime suma de salarios
   ;posicionar el cursor
   mov dh,fila ;row
   mov dl,14 ;column
   call Gotoxy
   add fila,1 
   mov edx,OFFSET m6 
   call WriteString ; "Resultado"
   call WriteInt
   
   ;imprime adios
   ;posicionar el cursor
   mov dh,fila ;row
   mov dl,14 ;column
   call Gotoxy
   mov edx,OFFSET adios 
   call WriteString ; "Adios"
   
 
  
    exit
main ENDP

Possal PROC	
   ;posicionar el cursor
   mov dh,fila ;row
   mov dl,14 ;column
   call Gotoxy ;locate cursor
   add fila,1 
   mov edx,OFFSET m4 
   call WriteString ; teclee el 
   mov eax,index    ;index
   call WriteInt
   mov edx,OFFSET m5 
   call WriteString ; salario:
   call ReadInt ; entero se guarda en EAX 
	 
   ret
Possal ENDP

Salarios PROC
ciclo1:
   call Possal ;llamada a Possal
   call Crlf
   add ebx, eax ; suma de los salarios 
   inc index
   loop ciclo1
   mov eax,ebx  ;mueve la suma a eax 
   ret
Salarios ENDP

END main
