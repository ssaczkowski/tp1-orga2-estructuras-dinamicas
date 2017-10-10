;Ejemplo de la estructura a desarrollar. 
;struc   nodo
;	valor:	resb    4
;	ptrIzq:	resb	4
;	ptrDer:	resb	4
;endstruc
	
section .data

    msg_ingresoDatos: db `*****INGRESO DE DATOS*****\n(ingrese 0 para salir)\n`,10, 0
    msg_ingresoValor: db "Ingrese un valor: : ", 0
    msg_ingresoParaBorrar: db "Ingrese el valor que quiere borrar: ", 0
    formatin: db "%d", 0
    formatout: db "%d", 10, 0 
    integer1: times 4 db 0 
    integer2: times 4 db 0 
    msg_puntero:   db     "PUNTERO  = %p", 10, 0
    msg_imprimoPreOrden:    db "IMPRIMO ARBOL BINARIO EN PRE-ORDEN", 10, 0
    ptrNodo dd 0


section .bss



section .text

    
    global _main2
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
_main2:
   push msg_ingresoDatos
   call _printf
   add esp, 4 
   
   push msg_ingresoValor
   call _printf
   add esp, 4 
   
   ;LEO UN VALOR
   push integer1 
   push formatin 
   call _scanf
   mov edx,eax
   add esp, 8 
   mov ebx, dword [integer1]
   
   ;INGRESO EL VALOR
   mov ebp, esp                               
   push EBP
   mov EBP, ESP
   mov ecx, ptrNodo
   push ebx
   push ecx
   call _insertaNodo
   pop ecx
   pop ebx 
   pop EBP
  
   inicio:
       push msg_ingresoValor
       call _printf
       add esp, 4 
       push integer1 
       push formatin 
       call _scanf
       mov edx,eax
       add esp, 8 
       mov ebx, dword [integer1]
       cmp ebx,0
       je seguir
   
   
       mov ebp, esp                              
       push EBP
       mov EBP, ESP
       mov ecx, [ptrNodo]
       push ebx
       push ecx
       call _insertaNodo
       pop ecx
       pop ebx 
       pop EBP
       jmp inicio
   

    seguir:
        ;IMPRIMO ARBOL EN PRE-ORDEN     
        push dword msg_imprimoPreOrden
        call _printf
        add esp,4
        mov ebx,[ptrNodo]
        mov ebp, esp                              
        push EBP
        mov EBP, ESP
        push ebx
        call _imprimirArbol
        pop ebx
        pop ebp 
   
        ;BORRAR UN NODO
        ;INGRESAR UN DATO
        push msg_ingresoParaBorrar
        call _printf
        add esp, 4 
        push integer2 
        push formatin 
        call _scanf
        mov edx,eax
        mov ebx, dword [integer2]
        add esp, 8 
   
        ;PRIMERO BUSCO EL NODO SEGUN EL VALOR INGRESADO
        mov ebp, esp                               
        push EBP
        mov EBP, ESP
        mov ECX, ptrNodo
        push ebx
        push ecx
        call _buscarNodo 
        pop ecx
        pop ebx 
        pop EBP
        mov ecx,eax 
        push ecx
        push msg_puntero
        call _printf
        add esp,4
        pop ecx
        cmp ecx,0
        je salir
    
               
        ;LLAMO A FUNCION BORRADO
        mov ebp, esp                               
        push EBP
        mov EBP, ESP
        mov EBX, ptrNodo
        push ecx
        push ebx
        call _borrado 
        pop ecx
        pop ebx 
        pop EBP
             
             
     salir:
              
        ;IMPRIMO ARBOL EN PRE-ORDEN     
        push dword msg_imprimoPreOrden
        call _printf
        add esp,4
        mov eax,[ptrNodo]
        mov ebp, esp                                
        push EBP
        mov EBP, ESP
        push eax
        call _imprimirArbol
        pop eax
        pop ebp 
        
        ret           
          