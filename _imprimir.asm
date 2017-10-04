section .data
msg1:   db     `\n*****EN ASSEMBLER - FUNCION IMPRIMIR\nDIR.PUNTERO = %p\nDIR.NODO = %p VAL.NODO = %d\nD.pD = %p V.pD = %p \nD.pI = %p V.pI = %p\n`, 10, 0
msg2:   db     `DIRECCION PUNTERO EN FUNCION IMPRIMIR = %P \n`, 10, 0
section .text
extern _printf
global _imprimir
_imprimir:
    push EBP
    mov EBP, ESP
    sub ESP, 4
    mov EDX, [EBP+8]
    mov     eax,edx
    mov     ebx,edx
    push    dword  [edx+8]  ;MUESTRO VALOR PUNTERO DERECHO
    add     edx,8           
    push    dword edx       ;MUESTRO DIRECCION PUNTERO DERECHO
    push    dword  [eax+4]  ;MUESTRO VALOR PUNTERO IZQUIERDO
        add     eax,4
        push    dword eax       ;MUESTRO DIRECCION PUNTERO IZQUIERDO
        sub     eax,4
        push    dword  [EAX]    ;MUESTRO VALOR DEL NODO
        push    dword eax       ;MUESTRO DIRECCION DEL VALOR DEL NODO
        push    dword ebx       ;MUESTRO DIRECCION DEL PUNTERO
        push    dword msg1
        call    _printf
        add ESP, 32  
        mov     ESP, EBP
        pop     EBP
        ret 