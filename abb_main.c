/*  Trabajo Practico 1 - Organizacion del Computador - Depetris & Saczkowski */
#include <stdio.h>
#include <stdlib.h>
 
/* Estructura del arbol */
struct nodoArbol { 
 struct nodoArbol *ptrIzq; 
 int dato;
 struct nodoArbol *prtDer; 
};
 /* Sinonimos de la estructura nodoArbol y el puntero*/
typedef struct nodoArbol NodoArbol; 
typedef NodoArbol *ptrNodoArbol; 
 
/* Prototipos */
extern ptrNodoArbol insertaNodo(ptrNodoArbol *ptrArbol, int valor);
extern void imprimirArbol(ptrNodoArbol ptrArbol);
//extern void borrar_abb (ptrNodoArbol *ptrArbol,ptrNodoArbol *ptrRaizArbol);

int main()
{ 
 // Declaro variable para el manejo de las opciones del menu
 int opcion; 
 // Declaro e inicializo variables de la estructura
 int elemento; 
 ptrNodoArbol ptrRaiz=NULL;
 ptrNodoArbol ptrAux=NULL; 
 
 printf("Insertar valores para el arbol binario inicial. ( Para cancelar ingresar 0) \n");
 do{
 	printf("Ingrese un numero entero: ");
 	scanf("%d",&elemento);
 	insertaNodo(&ptrRaiz, elemento);
 }while(elemento!=0);
 	system("cls"); 
 do{
 	system("cls"); 
 	printf("MENU DE OPCIONES:\n");
 	printf("1. Ingresar un nuevo valor.\n2. Borrar un valor.\n3. Listar el arbol.\n0. Salir\nOpcion: ");
 	scanf("%d",&opcion);
 	switch (opcion){
 		case 1:
 			system("cls");
 			printf("INGRESAR UN NUEVO VALOR AL ARBOL\n");
 			printf("Ingrese un valor: ");
 			scanf("%d",&elemento);
 			insertaNodo(&ptrRaiz,elemento);
 			break;
 		case 2:
 		/*	system("cls");
 			printf("BORRAR UN VALOR DEL ARBOL\n");
 			printf("Ingrese un valor: ");
 			scanf("%d",&elemento);
 			printf("VALOR DEL ELEMENTO %d\n",elemento);
 			ptrAux=(buscarNodo(&ptrRaiz,elemento));
 			if(ptrAux!=NULL){
 			 	_borrar_abb(&ptrAux,&ptrRaiz);
 			 	printf("Elemento y subarbol borrado con exito.\n");
 			 	system("PAUSE");
 			 }
 			else {
 				printf("El elemento ingresado no se encuentra en el arbol.\n");
 				system("PAUSE");
			 }*/
 			break;
 		case 3:
 			system("cls");
 			printf("IMPRIMIR ARBOL\n");
 			imprimirArbol(ptrRaiz);
 			printf("\n");
 			system("PAUSE");
 			break;
 		}
 }while(opcion!=0);
 
 return 0;
}
 
 
 




