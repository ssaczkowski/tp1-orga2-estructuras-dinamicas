;  ja mayor         **POSIBLES RESULTADOS
;  jb menor
;  je igual     
section .data
msg:    db     `\nPARTE IZQ\n`, 10, 0
msg1:    db    "PARTE DER", 10, 0
msg3:    db    "PUNTERO %p", 10, 0
msg4: db    "ENTRA A LA FUNCION CON PUNTERO CERO (NULL)", 10, 0
msgD: db `\nVALORES A COMPARAR\nvalor: %d y contenido: %p`, 10, 0
msg6:    db    "VALOR INSERTADO EN PUNT Izq  %d", 10, 0
msg7:    db    "VALOR INSERTADO EN PUNT DER  %d", 10, 0
prueba:    db     `***VALOR EN EL NODO %p\n`, 10, 0
msjPV: db  `****VALOR : %p Y PUNTERO : %p****\n`, 10, 0
msjPVV: db  `VALORES BORRADOS\n****VALOR : %p Y PUNTERO : %p****\n`, 10, 0
msjP: db  `****VALOR : %p Y valor : %p****\n`, 10, 0
msjMe: db `*****RAIZ MENOR*****\n`, 10, 0
msjMa: db `*****RAIZ MAYOR*****\n`, 10, 0

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
    push dword msjP
    call _printf
    add esp,4
    pop eax
    pop edi
    
    cmp EDI,EAX
    ja  raizMayor
    jb raizMenor
    
    raizMayor:
    PUSH DWORD msjMa
    call _printf
    add esp,4
    
     mov EDX, [EBP+8] ;PUNTERO AL ARBOL
     mov EBX, [EBP+12];PUNTERO A BORRAR
     mov edx,[edx]
     add edx,8
    ; mov edx,[edx]
     ;
     push dword edx
     push dword ebx
     push dword msjPV
     call _printf
     add esp,4
     pop ebx
     pop edx
        ;
     
     push EBX
     push edx
     call _borrar_abb
     pop edx
     pop ebx ;add ESP, 8
     jmp fin
     
      raizMenor:
      PUSH DWORD msjMe
      call _printf
      add esp,4
      
      mov EDX, [EBP+8] ;PUNTERO AL ARBOL
     mov EBX, [EBP+12];PUNTERO A BORRAR
     mov edx,[edx]
     add edx,4
    ; mov edx,[edx]
     ;
     push dword edx
     push dword ebx
     push dword msjPV
     call _printf
     add esp,4
     pop ebx
     pop edx
        ;
     
     push EBX
     push edx
     call _borrar_abb
     pop edx
     pop ebx ;add ESP, 8
     jmp fin
    
    
    borrar:
 ;   mov ebp, esp; for correct debugging                                 
  ;  push EBP
  ;  mov EBP, ESP
    push dword esi
    push dword ebx
    push dword msjPVV
    call _printf
    add esp,4
    pop ebx
    pop esi
    
    ; 
     mov EDX, [EBP+8] ;PUNTERO AL ARBOL 
     push dword edx
     push dword esi
     push dword msjP
     call _printf
     add esp,4
     pop esi
     pop edx
    ;
    mov esi,0
    mov [edx],esi
     
    mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    push ebx
    call _borraNodo
    pop ebx
    pop ebp
 ;   pop ebx
  ;  pop EBP
  ;  mov ebx,0
  ;  mov [edx],ebx
      
    fin: 
     mov     ESP, EBP
     pop     EBP
     ret  