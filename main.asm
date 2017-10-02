;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
struc   nodo
	valor:	resb    4
	ptrIzq:	resb	4
	ptrDer:	resb	4
endstruc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
section .data

struct:
    istruc nodo
      ;  at valor, dw     -1
       ; at ptrIzq, db     0
       ; at ptrDer, db    0
    iend

msg1:   db     `\n\n\n*****EN ASSEMBLER INGRESO PRIMERO 8 Y LUEGO 15\nDIR.PUNTERO = %p\nDIR.NODO = %p VAL.NODO = %d\nD.pD = %p V.pD = %pD.pI = %p V.pI = %s\n`, 10, 0
msg2:   db     `DIRECCION PUNTERO = %P\n`, 10, 0
msg3:   db     "PUNTERO  = %p", 10, 0
msg4:    db     `\nVALOR EN NODO DER: %d DIRECCION DEL PTR NODO DER: %p`, 10, 0
msnN:   db "nanan", 10, 0

ptrNodo dd 0
ptrNodo2 dd 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .bss
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .text
    global _main
    extern _printf
    extern _scanf
    extern _malloc
    extern _agregar_abb
    extern _imprimir
    extern _mostrar_abb
_main:
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    mov EBX, ptrNodo
    mov ECX, 8
    push ECX
    push ebx
    call _agregar_abb
    pop ecx
    pop ebx ;add ESP, 8
    pop EBP
    mov [ptrNodo],eax
    
     ;PRUEBA SEGUNDO VALOR
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    mov EBX, [ptrNodo]
    mov ECX, 7
    push ECX
    push ebx
    call _agregar_abb
    pop ecx
    pop ebx ;add ESP, 8
    pop EBP
    
    ;PRUEBA 3ER VALOR
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    mov EBX, [ptrNodo]
    mov ECX, 2
    push ECX
    push ebx
    call _agregar_abb
    pop ecx
    pop ebx ;add ESP, 8
    pop EBP
    
    ;4to valor
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    mov EBX, [ptrNodo]
    mov ECX, 15
    push ECX
    push ebx
    call _agregar_abb
    pop ecx
    pop ebx ;add ESP, 8
    pop EBP
    
    ;imprimir
    mov eax,[ptrNodo]
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    push eax
    call _imprimir
    pop eax
    pop ebp
    
    ;IMPRESION 2DO NODO
     mov eax,[ptrNodo]
     add eax,8
     mov eax,[eax]
     mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    push eax
    call _imprimir
    pop eax
    pop ebp
    
    ;IMPRESION 3ER NODO
     mov eax,[ptrNodo]
     add eax,8
    mov eax,[eax]
    add eax,8
    mov eax,[eax]
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    push eax
    call _imprimir
    pop eax
    pop ebp
     
   ;IMPRESION 3ER NODO
     mov eax,[ptrNodo]
     add eax,4
     mov eax,[eax]
     mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    push eax
    call _imprimir
    pop eax
    pop ebp                  
    
    ;IMPRIMO ARBOL EN PRE-ORDEN     
    mov eax,[ptrNodo]
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    push eax
    call _mostrar_abb
    pop eax
    pop ebp 
      
    ret           
          