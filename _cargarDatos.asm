SECTION .data
    message1: db `*****INGRESO DE DATOS*****\n(ingrese s para salir)\n`,10, 0
    message2: db "Ingrese un valor: : ", 0
    formatin: db "%d", 0
    formatout: db "%d", 10, 0 ; newline, nul terminator
    valor: times 4 db 0 ; 32-bits integer = 4 bytes
    msg3:   db     "PUNTERO  = %p", 10, 0
 section .bss

SECTION .text
   extern _scanf 
   extern _printf     
   extern _insertaNodo
   global _cargarDatos 
 
_cargarDatos:
 ; EAX, EBX, ECX, EDX, ESI, EDI, EBP, ESP
    push EBP
    mov EBP, ESP
   ; mov edi,ebp
   ; mov ebx,ebp
    mov esi, [EBP+8] ;DIRECCION DEL PUNTERO
  
  
   mov esi,[esi]
    push esi
    push msg3
    call _printf
    add esp,4
    pop esi
    
 ;  push ebx ; save registers
   push message1
   call _printf
   add esp, 4 ; remove parameters
   
    push message2
   call _printf
   add esp, 4 ; remove parameters
   
   push valor
   push formatin ; arguments are right to left (first parameter)
   call _scanf
   add esp, 8 ; remove parameters
   mov ebx, dword [valor]
   
  ;  mov esi, [EBP+8] ;DIRECCION DEL PUNTERO
    ; mov esi,[esi]
    push ebx
    push msg3
    call _printf
    add esp,4
    pop ebx
    
    
 ;   mov ebp,edi
 ;   mov ebp,ebx
    mov EBP, ESP
   ; push ebp
    push ebx
    push esi
    call _insertaNodo
    pop esi
    pop ebx 
    pop ebp
    
    inicio:
   push message2
   call _printf
   add esp, 4 ; remove parameters
   push valor ; address of integer1 (second parameter)
   push formatin ; arguments are right to left (first parameter)
   call _scanf
   add esp, 8 ; remove parameters
   mov ebx, dword [valor]
   cmp eax,0
   je salir
   
   mov esi, [EBP+8] ;DIRECCION DEL PUNTERO
   mov esi,[esi]
   mov ebp, esp; for correct debugging                                 
    push EBP
    mov EBP, ESP
    push EbX
    push esi
    call _insertaNodo
    pop ecx
    pop ebx ;add ESP, 8
    pop EBP
    mov eax,eax

    jmp inicio
    
                    
    salir:
    mov     [EBP-4], EAX
    mov     ESP, EBP
    pop     EBP
    ret