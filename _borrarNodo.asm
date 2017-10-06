section .data

msgB:  db   `****FUNCION BORRA NODO\n`, 10, 0
msj:    db     "AMBOS PUNTEROS HIJOS NULOS, LIBERANDO MEMORIA", 10, 0
msg1:    db    "NO TIENE CERO, TIENE %d", 10, 0
msg3:    db    "PUNTERO %p", 10, 0
msg4: db    "ENTRA A LA FUNCION CON PUNTERO CERO (NULL)", 10, 0
msg5:    db    "CONTENIDO EN FUNCION %d", 10, 0
msg6:    db    "CONTENIDO MALLOC %d", 10, 0
msg7:    db    "PUNTERO NUEVO DE MALLOC %p", 10, 0

section .bss
section .text
extern _malloc
extern _printf
extern _free
global _borraNodo


_borraNodo:
        push dword msgB
        call _printf
        add esp, 4
        
        mov eax,0 
        push EBP
        mov EBP, ESP
        mov EDX, [EBP+8] ;VALOR A ELIMINAR
        mov ecx,edx 
        add ecx,8 ;AUMENTO 8 PARA IR AL PTR IZQ
        cmp  [ecx],eax  ;COMPARO SI EL CONTENIDO PUNTERO IZQ ES NULL
        je siguiente 
     
        mov ecx,[ecx] 
        push ecx 
        call _borraNodo 
        pop ecx
        mov eax,0
        mov EDX, [EBP+8]
        mov ecx,edx 
        add ecx,8 
        mov [ecx],eax
       
    siguiente: ;PASAMOS AL PUNTERO DERECHO
         mov ecx,edx 
         add ecx,4 ; AUMENTAMOS 4 PARA IR AL PTR DER
         cmp  [ecx],eax   ;COMPARO SI EL CONTENIDO DEL PTR DER ES NULL
         je finalizar 
         
         mov ecx,[ecx] 
         push ecx
         call _borraNodo
         pop ecx
         mov eax,0
         mov EDX, [EBP+8]
         mov ecx,edx
         add ecx,4 
         mov [ecx],eax
    
    finalizar:
        push dword msj
        call _printf
        add esp,4
    
        push edx 
        call _free ;LIBERO LA MEMORIA
        pop edx 
   
        mov EBX, [EBP+8]
        mov     ESP, EBP
        pop     EBP
        ret