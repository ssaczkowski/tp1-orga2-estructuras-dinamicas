	
section .data


msg1:   db     `\n\n\n*****\nDIR.PUNTERO = %p\nDIR.NODO = %p VAL.NODO = %d\nD.pD = %p V.pD = %pD.pI = %p V.pI = %s\n`, 10, 0
msg2:   db     `DIRECCION PUNTERO = %p\n`, 10, 0
msg3:   db     "PUNTERO  = %p", 10, 0
msg4:    db     `\nVALOR EN NODO DER= %d DIRECCION DEL PTR NODO DER= %p`, 10, 0
msg5:    db "IMPRIMO ARBOL BINARIO EN PRE-ORDEN =", 10, 0


ptrNodo dd 0
ptrNodo2 dd 0


section .bss


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
    mov ebp, esp                               
    push EBP
    mov EBP, ESP
    mov EBX, ptrNodo
    mov ECX, 8
    push ECX
    push ebx
    call _agregar_abb
    pop ecx
    pop ebx 
    pop EBP
   
    ;PRUEBA SEGUNDO VALOR
    mov ebp, esp                              
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
    
    ;PRUEBA TERCER VALOR
    mov ebp, esp                              
    push EBP
    mov EBP, ESP
    mov EBX, [ptrNodo]
    mov ECX, 17
    push ECX
    push ebx
    call _agregar_abb
    pop ecx
    pop ebx 
    pop EBP
    
    ;PRUEBA CUARTO VALOR
    mov ebp, esp                                
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
    
     ;PRUEBA QUINTO VALOR
    mov ebp, esp                                
    push EBP
    mov EBP, ESP
    mov EBX, [ptrNodo]
    mov ECX, 2
    push ECX
    push ebx
    call _agregar_abb
    pop ecx
    pop ebx 
    pop EBP
    
     ;PRUEBA SEXTO VALOR
    mov ebp, esp                              
    push EBP
    mov EBP, ESP
    mov EBX, [ptrNodo]
    mov ECX, 3
    push ECX
    push ebx
    call _agregar_abb
    pop ecx
    pop ebx 
    pop EBP 
    ;PRUEBA SEPTIMO VALOR
    mov ebp, esp                                 
    push EBP
    mov EBP, ESP
    mov EBX, [ptrNodo]
    mov ECX, 7
    push ECX
    push ebx
    call _agregar_abb
    pop ecx
    pop ebx 
    pop EBP 
   ;PRUEBA OCTAVO VALOR
    mov ebp, esp                              
    push EBP
    mov EBP, ESP
    mov EBX, [ptrNodo]
    mov ECX, 15
    push ECX
    push ebx
    call _agregar_abb
    pop ecx
    pop ebx 
    pop EBP     
    
    ;IMPRIMO ARBOL EN PRE-ORDEN     
    push dword msg5
    call _printf
    add esp,4
    mov eax,[ptrNodo]
    mov ebp, esp                                
    push EBP
    mov EBP, ESP
    push eax
    call _mostrar_abb
    pop eax
    pop ebp 
   
    ;BORRAR UN NODO
    ;PRIMERO BUSCO EL NODO SEGUN EL VALOR INGRESADO
        
    mov ebp, esp                                
    push EBP
    mov EBP, ESP
    mov EBX, ptrNodo
    mov ECX,6  
    push ecx
    push ebx
    call _buscarNodo 
    pop ecx
    pop ebx 
    pop EBP
    mov ecx,eax ; LA FUNCION RETORNA EL PUNTERO AL NODO CON EL VALOR INGRESADO
    
    push ecx
    push msg2
    call _printf
    add esp,4
    pop ecx
    
             
    ;BORRO ABB
    mov ebp, esp                                
    push EBP
    mov EBP, ESP
    mov EBX, ptrNodo
    push ecx
    push ebx
    call _borrar_abb 
    pop ecx
    pop ebx 
    pop EBP
             
             
              
    ;IMPRIMO ARBOL EN PRE-ORDEN     
    push dword msg5
    call _printf
    add esp,4
    mov eax,[ptrNodo]
    mov ebp, esp                                
    push EBP
    mov EBP, ESP
    push eax
    call _mostrar_abb
    pop eax
    pop ebp 
    
    ret           
          