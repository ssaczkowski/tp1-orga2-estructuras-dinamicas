nasm -f win32 -o _agregar_abb.o _agregar_abb.asm
nasm -f win32 -o _mostrar_abb.o _mostrar_abb.asm
nasm -f win32 -o _borrarNodo.o _borrarNodo.asm
nasm -f win32 -o _borrar_abb.o _borrar_abb.asm
mingw32-gcc -Wall -c abb_main.c -o abb_main.o
mingw32-gcc -Wall -o mainc abb_main.o _agregar_abb.o _mostrar_abb.o _borrar_abb.o _borrarNodo.o
mainc.exe