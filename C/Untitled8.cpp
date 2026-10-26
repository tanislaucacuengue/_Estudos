#include <stdio.h>
#include <stdlib.h>

int main(){
	
	int valor_int = 10;
	char valor_char[5];
	
	itoa(valor_int, valor_char, 10);
	
	printf("\n\n %s \n\n", valor_char);
	
	int novo_valor_int = atoi(valor_char);
	
	printf("\n\n %d \n\n", novo_valor_int);	
	
	return 0;
}
