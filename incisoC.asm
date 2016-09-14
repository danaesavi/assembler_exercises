; Data Transfer Ejercicios BA       (EjerBC.asm)

; Uso de instrucciones, Directivas data y operadores.

INCLUDE Irvine32.inc
.DATA
m1 BYTE "Teclee el dato n (mayor o igual a 1, menor o igual a 20): ",0
m2 BYTE "Termino ",0
m3 BYTE ": ",0
m4 BYTE "Total: ",0
n DWORD ?
total DWORD 0

.CODE
main PROC
; Escriba comentarios
;arrB

	leerN:
		mov edx, OFFSET m1 ; desplegar mensaje "Teclee el dato n: "
		call WriteString  
		call ReadInt ; leer el dato n
		cmp eax,1
	jl leerN
		cmp eax,20
	jg leerN
		
	
	call Crlf
	call Crlf
	mov ecx, eax
	mov n,0
	
	ciclo:
		inc n
		mov eax, 0  ; el n-ésimo término se guarda en EAX temporalmente
		mov ebx, -1 ; EBX servirá para contar los sumandos que componen cada multiplicación
		
		dow: ;ciclo de la multiplicación para formar el n-ésimo término
			add eax, n
			inc ebx
			cmp ebx, n
	    jl dow
		
		mov ebx, eax ; en EBX ahora se guarda el n-ésimo término
		mov eax, n   ; en EAX ahora se guarda el número de término
		
		mov edx, OFFSET m2 ; desplegar mensaje "Termino "
		call WriteString  
		
		call WriteInt ; se imprime el número de término (n)
		
		mov edx, OFFSET m3 ; desplegar mensaje ": "
		call WriteString
		
		mov eax, ebx  ; en EAX nuevamente se guarda el n-ésimo término
		call WriteInt
		call Crlf
		
		add total, eax
	
	
	loop ciclo
	
	mov edx, OFFSET m4 ; desplegar mensaje "Total: "
	call WriteString
	
	mov eax, total ; imprime el total
	call WriteInt
	
	

	exit
main ENDP
END main