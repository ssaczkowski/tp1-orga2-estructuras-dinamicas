#include <stdio.h>
struct nodoArbol { 
 int dato;
 struct nodoArbol *prtDer; 
  struct nodoArbol *ptrIzq; 
};
 
typedef struct nodoArbol NodoArbol; /* sinónimo de la estructura nodoArbol */
typedef NodoArbol *ptrNodoArbol; /* sinónimo de NodoArbol* */

ptrNodoArbol buscarNodo(ptrNodoArbol *ptrRaizArbol, int valor);

ptrNodoArbol buscarNodo(ptrNodoArbol *ptrRaizArbol, int valor)
{ 
 // si el árbol está vacío no se puede borrar nada, devuelvo un null
 printf("FUNCION BUSCAR NODO\nPUNTERO RECIBIDO: %p \t VALOR RECIBIDO: %d\n",(ptrRaizArbol),valor);
 ptrNodoArbol *n=NULL;
 if (*ptrRaizArbol == NULL) { 
 return *n;
	}
 else {
  //Busco el nodo que contenga el valor buscado
 	if (valor == (*ptrRaizArbol)->dato) {
 		printf("SE ENCONTRO EL VALOR\n");
 	//	system("PAUSE");
 		 printf("\nNODO ENCONTRADO: %p\n",(*ptrRaizArbol));
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
