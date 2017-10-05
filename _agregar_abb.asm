   
section .data

msg_insertar:    db     `\n**************INICIO DE INSERTAR\n`, 10, 0
msg_parteIZQ:    db     `\nPARTE IZQ\n`, 10, 0
msg_parteDER:    db    "PARTE DER", 10, 0
msg_puntero:    db    "PUNTERO %p", 10, 0
msg_valoresAComparar: db `\nVALORES A COMPARAR\nvalor: %d y contenido: %p`, 10, 0
msg_punteroYValor: db  `****VALOR : %d Y PUNTERO : %p****\n`, 10, 0

section .text
extern _malloc
extern _printf
global _insertaNodo

_insertaNodo:
    push dword msg_insertar
    call _printf
    add esp,4
    push EBP
    mov EBP, ESP
    mov EDX, [EBP+8] ;DIRECCION DEL PUNTERO
    mov EBX, [EBP+12];VALOR RECIBIDO
    mov esi,[EDX] ;CONTENIDO DEL PUNTERO EN VALOR      
    push dword edx
    push dword [edx]
    push dword msg_punteroYValor
    call _printf
    add esp,4
    pop edx
    mov edi,0
    cmp edi,esi
    je      punteroEsNull
    jmp     punteroNoNull
    
    
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
        add      ESP, 4
        jmp     finalizar
        
       
    punteroNoNull:
         mov EDX, [EBP+8] ;DIRECCION DEL PUNTERO
         mov EBX, [EBP+12];VALOR RECIBIDO
         mov esi,[EDX] ;CONTENIDO DEL PUNTERO EN VALOR
         push dword [edx]
         push dword ebx
         push dword msg_valoresAComparar
         call _printf
         add esp,4
         pop ebx
         pop edx
         cmp ESI,EBX
         jb  seteoElPtrDerDelNodo
         ja seteoElPtrIzqDelNodo
         jmp existe
    
     
    existe:
        mov EDX, [EBP+8] ;DIRECCION DEL PUNTERO
        mov eax,edx
        jmp finalizar
    
     seteoElPtrDerDelNodo:
         push dword msg_parteDER
         call _printf
         add  ESP, 4
         mov esi, [EBP+8] ;DIRECCION DEL PUNTERO
         add esi,4 
         mov edx,esi
         mov edx,[edx]
         cmp edx,0
         je insertarElNodo1
         mov esi,edx 
     insertarElNodo1:
          push ebx
          push esi
          call _insertaNodo
          pop esi
          pop ebx
          jmp finalizar
 
    
    seteoElPtrIzqDelNodo:
           push dword msg_parteIZQ
           call _printf
           add   ESP, 4
           mov esi, [EBP+8] ;DIRECCION DEL PUNTERO
           add esi,8 ; AUMENTAMOS 8 A EDX PARA ACCEDER A LA DIRECCION DEL PUNTERO DEL NODO IZQ
           mov edx,esi
           mov edx,[edx]
           cmp edx,0
           je insertarElNodo
           mov esi,edx  

   insertarElNodo:
          push ebx
          push esi
          call _insertaNodo
          pop esi
          pop ebx
          jmp finalizar
   
   finalizar:   
           mov     [EBP-4], EAX
           mov     ESP, EBP
           pop     EBP
           ret  