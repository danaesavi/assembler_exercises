; Data Transfer Ejercicios BA       (EjerBC.asm)

; Uso de instrucciones, Directivas data y operadores.

INCLUDE Irvine32.inc
.DATA



m1 BYTE "Teclee el dato n: ",0
m2 BYTE "Teclee la ",0
m3 BYTE " temperatura: ",0
m4 BYTE "Menor temperatura: ",0
m5 BYTE "Temperatura ",0
m6 BYTE ": ",0
m7 BYTE "ADIOS",0
menor SDWORD 7FFFFFFFh
temps SDWORD 0,0,0,0,0,0,0,0,0,0
n DWORD	?
index DWORD ?


.CODE
main PROC
	; 2-	Una vez leído el dato n (>=1) que indica el total de  
	;temperaturas que deberán leerse a continuación, calcule la mínima temperatura.
    ;Las temperaturas (enteros a 32 bits) pueden ser negativas, ceros o positivas.

	call Clrscr
   ;n>=0
   
	   mov edx,OFFSET m1
	   call WriteString ; desplegar mensaje
	   call ReadInt 
	   call Crlf ; ir a la siguiente línea de salida
	   mov ecx,eax; n está en ecx
	   mov ESI, offset temps
	   mov n, ecx
	   mov index, 0
	
	;ciclo que lee temperaturas
	ciclo: 
	   mov edx,OFFSET m2
	   call WriteString ; desplegar mensaje "Teclee la "
	   
	   inc index
	   mov eax, index
	   call WriteInt ; desplegar mensaje "#"
	   
	   mov edx,OFFSET m3
	   call WriteString ; desplegar mensaje " temperatura: "
	   
	   call ReadInt 
	   call Crlf ; ir a la siguiente línea de salida
	   mov [ESI], eax ; guardar en arreglo
	   add ESI, type temps ; incrementar
	   
	   ;menor
	   cmp eax, menor ; if (eax <= menor){
	   jg else1       
	   mov menor, eax ;   menor = eax
	                  ; }
	   	   
	   else1: 
	   
	loop ciclo
	   
	   ;imprime la temperatura menor
	   mov eax, menor
	  
	   mov edx,OFFSET m4
	   call WriteString ; desplegar mensaje
	   call Crlf ; ir a la siguiente línea de salida
	   call Crlf
	   call WriteInt
	   call Crlf
	   call Crlf
	   
	   
	   mov ecx, n
	   
	ciclo2:
	   mov edx,OFFSET m5
	   call WriteString ; desplegar mensaje "Temperatura "
	   
	   mov eax, ecx
	   call WriteInt
	   
	   mov edx,OFFSET m6 ; desplegar mensaje ": "
	   
	   sub ESI, TYPE temps
	   mov eax, [ESI]
	   call WriteInt
	   
	   call Crlf
	   
	loop ciclo2
	   	  
		  
	   mov edx,OFFSET m7
	   call WriteString ; desplegar mensaje "ADIOS"

	exit
main ENDP
END main