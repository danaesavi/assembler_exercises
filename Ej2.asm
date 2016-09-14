; Data Transfer Ejercicios BA       (EjerBC.asm)

; Uso de instrucciones, Directivas data y operadores.
INCLUDE Irvine32.inc

.DATA
calif byte "Ingresa calificacion ", 0
fin byte "ADIOS ",0
n byte "Ingrese numero de calificaciones a ingresar ",0
total byte "total: ", 0
cont DWORD 0
cuenta DWORD 0
valor DWORD 0

.CODE
main PROC
; Ingrese N
	mov edx, offset n
    call writeString
	call readint
	mov cont, eax ;contador N  

; Escriba comentarios
	
iniWh: 
  CMP cont,0
  JBE finWh

	call crlf
	mov edx, offset calif
    call writeString
	call readint
	
	mov valor, eax
			CMP eax, 59 
			JBE otro ;if cal>59
		      CMP eax, 74
			JBE  otro2 ;if cal >74
				CMP eax, 89
			JBE  otro3 ;if cal >89	
				mov al, "A"
				JMP finSi
			otro3:
				mov al, "B"
				JMP finSi
			otro2:
				mov al, "C"
				JMP finSi
			otro:
				mov al, "D"
				JMP finSi
			finSi:
			
	call writeChar
	mov eax, valor 
	call CrLf
	call writeInt

;decremento el contador y sumo el total de las calificaciones
dec cont
add cuenta, eax

JMP iniWh
finWh:  

	
;Imprime total
mov EDX, offset total
call WriteString
call CrLf

call WriteInt 
call CrLf
mov EDX, offset fin
call WriteString
	
exit
main ENDP
END main