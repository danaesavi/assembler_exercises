TITLE Program Template          (InvStrP.asm)

; Este programa llama a un procedimiento que realiza la operación factorial

INCLUDE Irvine32.inc

.data
m1 BYTE "Operacion de factorial: N! ",0
m2 BYTE "Si N>0, entonces N!=1x2x3x...N-1xN = NxN-1x...3x2x1 ",0
m3 BYTE "Por ejemplo, si N=3: ",0
m4 BYTE "Si N==0, entonces 0!=1 por definicion.",0
m5 BYTE "Si N<0, ERRONEO.",0
m7 BYTE "Por ejemplo, si N= -2: ",0
m6 BYTE "Teclee N",0
tipo SDWORD 3	
fact BYTE "Fact(",0
parentgual BYTE ")= ",0
err BYTE "ERRONEO",0

.code
main PROC
   call Clrscr
   mov edx,OFFSET m1
   call WriteString ; "Operacion de factorial: N!"
   call Crlf
   mov edx,OFFSET m2
   call WriteString ;"Si N>0, entonces N!=1x2x3x…N-1xN=NxN-1x…3x2x1 "
   call Crlf
   mov edx,OFFSET m3
   call WriteString ;"Por ejemplo, si N=3: "
   call Crlf
   call factorial
   call Crlf
   mov edx,OFFSET m4
   call WriteString ;"Si N==0, entonces 0!=1 por definición."
   call Crlf
   mov tipo,0
   call factorial
   call Crlf
   mov edx,OFFSET m5
   call WriteString ;"Si N<0, ERRONEO."
   call Crlf
   mov edx,OFFSET m7
   call WriteString ;"Por ejemplo, si N= -2: "
   call Crlf
   mov tipo,-2
   call factorial
   call Crlf
   mov edx,OFFSET m6
   call WriteString ;"Teclee N"
   call Crlf
   call ReadInt ; entero se guarda en EAX 
   call Crlf ; ir a la siguiente línea de salida
   mov tipo,eax
   call factorial 
	exit
main ENDP

factorial PROC	
	mov edi,1
	;Checar si es 0,menor a 0 o mayor a 0
	;if num<0
	cmp tipo,0
	jge mayoroigual	
		;es erróneo
	jmp erroneo
  mayoroigual:
	 ;elif num>0
	 cmp tipo,0
	 je  igual 
        ;operación factorial
		mov ecx,tipo 
		while1:
			mov ebx,ecx			
			imul ebx,edi
			mov edi,ebx		
			loop while1
         
    jmp finSI1
	igual:
	 ;no hay nada que hacer
  finSI1:
	;imprime resultado
	 mov edx,OFFSET fact
     call WriteString ; "fact("
     mov eax, tipo
	 call WriteInt
	 mov edx,OFFSET parentgual
     call WriteString ; ")= "
	 mov eax,edi
	 call WriteInt
	 call Crlf ; ir a la siguiente línea de salida
	 jmp fin
	
  erroneo:
	 mov edx,OFFSET fact
     call WriteString ; "fact("
     mov eax, tipo
	 call WriteInt
	 mov edx,OFFSET parentgual
     call WriteString ; ")= "
	 mov edx,OFFSET err
	 call WriteString ; "ERRONEO"
	 
  fin:
	 ret
factorial ENDP
END main
