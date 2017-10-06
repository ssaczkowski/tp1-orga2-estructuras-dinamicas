SECTION .data
    message1: db `*****INGRESO DE DATOS*****\n(ingrese s para salir)\n`,10, 0
    message2: db "Ingrese un valor: : ", 0
    formatin: db "%d", 0
    formatout: db "%d", 10, 0 
    valor: times 4 db 0 
    msg3:   db     "PUNTERO  = %p", 10, 0
 section .bss

SECTION .text
   extern _scanf 
   extern _printf     
   extern _insertaNodo
   global _cargarDatos 
 
_cargarDatos:

    push EBP
    mov EBP, ESP
 
    mov esi, [EBP+8] ;DIRECCION DEL PUNTERO
  
  
   mov esi,[esi]
    push esi
    push msg3
    call _printf
    add esp,4
    pop esi
    
   push message1
   call _printf
   add esp, 4 
   
    push message2
   call _printf
   add esp, 4 
   
   push valor
   push formatin 
   call _scanf
   add esp, 8
   mov ebx, dword [valor]
   
    push ebx
    push msg3
    call _printf
    add esp,4
    pop ebx
    
    
    mov EBP, ESP
    push ebx
    push esi
    call _insertaNodo
    pop esi
    pop ebx 
    pop ebp
    
    inicio:
   push message2
   call _printf
   add esp, 4 
   push valor 
   push formatin 
   call _scanf
   add esp, 8 
   mov ebx, dword [valor]
   cmp eax,0
   je salir
   
   mov esi, [EBP+8] ;DIRECCION DEL PUNTERO
   mov esi,[esi]
   mov ebp, esp                               
    push EBP
    mov EBP, ESP
    push EbX
    push esi
    call _insertaNodo
    pop ecx
    pop ebx 
    pop EBP
    mov eax,eax

    jmp inicio
    
                    
    salir:
    mov     [EBP-4], EAX
    mov     ESP, EBP
    pop     EBP
    ret