;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
struc   nodo
	valor:	resb    4
	ptrIzq:	resb	4
	ptrDer:	resb	4
endstruc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
section .data
    message1: db `*****INGRESO DE DATOS*****\n(ingrese 0 para salir)\n`,10, 0
    message2: db "Ingrese un valor: : ", 0
    message3: db "Ingrese el valor que quiere borrar: ", 0
    formatin: db "%d", 0
    formatout: db "%d", 10, 0 ; newline, nul terminator
    integer1: times 4 db 0 ; 32-bits integer = 4 bytes
    integer2: times 4 db 0 ; 32-bits integer = 4 bytes

    
struct:
    istruc nodo
      ;  at valor, dw     -1
       ; at ptrIzq, db     0
       ; at ptrDer, db    0
    iend

msg1:   db     `\n\n\n*****EN ASSEMBLER INGRESO PRIMERO 8 Y LUEGO 15\nDIR.PUNTERO = %p\nDIR.NODO = %p VAL.NODO = %d\nD.pD = %p V.pD = %pD.pI = %p V.pI = %s\n`, 10, 0
msg2:   db     `DIRECCION PUNTERO = %p\n`, 10, 0
msg3:   db     "PUNTERO  = %p", 10, 0
msg4:    db     `\nVALOR EN NODO DER: %d DIRECCION DEL PTR NODO DER: %p`, 10, 0
msg5:    db "IMPRIMO ARBOL BINARIO EN PRE-ORDEN", 10, 0
msgP: db "%p", 10, 0
msnN:   db `\nVALOR INGRESADO : %d\n`, 10, 0

ptrNodo dd 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .bss
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .text

    
    global _main
    extern _printf
    extern _scanf
    extern _malloc
    extern _insertaNodo
    extern _imprimir
    extern _imprimirArbol
    extern _buscarNodo
    extern _borrado
    extern _cargarDatos
    extern _cargar
_main:
   push message1
   call _printf
   add esp, 4 ; remove parameters
   
   push message2
   call _printf
   add esp, 4 ; remove parameters
   
   push integer1 ; address of integer1 (second parameter)
   push formatin ; arguments are right to left (first parameter)
   call _scanf
   mov edx,eax
   add esp, 8 ; remove parameters
   mov ebx, dword [integer1]
   
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    mov ecx, ptrNodo
    push ebx
    push ecx
    call _insertaNodo
    pop ecx
    pop ebx ;add ESP, 8
    pop EBP
  
    inicio:
   push message2
   call _printf
   add esp, 4 ; remove parameters
   push integer1 ; address of integer1 (second parameter)
   push formatin ; arguments are right to left (first parameter)
   call _scanf
   mov edx,eax
   add esp, 8 ; remove parameters
      mov ebx, dword [integer1]

   cmp ebx,0
   je seguir
   
   
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    mov ecx, [ptrNodo]
    push ebx
    push ecx
    call _insertaNodo
    pop ecx
    pop ebx ;add ESP, 8
    pop EBP
   jmp inicio
   
      
        
    
   
    seguir:
    ;IMPRIMO ARBOL EN PRE-ORDEN     
    push dword msg5
    call _printf
    add esp,4
    mov ebx,[ptrNodo]
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    push ebx
    call _imprimirArbol
    pop ebx
    pop ebp 
   
    ;BORRAR UN NODO
    ;INGRESAR UN DATO
  ;************FUNCION INGRESAR DATO NO FUNCIONA!!!!!**************
      push message3
      call _printf
      add esp, 4 ; remove parameters
      push integer2 ; address of integer1 (second parameter)
      push formatin ; arguments are right to left (first parameter)
      call _scanf
      mov edx,eax
      mov ebx, dword [integer2]
      add esp, 8 ; remove parameters
    ;************FUNCION INGRESAR DATO NO FUNCIONA!!!!!**************
    ;PRIMERO BUSCO EL NODO SEGUN EL VALOR INGRESADO
        
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    mov ECX, ptrNodo
    ;mov EBX,6  ;EJEMPLO SE INGRESO EL 3
    push ebx
    push ecx
    call _buscarNodo ;LLAMO A LA FUNCION C _buscarNodo
    pop ecx
    pop ebx ;add ESP, 8
    pop EBP
    mov ecx,eax ; LA FUNCION RETORNA EL PUNTERO AL NODO CON EL VALOR INGRESADO
    push ecx
    push msg3
    call _printf
    add esp,4
    pop ecx
    cmp ecx,0
    je salir
    
               
    ;LLAMO A FUNCION BORRADO
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    mov EBX, ptrNodo
    push ecx
    push ebx
    call _borrado ;LLAMO A LA FUNCION C _buscarNodo
    pop ecx
    pop ebx ;add ESP, 8
    pop EBP
             
             
     salir:
              
    ;IMPRIMO ARBOL EN PRE-ORDEN     
    push dword msg5
    call _printf
    add esp,4
    mov eax,[ptrNodo]
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    push eax
    call _imprimirArbol
    pop eax
    pop ebp 
    
    ret           
          