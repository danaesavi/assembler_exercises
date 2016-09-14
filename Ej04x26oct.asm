TITLE Ejercicio 4 del 26-oct-15	(Ej04x26oct.asm)*

; Descripcion:
; Ejemplo de implementacion de Estructuras Algoritmicas.
; 

INCLUDE Irvine32.inc

.DATA
; Textos para la Consola
titulo BYTE 0dh,0ah,"Ejercicio segundo del 26 oct.",0dh,0ah,0
prompt01 BYTE "Dato n: ",0
prompt02 BYTE "Teclee el ",0
prompt03 BYTE " salario: ",0
prompt04 BYTE "TOTAL: ",0
prompt05 BYTE "Mayor de los salarios: ",0
prompt06 BYTE " se encuentra en la posicion: ",0
prompt07 BYTE "ADIOS.",0
prompt08 BYTE "ADIOS por n<=0.",0

; Variables
n      SDWORD ?
may    SDWORD ?
total  SDWORD ?
posmay SDWORD ?
 
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

    ; Lectura del primer salario
	mov ebx, 1    ; contador
    mov edx,OFFSET prompt02
    call WriteString
    mov eax, ebx
	call WriteInt
    mov edx,OFFSET prompt03
    call WriteString
	call ReadInt   ; valor leido en eax
	mov may, eax    ; el primer salario es el mayor
	mov posmay, ebx    ; posicion del primer salario mayor
	mov total, eax
	
	inc ebx    ; incremento por el salario leido

    ; while(ebx <= n)	
iniWh1:
    CMP EBX, n
    JG finWh1    ; >
		; Lectura del primer salario
		mov edx,OFFSET prompt02
		call WriteString
		mov eax, ebx
		call WriteInt
		mov edx,OFFSET prompt03
		call WriteString
		call ReadInt   ; valor leido en eax
		add total, eax    ; sumatoria

		; if(eax > may)
		CMP EAX, may
		JLE finIni1    ; <=
		    MOV may, EAX
			MOV posmay, EBX
	finIni1:
	
        INC ebx    ; incrementando el contador
    JMP iniWh1
finWh1:
	
    ; Imprimiendo el Total
	call Crlf
    mov edx,OFFSET prompt04
    call WriteString
	mov eax, total
	call WriteInt
	call Crlf

    ; Imprimiendo el Mayor de los salarios
	call Crlf
    mov edx,OFFSET prompt05
    call WriteString
	mov eax, may
	call WriteInt
    ; Imprimiendo la posicion del Mayor de los salarios
    mov edx,OFFSET prompt06
    call WriteString
	mov eax, posmay
	call WriteInt
	call Crlf
	call Crlf

	
    ; ADIOS
    mov edx,OFFSET prompt07
    call WriteString
	call Crlf

    exit
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main