nasm -f win32 -o _insertaNodo.obj _insertaNodo.asm
nasm -f win32 -o _imprimirArbol.obj _imprimirArbol.asm
nasm -f win32 -o _borrarNodo.obj _borrarNodo.asm
mingw32-gcc -Wall -o main.exe abb_main.cpp _insertaNodo.obj _imprimirArbol.obj _borrarNodo.obj 
main.exe