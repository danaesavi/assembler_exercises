
 

INCLUDE Irvine32.inc

.DATA
; Textos para la Consola
m1 BYTE "Total: ",0
m2 BYTE "Adios ",0

; Variables
array  SDWORD 10,60,20,33,72,89,45,65,72,18
sample SDWORD 50
arraySize SDWORD 40


 
.CODE
; Procedimiento principal
main PROC
   ; eax es el index
   mov eax, 0
   ;ebx es sum
   mov ebx, 0
    ;while
iniwh:
	
	CMP eax, arraySize
	JGE finwh
		mov ecx, sample
		CMP array[eax], ecx
		JG finif
		add ebx,array[eax]
		
	finif:
		add eax, type array
		JMP iniwh
		
	
finwh:



   call Clrscr
    mov edx,OFFSET m1
	call WriteString
	mov eax, ebx
	call Writeint
    
    ; ADIOS
    call Crlf
    mov edx,OFFSET m2
    call WriteString
	call Crlf

    exit
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main