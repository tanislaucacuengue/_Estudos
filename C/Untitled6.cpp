#include <stdio.h>
#include <stdlib.h>

int const MAX_TAM = 1000;

int frente, tras;
int fila[MAX_TAM];


void fila_construtor(){
	
	frente = 0;
	tras = -1;
}

bool fila_vazia(){
	if(frente > tras){
		return true;
	}else{
		return false;
	}
}

bool fila_cheia(){
	if(tras == MAX_TAM-1){
		return true;
	}else{
		return false;
	}
}

bool fila_enfileirar(int valor){
	if(fila_cheia()){
		return false;
	}else{
		tras ++;
		fila[tras] = valor;
		return true;
	}
}

bool fila_desenfileirar(int &valor){
	if(fila_vazia()){
		return false;
	}else{
		valor = fila[frente];
		frente ++;
		return true;
	}	
}

bool fila_GET(int &valor){
	if(fila_vazia()){
		return false;
	}else{
		valor = fila[frente];
		return true;
	}	
}

bool fila_tamanho(){
	return (tras - frente)+1;
}

int main(){
	
	int valor;
	
	fila_construtor();
	
	fila_enfileirar(5);
	fila_enfileirar(2);
	fila_enfileirar(7);
	
	printf("\n\nO tamanho: %d\n\n", fila_tamanho());
	
	while(fila_desenfileirar(valor)){
		printf("\n\nValor: %d\n\n", valor);
		
	}
	
	printf("\n\nO tamanho final: %d\n\n", fila_tamanho());
	
	/*if(fila_desenfileirar(valor)){
		printf("\n\nValor: %d\n\n", valor);
		
	}else{
		printf("A fila esta vazia");
	}
*/
	return 0; 
}
