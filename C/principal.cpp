#include <stdio.h>
#include <stdlib.h>

int global;

ValorSet(int valor){
	global = valor;
	printf("\n\n\nComecou com o global: %i\n\n", valor);
}

ValorDobro(){
	global *= global;
	printf("\n\nDepois o  global dobrou e ficou: %i\n\n", global);
}

ValorGet(){
	
	printf("E no fim o global final e retornado novamente: %i", global);
	return global;
}

int main(){
	
	ValorSet(3);
	ValorDobro();
	ValorGet();
	
	return 0;
}
