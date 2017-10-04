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
    
    mov eax,0 ;DEFINO UN REGISTRO CON UN CERO
    push EBP
    mov EBP, ESP
    mov EDX, [EBP+8] ;RECUPERAMOS EL VALOR QUE ENVIO LA LLAMADA
    mov ecx,edx ;GUARDO EL VALOR DE EDX, USO ECX A PARTIR DE AHORA
    add ecx,8 ;AUMENTO 8 PARA IR AL PTR IZQ
    cmp  [ecx],eax  ;COMPARO SI EL CONTENIDO PUNTERO IZQ ES NULL
    je siguiente ; SI ES NULL
      ;Si NO ES NULL
      mov ecx,[ecx] ;PASO EL CONTENIDO DEL PTR IZQ A ECX
      push ecx ;PUSHEO EL CONTENIDO DEL PTR IZQ
      call _borraNodo ;LLAMO RECURSIVAMENTE A BORRA NODO
      pop ecx ;RECUPERO ECX
      mov eax,0
      mov EDX, [EBP+8]
      mov ecx,edx ;GUARDO EL VALOR DE EDX, USO ECX A PARTIR DE AHORA
      add ecx,8 ;AUMENTO 8 PARA IR AL PTR IZQ
      mov [ecx],eax
       
    siguiente: ;PASAMOS AL PUNTERO DERECHO
      mov ecx,edx ;PASAMOS EL VALOR ORIGINAL
      add ecx,4 ; AUMENTAMOS 4 PARA IR AL PTR DER
      cmp  [ecx],eax   ;COMPARO SI EL CONTENIDO DEL PTR DER ES NULL
      je finalizar ; SI ES NULL
      ;Si NO ES NULL
      mov ecx,[ecx] ;MUEVO EL CONTENIDO DEL PTR DER A ECX
      push ecx
      call _borraNodo
      pop ecx
      mov eax,0
      mov EDX, [EBP+8]
      mov ecx,edx ;GUARDO EL VALOR DE EDX, USO ECX A PARTIR DE AHORA
      add ecx,4 ;AUMENTO 8 PARA IR AL PTR IZQ
      mov [ecx],eax
    
    finalizar:
    push dword msj
    call _printf
    add esp,4
    
    push edx ;PUSHEO EL VALOR ORIGINAL
    call _free ;LIBERO LA MEMORIA
    pop edx ;POPEO EL EDX
    ;VUELVO AL LUGAR QUE LLAMO A LA FUNCION
     mov EBX, [EBP+8]
     mov     ESP, EBP
     pop     EBP
     ret