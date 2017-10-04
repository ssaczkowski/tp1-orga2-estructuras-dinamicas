     
section .data

msg_izq:    db     `\nPARTE IZQ =\n`, 10, 0
msg_der:    db    "PARTE DER = ", 10, 0
msg_comparacion: db `\nCOMPARACION \nvalorAInsertar: %d y contenido: %p`, 10, 0
msg_verValorYPuntero: db  `****VALOR : %d Y PUNTERO : %p****\n`, 10, 0

section .text
extern _malloc
extern _printf
global _agregar_abb

_agregar_abb:
    push EBP
    mov EBP, ESP
    mov EDX, [EBP+8] ;DIRECCION DEL PUNTERO
    mov EBX, [EBP+12];VALOR RECIBIDO
    mov esi,[EDX] 
       
    ; Para test   
    push dword esi
    push dword ebx
    push dword msg_comparacion
    call _printf
    add esp,4
    pop ebx
    pop esi
    ;    
        
    mov edi,0
    cmp edi,esi
    je      punteroEsNull
    jmp     punteroConAsignacion
    
    
    punteroEsNull:      
        mov	eax, 12                   
        push    eax
        call    _malloc                     
        mov EDX, [EBP+8] ;DIRECCION DEL PUNTERO
        mov    [edx],eax ;EN EL CONTENIDO DEL PUNTERO LE ASIGNO LA DIRECCION QUE DEVUELVE MALLOC
     
        mov     edx,[edx]
        mov     [edx],ebx
        mov     ebx,0
        mov     [edx+4],ebx
        mov     [edx+8],ebx
         ;   
        push dword edx
        push dword [edx]
        push dword msg_verValorYPuntero
        call _printf
        add esp,4
        pop edx
        
        add      ESP, 4
        jmp     finalizar
     
    punteroConAsignacion:
    ;EBX TIENE EL SIGUIENTE VALOR INGRESADO
    ;EDX TIENE LA DIRECCION DE MEMORIA DEL NODO ANTERIOR
    ;[EDX] TIENE EL VALOR DEL NODO DEL VALOR ANTERIOR
    ;COMPARO SI EL VALOR INGRESADO ES MENOR AL VALOR DEL NODO ANTERIOR
    
      
      mov EDX, [EBP+8] ;DIRECCION DEL PUNTERO
      mov EBX, [EBP+12];VALOR RECIBIDO
      mov esi,[EDX] 

      cmp ESI,EBX
      jb  seteoElPtrDerDelNodo
      jmp seteoElPtrIzqDelNodo
    
     seteoElPtrDerDelNodo:
      ;Para test
      push dword msg_der 
      call _printf
      add  ESP, 4
      ;
    
      mov esi, [EBP+8] ;DIRECCION DEL PUNTERO
      add esi,4 ;ACCEDEMOS A LA DIRECCION DEL PUNTERO DEL NODO DER

     
     mov edx,esi
     mov edx,[edx]
     cmp edx,0
     je ejecutoFuncion
     mov esi,edx 
     
     ejecutoFuncion:
        push ebx
        push esi
        call _agregar_abb
        pop esi
        pop ebx

        jmp finalizar

    
    seteoElPtrIzqDelNodo:   
        ;Para test
        push dword msg_verIzq
        call _printf
        add   ESP, 4
        ;
    
        mov esi, [EBP+8] ;DIRECCION DEL PUNTERO
        add esi,8 ;ACCEDO A LA DIRECCION DEL PUNTERO DEL NODO IZQ
        mov edx,esi
        mov edx,[edx]
        cmp edx,0
        je llamar
        mov esi,edx  

       ejecutoFuncion:
          push ebx
          push esi
          call _agregar_abb
          pop esi
          pop ebx

          jmp finalizar
  
   finalizar:
             
        mov     [EBP-4], EAX
        mov     ESP, EBP
        pop     EBP
        ret  