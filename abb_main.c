#include <stdio.h>
#include <stdlib.h>
 
/* estructura autoreferenciada */
struct nodoArbol { 
 int dato;
 struct nodoArbol *ptrIzq; 
 struct nodoArbol *prtDer; 
};
 
typedef struct nodoArbol NodoArbol; /* sinónimo de la estructura nodoArbol */
typedef NodoArbol *ptrNodoArbol; /* sinónimo de NodoArbol* */
 
/* Prototipo de la clase ASM */
void preOrden(ptrNodoArbol ptrArbol);

extern ptrNodoArbol insertaNodo(ptrNodoArbol *ptrArbol, int dato);
extern void imprimirArbol(ptrNodoArbol *ptrArbol);


int main()
{ 
  int ch;
  int valor;
  int ok;
  int elemento; /* variable para almacenar valores al azar */
  ptrNodoArbol ptrRaiz=NULL;
  ptrNodoArbol ptrNodo=NULL;

 printf("Insertar valores. Para cancelar ingresar cualquier caracter \n");
 
 do{
      printf("Ingrese un valor: ");
      fflush(stdout);
      if ((ok = scanf("%d", &valor)) == EOF)
         return EXIT_FAILURE;
      
      if ((ch = getchar()) != '\n'){
         ok = 0;
      
      }
      if(ok){
      	if(ptrRaiz==NULL)  {
      		printf("PRIMERO\n");
		  ptrNodo=insertaNodo(&ptrRaiz,valor);
	}
		else  ptrNodo=insertaNodo(&(*ptrRaiz),valor);

  
	  }

   }while (ok);

 

 	printf("\n\n");
 	imprimirArbol(&(*ptrRaiz));
 	
 return 0;		
}
 

 



 



