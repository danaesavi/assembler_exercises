TITLE Tarea1	(tarea.asm)

; Descripcion:
; Programa que pide al usuario un número,
; hace una operación, imprime el resultado, los 
; registros y .Data 

; Fecha de ultima modificacion:
; 10-oct-2015

INCLUDE Irvine32.inc

.DATA
A SDWORD 7
B SDWORD ?
D SDWORD -15
R SDWORD ?
mensaje BYTE "Escribe un entero en decimal",0
resultado BYTE "El resultado es:",0
vaciadoReg BYTE "Vaciado de Registros",0
vaciadoData BYTE "Vaciado de A,B,C y R",0

.CODE
; Procedimiento principal
main PROC
    call Clrscr


  ;Imprimir Mensaje
   
   mov edx,OFFSET mensaje ; "Escribe un entero en decimal y oprime Enter"
   call WriteString ; desplegar mensaje
   call ReadInt ; entero se guarda en EAX 
   call Crlf ; ir a la siguiente línea de salida
   mov B, eax ; poner el entero en B
	
	;OPERACIÓN
    neg eax   ; -B
    add eax,9 ; -B+9
    sub eax,A ; -B+9-A
    add eax,D ; -B+9-A+D
    add eax,1 ;; -B+9-A+D+1
	mov R,eax ; Guardar en R el resultado
	
	;Desplegar Resultado (ya está en eax)
	mov edx, OFFSET resultado ; "EL resultado es:"
	call Writestring ;desplegar mensaje de resultado
	Call Crlf   
	call WriteInt
    call Crlf

    ; Vaciado de los registros en hex
	mov edx, OFFSET vaciadoReg ; "Vaciado de Registros"
	call WriteString ; desplegar mensaje registros
	call Crlf  
	call DUmpRegs ; vaciado de registros
	
	;Vaciado de A,B,C y R en hex
	mov edx, OFFSET vaciadoData ; "Vaciado de A,B,C y R"
	call WriteString  ; desplegar mensaje data
	call Crlf
	mov esi, OFFSET A ; desde dónde
    mov ecx, 4 ; longitud del tipo de dato (bytes)
    mov ebx, 4 ; cantidad de datos    
    call DumpMem ; vaciado de .Data

		
    exit
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main
