
extern _printf

global _mostrar_abb

section .data

msg_valor:    db `%d`,10,0


section .text


_mostrar_abb:
    push EBP
    mov EBP, ESP
    sub ESP, 4
    mov EDI,[EBP+8] ;DIRECCION DEL PUNTERO
    mov esi,edi
    mov ebx,esi    
     
    cmp ebx, 0 
    je  finalizar
      
    ; Para test: IMPRIMO VALOR
    mov ebx,[ebx] 
    push ebx
    push msg_valor
    call _printf
    add ESP, 4
    pop ebx
        
    ;IMPRIMO RECURSIVAMENTE SUBARBOL IZQ
      
        
    add edi,8  
    mov edi,[edi]                           
    push EBP
    mov EBP, ESP
    push edi
    call _mostrar_abb
    pop edi
    pop ebp 
     
     
        
    ;IMPRIMO RECURSIVAMENTE SUBARBOL DER
    mov EDI,[EBP+8] ;DIRECCION DEL PUNTERO
    ADD edi,4  
    mov edi,[edi]                           
    push EBP
    mov EBP, ESP
    push edi
    call _mostrar_abb
    pop edi
    pop ebp 
     
        

   finalizar:
   
    mov  ESP, EBP
    pop  EBP
    ret    
   