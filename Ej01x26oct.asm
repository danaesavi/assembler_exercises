TITLE Ejercicio 1 del 26-oct-15	(Ej01x26oct.asm)*

; Descripcion:
; Ejemplo de implementacion de Estructuras Algoritmicas.
; 

INCLUDE Irvine32.inc

.DATA
; Textos para la Consola
titulo BYTE 0dh,0ah,"Primer ejercicio 26oct15.",0dh,0ah,0
prompt01 BYTE "Primer entero signado: ",0
prompt02 BYTE "Segundo entero signado: ",0
prompt03 BYTE "Tercer entero signado: ",0
prompt04 BYTE "El mayor es: ",0
prompt05 BYTE "ADIOS.",0
; Variables
mayor  SDWORD ?
dos    SDWORD ?
tres   SDWORD ?
 
.CODE
; Procedimiento principal
main PROC
    call Clrscr
    mov edx,OFFSET titulo
    call WriteString

    ; Lectura del primer valor	
	call Crlf
    mov edx,OFFSET prompt01
    call WriteString
    call ReadInt
	mov mayor, eax    ; El "mayor" por ahora

    ; Lectura del segundo valor	
	call Crlf
    mov edx,OFFSET prompt02
    call WriteString
    call ReadInt    ; En EAX se ecuentra el segundo valor leido

    ; IF(EAX > mayor)
	cmp eax, mayor
	jle finSi1    ; <=
	    mov mayor, eax
finSi1:

    ; Lectura del tercer valor	
	call Crlf
    mov edx,OFFSET prompt03
    call WriteString
    call ReadInt    ; En EAX se ecuentra el tercer valor leido

    ; IF con signo, EAX > mayor?
	cmp eax, mayor
	jle finSi2    ; <=
	    mov mayor, eax
finSi2:

    ; Impresion del mayor
	call Crlf
    mov edx,OFFSET prompt04
    call WriteString
	mov eax, mayor
	call WriteInt  ; de eax
	call Crlf
	
    ; ADIOS
    mov edx,OFFSET prompt05
    call WriteString
	call Crlf

    exit
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main