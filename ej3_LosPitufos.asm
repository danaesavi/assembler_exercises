TITLE Program Template          (InvStrP.asm)


INCLUDE Irvine32.inc

.data
instruccion BYTE "Teclee el dato un string <=30 caracteres: ",0
cad BYTE "Cadena: ",0
car BYTE "Caracter ",0
letraO BYTE "o: ",0
conv BYTE "Conversion: ",0
fin BYTE "ADIOS",0
stringLeido BYTE 31 DUP(0)
minusc BYTE " - minuscula", 0
mayusc BYTE " - MAYUSCULA", 0
o BYTE "o: ",0
index DWORD 1
tam DWORD 0

.code
main PROC
  
    call Clrscr
    call leeString
    call analisisCaracter
	call textoConvertido
  exit
main ENDP

leeString PROC	
   mov edx,OFFSET instruccion
   call WriteString ; "Teclee el dato un string <=30 caracteres: "
   mov edx, OFFSET stringLeido
   mov ecx, SIZEOF stringLeido
   call readString ;leo string y se guarda en EDX
   mov tam, eax ;guardo tamaño del string en EAX
   call crlf
   mov EDX, OFFSET cad
   call WriteString ;imprimo "Cadena: "
   mov EDX, OFFSET stringLeido
   call WriteString
   call crlf
	 
   ret
leeString ENDP

analisisCaracter PROC
mov ESI, 0
mov ECX, tam
   ciclo1:
      mov EDX, OFFSET car
      call WriteString; "Caracter "
	  mov eax, index
	  call WriteInt ;index
	  mov eax,0
	  mov EDX, OFFSET o
      call WriteString; "o: "
	  mov al, stringLeido[ESI]
      call WriteChar
	  mov bl,91
	  
      CMP bl, al

      ;if mayus (<60)
      JLE saltoMinuscula
         mov EDX, OFFSET mayusc
         call writeString
		  call crlf
         add al, 32 ;RESTO 20 en HEXA (32 DEC)
      JMP saltoMayusc

         ;else (minus)
      saltoMinuscula:
         mov EDX, OFFSET minusc
         call WriteString 
		 call crlf
         sub al, 32 ;SUMO 20 en HEXA
      saltoMayusc:

      mov stringLeido[ESI], al

      inc ESI 
	  inc index
      
   loop ciclo1
      
      ret
analisisCaracter ENDP

textoConvertido PROC

	mov EDX, OFFSET conv
	call WriteString;"Conversión: "
	mov EDX, OFFSET stringLeido ;string volteado
	call WriteString
	call crlf
	mov EDX, OFFSET fin
	call WriteString;"ADIOS"
    ret
textoConvertido ENDP


END main
