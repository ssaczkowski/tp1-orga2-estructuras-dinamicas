/*  Trabajo Practico 1 - Organizacion del Computador - Depetris & Saczkowski */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
 
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
void insertaNodo(ptrNodoArbol *ptrArbol, int valor);
void preOrden(ptrNodoArbol ptrArbol);
void borrar_abb (ptrNodoArbol *ptrArbol,ptrNodoArbol *ptrRaizArbol);
ptrNodoArbol buscarNodo(ptrNodoArbol *ptrRaizArbol, int valor);

/* Comienzo de la ejecucion del programa */
int main()
{ 
 // Declaro variable para el manejo de las opciones del menu
 int opcion; 
 // Declaro e inicializo variables de la estructura
 int elemento; 
 ptrNodoArbol ptrRaiz=NULL;
 ptrNodoArbol ptrAux=NULL; 
 
 
 printf("Insertar valores para el Arbol Binario inicial. ( Para cancelar ingresar 0) \n");
 do{
 	printf("Ingrese un numero entero: ");
 	scanf("%d",&elemento);
 	insertaNodo(&ptrRaiz, elemento);
 }while(elemento!=0);
 	system("cls"); //limpia la pantalla
 do{
 	system("cls"); //limpia la pantalla
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
 			system("cls");
 			printf("BORRAR UN VALOR DEL ARBOL\n");
 			printf("Ingrese un valor: ");
 			scanf("%d",&elemento);
 			printf("VALOR DEL ELEMENTO %d\n",elemento);
 			ptrAux=(buscarNodo(&ptrRaiz,elemento));
 			if(ptrAux!=NULL){
 			 	borrar_abb(&ptrAux,&ptrRaiz);
 			 	printf("Elemento y subarbol borrado con exito.\n");
 			 	system("PAUSE");
 			 }
 			else {
 				printf("El elemento ingresado no se encuentra en el arbol.\n");
 				system("PAUSE");
			 }
 			break;
 		case 3:
 			system("cls");
 			printf("IMPRIMIR ARBOL\n");
 			preOrden(ptrRaiz);
 			printf("\n");
 			system("PAUSE");
 			break;
 		}
 }while(opcion!=0);
 
 return 0;
}
 

void insertaNodo( ptrNodoArbol *ptrArbol, int valor )
{ 
 /* si el árbol está vacío */
 if (*ptrArbol == NULL) { 
*ptrArbol = (ptrNodoArbol)malloc(sizeof(NodoArbol));
 /* si la memoria está asignada, entonces asigna el dato */
 if (*ptrArbol != NULL) { 
 (*ptrArbol)->dato = valor;
 (*ptrArbol)->ptrIzq = NULL;
 (*ptrArbol)->prtDer = NULL;
 } else {
 printf("No se inserto %d. No hay memoria disponible.n", valor);
 } 
 } else {
 /* el dato a insertar es menor que el dato en el nodo actual */
 if (valor < (*ptrArbol)->dato) {
 insertaNodo(&((*ptrArbol)->ptrIzq), valor);
 } else if (valor > (*ptrArbol)->dato) {
 insertaNodo(&((*ptrArbol)->prtDer), valor);
 } else { 
 printf("dup");
 }
 }
} 
 
 
void preOrden(ptrNodoArbol ptrArbol)
{ 
 /* si el árbol no está vacío, entonces recórrelo */
 if (ptrArbol != NULL) { 
 printf("%3d", ptrArbol->dato);
 preOrden(ptrArbol->ptrIzq);
 preOrden(ptrArbol->prtDer);
 }
}
 

void borrar_Nodo(ptrNodoArbol *ptrArbol){
	printf("NODO A BORRAR: %d\n",(*ptrArbol)->dato);
		system("PAUSE");
	if((*ptrArbol)->ptrIzq!=NULL){
		borrar_Nodo(&((*ptrArbol)->ptrIzq));
		(*ptrArbol)->ptrIzq=NULL;
	}
	if((*ptrArbol)->prtDer!=NULL){
		borrar_Nodo(&(*ptrArbol)->prtDer);
		(*ptrArbol)->prtDer=NULL;
	}	
	free(*ptrArbol);
}


void borrar_abb (ptrNodoArbol *ptrArbol,ptrNodoArbol *ptrRaizArbol){
	printf("\nBORRAR EL VALOR VALOR: %d\nVALOR NODO RECORRIDO  %d\n",((*ptrArbol)->dato),((*ptrRaizArbol)->dato));
	system("PAUSE");
	if(((*ptrArbol) == (*ptrRaizArbol))){
		printf("\nNODO IZQ A BORRAR %s\n",((*ptrRaizArbol)));
		borrar_Nodo(&(*ptrArbol));
		(*ptrRaizArbol)=NULL;
		printf("\nNODO IZQ A BORRAR %s\n",((*ptrRaizArbol)));
			system("PAUSE");
		return;
		}
	else {
		if ((*ptrArbol)->dato < (*ptrRaizArbol)->dato) {
		    	if ((*ptrArbol) == (*ptrRaizArbol)->ptrIzq) {
		    	printf("\nNODO IZQ A BORRAR %s\n",((*ptrRaizArbol)->ptrIzq));	
				(*ptrRaizArbol)->ptrIzq=NULL;
				printf("\nNODO IZQ A BORRAR %s\n",((*ptrRaizArbol)->ptrIzq));
					system("PAUSE");
				borrar_Nodo(&(*ptrArbol));
				return;
			}
				else {
				borrar_abb(&((*ptrArbol)),&((*ptrRaizArbol)->ptrIzq));
				return;
				}
			}
		else {
			if ((*ptrArbol) == (*ptrRaizArbol)->prtDer) {
			   	printf("\nNODO DER A BORRAR %s\n",((*ptrRaizArbol)->prtDer));	
				(*ptrRaizArbol)->prtDer=NULL;
			   	printf("\nNODO DER A BORRAR %s\n",((*ptrRaizArbol)->prtDer));
			   		system("PAUSE");
				borrar_Nodo(&(*ptrArbol));
				return;
			}
				else {
				borrar_abb(&((*ptrArbol)),&((*ptrRaizArbol)->prtDer));
				return;
				}
			}
		}
}


ptrNodoArbol buscarNodo(ptrNodoArbol *ptrRaizArbol, int valor)
{ 
 // si el árbol está vacío no se puede borrar nada, devuelvo un null
 ptrNodoArbol *n=NULL;
 if (*ptrRaizArbol == NULL) { 
 return *n;
	}
 else {
  //Busco el nodo que contenga el valor buscado
 	if (valor == (*ptrRaizArbol)->dato) {
 		printf("SE ENCONTRO EL VALOR\n");
 		system("PAUSE");
 		return *ptrRaizArbol;
 	} else if (valor < (*ptrRaizArbol)->dato) {
 		buscarNodo(&((*ptrRaizArbol)->ptrIzq),valor);
 			} 
	   	   else if (valor > (*ptrRaizArbol)->dato) { 
	   	   buscarNodo((&((*ptrRaizArbol)->prtDer)),valor);
 			}
				else return *n; 			
	}
}
