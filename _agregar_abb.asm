     
section .data

msg:    db     `\nPARTE IZQ\n`, 10, 0
msg1:    db    "PARTE DER", 10, 0
msg3:    db    "PUNTERO %p", 10, 0
msg4: db    "ENTRA A LA FUNCION CON PUNTERO CERO (NULL)", 10, 0
msgD: db `\nVALORES A COMPARAR\nvalor: %d y contenido: %p`, 10, 0
msg6:    db    "VALOR INSERTADO EN PUNT Izq  %d", 10, 0
msg7:    db    "VALOR INSERTADO EN PUNT DER  %d", 10, 0
prueba:    db     `***VALOR EN EL NODO %p\n`, 10, 0
msjPV: db  `****VALOR : %d Y PUNTERO : %p****\n`, 10, 0

section .text
extern _malloc
extern _printf
global _agregar_abb

_agregar_abb:
    push EBP
    mov EBP, ESP
    mov EDX, [EBP+8] ;DIRECCION DEL PUNTERO
    mov EBX, [EBP+12];VALOR RECIBIDO
    mov esi,[EDX] ;CONTENIDO DEL PUNTERO EN VALOR
    ;   
       push dword esi
        push dword ebx
        push dword msgD
        call _printf
        add esp,4
        pop ebx
        pop esi
     ;   
        
    mov edi,0
    cmp edi,esi
    je      igual
    jmp     noIgual
    igual:      
        mov	eax, 12                   
        push    eax
        call    _malloc                     
        mov EDX, [EBP+8] ;DIRECCION DEL PUNTERO
        mov    [edx],eax ;EN EL CONTENIDO DEL PUNTERO LE ASIGNO LA DIRECCION QUE DEVUELVE MALLOC
        ;push dword [edx]
        ;push dword eax
        ;push dword msgP
        ;call _printf
        ;add esp,4
        ;pop eax
        ;pop edx
        mov     edx,[edx]
        mov     [edx],ebx
        mov     ebx,0
        mov     [edx+4],ebx
        mov     [edx+8],ebx
         ;   
        push dword edx
        push dword [edx]
        push dword msjPV
        call _printf
        add esp,4
        pop edx
     ;   
        add      ESP, 4
        jmp     finalizar
     
    noIgual:
    ;EBX TIENE EL SIGUIENTE VALOR INGRESADO
    ;EDX TIENE LA DIRECCION DE MEMORIA DEL NODO ANTERIOR
    ;[EDX] TIENE EL VALOR DEL NODO DEL VALOR ANTERIOR
        ;COMPARO SI EL VALOR INGRESADO ES MENOR AL VALOR DEL NODO ANTERIOR
    
      
     mov EDX, [EBP+8] ;DIRECCION DEL PUNTERO
     mov EBX, [EBP+12];VALOR RECIBIDO
     mov esi,[EDX] ;CONTENIDO DEL PUNTERO EN VALOR

      cmp ESI,EBX
      jb  seteoElPtrDerDelNodo
      jmp seteoElPtrIzqDelNodo
    
     seteoElPtrDerDelNodo:
     push dword msg1 ; ***MOSTRAR QUE ENTRA A LA IZQ, EL VALOR INGRESADO ES MENOR AL QUE ESTA EN EL NODO***
     call _printf
     add  ESP, 4
    
       mov esi, [EBP+8] ;DIRECCION DEL PUNTERO
    ;  mov esi,edx ;AHORA ESI TIENE LA DIRECCION DEL PUNTERO NODO 
      add esi,4 ; AUMENTAMOS 4 A EDX PARA ACCEDER A LA DIRECCION DEL PUNTERO DEL NODO DER
;      mov esi,[esi]
     
        mov edx,esi
     mov edx,[edx]
        cmp edx,0
     je llamo
     mov esi,edx 
     llamo:
      push ebx
      push esi
      call _agregar_abb
      pop esi
      pop ebx

    jmp finalizar

    
    seteoElPtrIzqDelNodo:
    
   ; push dword ebx ;   ++++MOSTRAR VALORES PARA PRUEBA+++++++
   ; push dword esi ***MOSTRAR QUE ENTRA A LA DER, EL VALOR INGRESADO ES MAYOR AL QUE ESTA EN EL NODO***
    push dword msg
    call _printf
    add   ESP, 4
    
    mov esi, [EBP+8] ;DIRECCION DEL PUNTERO
;   mov esi,edx ;AHORA ESI TIENE LA DIRECCION DEL PUNTERO NODO 
    add esi,8 ; AUMENTAMOS 8 A EDX PARA ACCEDER A LA DIRECCION DEL PUNTERO DEL NODO IZQ
    mov edx,esi
    mov edx,[edx]
    cmp edx,0
    je llamar
    mov esi,edx  

   llamar:
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
       
   