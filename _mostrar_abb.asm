extern _printf

global _imprimirArbol

section .data
msg1:    db "IMPRIMO ARBOL BINARIO EN PRE-ORDEN", 10, 0
msg2:    db `%d`,10,0

section .text


_imprimirArbol:
        push EBP
        mov EBP, ESP
        sub ESP, 4
        mov EDI,[EBP+8] ;DIRECCION DEL PUNTERO
        mov esi,edi
        mov ebx,esi    
         
        cmp ebx, 0 
        je  finalizar
     
        mov ebx,[ebx] 
        push ebx
        push msg2
        call _printf
        add ESP, 4
        pop ebx
        
        ;IMPRIMO RECURSIVAMENTE SUBARBOL IZQ
      
        
        add edi,8  
        mov edi,[edi]                           
        push EBP
        mov EBP, ESP
        push edi
        call _imprimirArbol
        pop edi
        pop ebp 
     
     
        
        ;IMPRIMO RECURSIVAMENTE SUBARBOL DER
        mov EDI,[EBP+8] ;DIRECCION DEL PUNTERO
        ADD edi,4  
        mov edi,[edi]                           
        push EBP
        mov EBP, ESP
        push edi
        call _imprimirArbol
        pop edi
        pop ebp 
     
        

   finalizar:
   
        mov     ESP, EBP
        pop     EBP
        ret  
       
   