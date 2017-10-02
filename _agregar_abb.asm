global _agregar_abb

section .data
msg:    db     "PARTE IZQ", 10, 0
msg1:    db    "PARTE DER %d  %d", 10, 0
msg3:    db    "PUNTERO %p", 10, 0
msg4: db    "ENTRA A LA FUNCION CON PUNTERO CERO (NULL)", 10, 0

section .text
extern _malloc
extern _printf

_agregar_abb:
    push EBP
    mov EBP, ESP
    sub ESP, 4
    mov EDX, [EBP+8] ;DIRECCION DEL PUNTERO
    mov EBX, [EBP+12];VALOR RECIBIDO
    mov esi,[EDX]
    mov edi,0
    cmp edi,esi
    je      igual
    jmp     noIgual
      
    igual:      
        mov	eax, 12                    ; size of the structure
        push    eax
        call    _malloc                     ; get the memory allocated
        mov     [EAX],ebx
        mov     ebx,0
        mov     [eax+4],ebx
        mov     [eax+8],ebx
        add      ESP, 4
        jmp     finalizar
          
    noIgual:
    ;EBX TIENE EL SIGUIENTE VALOR INGRESADO
    ;EDX TIENE LA DIRECCION DE MEMORIA DEL NODO ANTERIOR
    ;[EDX] TIENE EL VALOR DEL NODO DEL VALOR ANTERIOR
    ;MOSTRAR EL VALOR DEL NODO ANTERIOR
    ;mov esi,[edx]
    ;push dword esi ; 
    ;push dword msg3
    ;call _printf
        ;
        ;COMPARO SI EL VALOR INGRESADO ES MENOR AL VALOR DEL NODO ANTERIOR
     cmp ESI,EBX
      jl  seteoElPtrIzqDelNodo
      jmp seteoElPtrDerDelNodo
     ;COMPARO SI EL VALOR INGRESADO ES MAYOR AL VALOR DEL NODO ANTERIOR
     ;cmp ESI,ebx
     
    
     seteoElPtrIzqDelNodo:
     ; push dword msg  ***MOSTRAR QUE ENTRA A LA IZQ, EL VALOR INGRESADO ES MENOR AL QUE ESTA EN EL NODO***
   ; call _printf
   ; add       ESP, 4
      mov esi,edx ;AHORA ESI TIENE LA DIRECCION DEL PUNTERO NODO 
      add esi,4 ; AUMENTAMOS 8 A EDX PARA ACCEDER A LA DIRECCION DEL PUNTERO DEL NODO IZQ
      mov ecx,ebp
      mov edi,esp
      push EBP
      mov EBP, ESP
      push ebx
      push esi
      call _agregar_abb
      pop esi
      pop ebx
      pop ebp
      mov ebx,0
      cmp [esi],ebx
      je asignar
      
  
    jmp finalizar
    asignar:
    mov [esi],eax
    jmp finalizar
    
    seteoElPtrDerDelNodo:
   ; push dword ebx ;   ++++MOSTRAR VALORES PARA PRUEBA+++++++
   ; push dword esi ***MOSTRAR QUE ENTRA A LA DER, EL VALOR INGRESADO ES MAYOR AL QUE ESTA EN EL NODO***
   ; push dword msg1
   ; call _printf
   ; add   ESP, 4
    
    mov esi,edx ;AHORA ESI TIENE LA DIRECCION DEL PUNTERO NODO 
    add esi,8 ; AUMENTAMOS 8 A EDX PARA ACCEDER A LA DIRECCION DEL PUNTERO DEL NODO IZQ
    ;push dword esi ;******LINEAS PARA IMPRIMIR LA DIRECCION POR PANTALLA****
    ;push dword msg3
    ;call _printf
    ;add esp,8
    ;******LLAMAR RECURSIVAMENTE*****
      mov ecx,ebp
      mov edi,esp
      push EBP
      mov EBP, ESP
      push ebx
      push esi
      call _agregar_abb
      pop esi
      pop ebx
      pop ebp
     mov ebx,0
      cmp [esi],ebx
      je asignar1
      
  
    jmp finalizar
    asignar1:
    mov [esi],eax
    jmp finalizar
       
   finalizar:
        
        mov     [EBP-4], EAX
        mov     ESP, EBP
        pop     EBP
        ret  
       
   