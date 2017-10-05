section .data
    message1: db `*****INGRESO DE DATOS*****\n(ingrese un caracter para salir)\n`,10, 0
    message2: db "Ingrese un valor: : ", 0
    message3: db "Ingrese el valor que quiere borrar: ", 0
    formatin: db "%d", 0
    formatout: db "%d", 10, 0 ; newline, nul terminator
    integer1: times 4 db 0 ; 32-bits integer = 4 bytes
    integer2: times 4 db 0 ; 32-bits integer = 4 bytes
    msnN:   db `\nVALOR INGRESADO : %d\n`, 10, 0
 section .text
       
    extern _printf
    extern _scanf
    
global _cargar
_cargar:
      push EBP
      mov EBP, ESP
      push message3
      call _printf
      add esp, 4 ; remove parameters
  
     
      push integer2 ; address of integer1 (second parameter)
      push formatin ; arguments are right to left (first parameter)
      call _scanf
      mov edx,eax
      mov ebx, dword [integer2]
      add esp, 8 ; remove parameters
       push ebx
    push dword msnN
    call _printf
    add esp,4
    pop ebx
        mov     eax,ebx
        mov     [EBP-4], EAX
        mov     ESP, EBP
        pop     EBP
        ret  
        
        
   