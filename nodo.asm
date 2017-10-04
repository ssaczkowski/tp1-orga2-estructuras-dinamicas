;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;struc   nodo
;	valor:	resb    4
;	ptrIzq:	resb	4
;	ptrDer:	resb	4
;endstruc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
section .data

;struct:
 ;   istruc nodo
      ;  at valor, dw     -1
       ; at ptrIzq, db     0
       ; at ptrDer, db    0
  ;  iend

msg1:   db     `\n\n\n*****EN ASSEMBLER INGRESO PRIMERO 8 Y LUEGO 15\nDIR.PUNTERO = %p\nDIR.NODO = %p VAL.NODO = %d\nD.pD = %p V.pD = %pD.pI = %p V.pI = %s\n`, 10, 0
msg2:   db     `DIRECCION PUNTERO = %p\n`, 10, 0
msg3:   db     "PUNTERO  = %p", 10, 0
msg4:    db     `\nVALOR EN NODO DER: %d DIRECCION DEL PTR NODO DER: %p`, 10, 0
msg5:    db "IMPRIMO ARBOL BINARIO EN PRE-ORDEN", 10, 0
msgP: db "%p", 10, 0
msnN:   db "nanan", 10, 0

ptrNodo dd 0
ptrNodo2 dd 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .bss
;ptrNodo: resb 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .text
    global _main
    extern _printf
    extern _scanf
    extern _malloc
    extern _agregar_abb
    extern _imprimir
    extern _mostrar_abb
    extern _buscarNodo
    extern _borrar_abb
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
   ; mov [ptrNodo],eax
   
      
        
    
     ;PRUEBA SEGUNDO VALOR
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    mov EBX, [ptrNodo]
    mov ECX, 6
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
    mov ECX, 17
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
    mov ECX, 4
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
    mov ECX, 3
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
    mov ECX, 7
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
    
    ;IMPRIMO ARBOL EN PRE-ORDEN     
    push dword msg5
    call _printf
    add esp,4
    mov eax,[ptrNodo]
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    push eax
    call _mostrar_abb
    pop eax
    pop ebp 
   
    ;BORRAR UN NODO
    ;PRIMERO BUSCO EL NODO SEGUN EL VALOR INGRESADO
        
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    mov EBX, ptrNodo
    mov ECX,6  ;EJEMPLO SE INGRESO EL 3
    push ecx
    push ebx
    call _buscarNodo ;LLAMO A LA FUNCION C _buscarNodo
    pop ecx
    pop ebx ;add ESP, 8
    pop EBP
    mov ecx,eax ; LA FUNCION RETORNA EL PUNTERO AL NODO CON EL VALOR INGRESADO
    
    push ecx
    push msg2
    call _printf
    add esp,4
    pop ecx
    
             
    ;LLAMO A FUNCION BORRADO
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    mov EBX, ptrNodo
    push ecx
    push ebx
    call _borrar_abb ;LLAMO A LA FUNCION C _buscarNodo
    pop ecx
    pop ebx ;add ESP, 8
    pop EBP
             
             
              
    ;IMPRIMO ARBOL EN PRE-ORDEN     
    push dword msg5
    call _printf
    add esp,4
    mov eax,[ptrNodo]
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    push eax
    call _mostrar_abb
    pop eax
    pop ebp 
    
    ret           
          