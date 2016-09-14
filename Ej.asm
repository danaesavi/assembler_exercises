

INCLUDE Irvine32.inc

.DATA
; Textos para la Consola
titulo BYTE 0dh,0ah,"Ejercicio segundo del 28 oct.",0dh,0ah,0
prompt01 BYTE "Dato n: ",0
prompt02 BYTE "Teclee la ",0
prompt03 BYTE " temperatura: ",0
prompt04 BYTE "Temperatura ",0
prompt05 BYTE "Menor de las temperaturas: ",0
prompt06 BYTE ": ",0
prompt07 BYTE "ADIOS.",0
prompt08 BYTE "ADIOS por n<=0.",0

; Variables
n      SDWORD ?
men    SDWORD ?
arrTmp SDWORD 100 DUP(?)
 
.CODE
; Procedimiento principal
main PROC
    call Clrscr
    mov edx,OFFSET titulo
    call WriteString
	
    ; Lectura del dato n
	call Crlf
    mov edx,OFFSET prompt01
    call WriteString
	call ReadInt   ; valor leido en eax
	mov n, eax
	call Crlf
	
	;if(n<=0) checando
	CMP n, 0
	JG finIf1; >
		mov edx,OFFSET prompt08
		call WriteString
		call Crlf
	    exit
finIf1:

    ; Lectura de la primer temperatura
	mov ebx, 1    ; contador
    mov edx,OFFSET prompt02
    call WriteString
    mov eax, ebx
	call WriteInt
    mov edx,OFFSET prompt03
    call WriteString
	call ReadInt   ; valor leido en eax
	mov men, eax    ; la primer temperatura es el menor
	inc ebx    ; incremento por el temperatura leida

	mov esi, offset arrTmp    ;direccion inicial del arreglo
	mov [esi], eax   ; guardando la primer temperatura en el arreglo
	add esi, TYPE arrTmp    ; moviendo el apuntador al segundo elemento del arreglo
	
    ; while(ebx <= n)	
iniWh1:
    CMP EBX, n
    JG finWh1    ; >
		; Lectura de al siguiente temperatura
		mov edx,OFFSET prompt02
		call WriteString
		mov eax, ebx
		call WriteInt
		mov edx,OFFSET prompt03
		call WriteString
		call ReadInt   ; valor leido en eax
	    mov [esi], eax   ; guardando la siguiente temperatura, operando indirecto
	    add esi, TYPE arrTmp    ; moviendo el apuntador al siguiente elemento del arreglo

		; if(eax < men)
		CMP EAX, men
		JGE finIni1    ; >=
		    MOV men, EAX
	finIni1:
	
        INC ebx    ; incrementando el contador
    JMP iniWh1
finWh1:
	
    ; Imprimiendo el Menor de los salarios
	call Crlf
    mov edx,OFFSET prompt05
    call WriteString
	mov eax, men
	call WriteInt
	call Crlf
	call Crlf
	
	; IMPRIMIENDO el arreglo de temperaturas en sentido inverso
	mov ebx, n    ; contador
    ; ESI termino apuntado cuatro lugares mas adelante del ultimo elemento.
    ; while(ebx >= 1)	
iniWh2:
    CMP EBX, 1
    JL finWh2    ; <
		; Impresion de la siguiente temperatura
		mov edx,OFFSET prompt04
		call WriteString
		mov eax, ebx
		call WriteInt
		mov edx,OFFSET prompt06
		call WriteString
	    sub esi, TYPE arrTmp    ; moviendo el apuntador al anterior elemento del arreglo	
	    mov eax, [esi]   ; tomando la siguiente temperatura, operando indirecto
		call WriteInt   ; imprimiendo la siguiente temperatura
    	call Crlf
        DEC ebx    ; decrementando el contador
    JMP iniWh2
finWh2:
		
    ; ADIOS
    	call Crlf
    mov edx,OFFSET prompt07
    call WriteString
	call Crlf

    exit
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main