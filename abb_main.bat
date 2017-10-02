nasm -f win32 -o _agregar_abb.o _agregar_abb.asm
nasm -f win32 -o _mostrar_abb.o _mostrar_abb.asm
mingw32-gcc -Wall -c abb_main.c -o abb_main.o
mingw32-gcc -Wall -o main abb_main.o _agregar_abb.o _mostrar_abb.o 
main.exe