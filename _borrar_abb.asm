    
section .data

msg_verPunteroValor: db  `****VALOR : %p Y PUNTERO : %p****\n`, 10, 0
msg_verValoresBorrados: db  `VALORES BORRADOS\n****VALOR : %p Y PUNTERO : %p****\n`, 10, 0
msg_punteros: db  `****VALOR : %p Y valor : %p****\n`, 10, 0
msg_menor: db `*****RAIZ MENOR*****\n`, 10, 0
msg_mayor: db `*****RAIZ MAYOR*****\n`, 10, 0

section .text
extern _borraNodo
extern _malloc
extern _printf

global _borrar_abb

_borrar_abb:
    push EBP
    mov EBP, ESP
    mov EDX, [EBP+8] ;PUNTERO AL ARBOL
    mov EBX, [EBP+12];PUNTERO A BORRAR
    mov esi,[EDX] ;PUNTERO RAIZ
    
    
    cmp esi,ebx
    je borrar
    
    mov edi,[esi] ;PASO EL CONTENIDO DEL NODO RAIZ A EDI
    mov eax,[ebx] ;PASO EL CONTENIDO DEL NODO A BORRAR
    push dword edi
    push dword eax
    push dword msg_punteros
    call _printf
    add esp,4
    pop eax
    pop edi
    
    cmp EDI,EAX
    ja  raizMayor
    jb raizMenor
    
    raizMayor:
        PUSH DWORD msg_mayor
        call _printf
        add esp,4
    
        mov EDX, [EBP+8] ;PUNTERO AL ARBOL
        mov EBX, [EBP+12];PUNTERO A BORRAR
        mov edx,[edx]
        add edx,8
    
        push dword edx
        push dword ebx
        push dword msg_verPunteroValor
        call _printf
        add esp,4
        pop ebx
        pop edx
        
     
        push EBX
        push edx
        call _borrar_abb
        pop edx
        pop ebx 
        jmp fin
     
      raizMenor:
         push DWORD msg_menor
         call _printf
         add esp,4
      
         mov EDX, [EBP+8] ;PUNTERO AL ARBOL
         mov EBX, [EBP+12];PUNTERO A BORRAR
         mov edx,[edx]
         add edx,4
    
    
         push dword edx
         push dword ebx
         push dword msg_verPunteroValor
         call _printf
         add esp,4
         pop ebx
         pop edx
        
     
         push EBX
         push edx
         call _borrar_abb
         pop edx
         pop ebx 
         jmp fin
    
    
    borrar:

        push dword esi
        push dword ebx
        push dword msg_verValoresBorrados
        call _printf
        add esp,4
        pop ebx
        pop esi
    
    
        mov EDX, [EBP+8] ;PUNTERO AL ARBOL 
        push dword edx
        push dword esi
        push dword msg_punteros
        call _printf
        add esp,4
        pop esi
        pop edx
    
        mov esi,0
        mov [edx],esi
     
        mov ebp, esp                                
        push EBP
        mov EBP, ESP
        push ebx
        call _borraNodo
        pop ebx
        pop ebp
    
      
    fin: 
     mov     ESP, EBP
     pop     EBP
     ret  