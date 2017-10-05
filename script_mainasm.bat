nasm -f win32 -o main.o main.asm
nasm -f win32 -o _imprimir.o _imprimir.asm
nasm -f win32 -o _agregar_abb.o _agregar_abb.asm
nasm -f win32 -o _mostrar_abb.o _mostrar_abb.asm
nasm -f win32 -o _borrarNodo.o _borrarNodo.asm
nasm -f win32 -o _cargarDatos.o _cargarDatos.asm
nasm -f win32 -o _cargar.o _cargar.asm
nasm -f win32 -o _borrar_abb.o _borrar_abb.asm
mingw32-gcc -Wall -c abb_main.c -o abb_main.o
mingw32-gcc -Wall -o mainasm main.o _agregar_abb.o _mostrar_abb.o _borrar_abb.o _borrarNodo.o _imprimir.o _cargarDatos.o _cargar.o buscarNodo.c 
mainasm.exe