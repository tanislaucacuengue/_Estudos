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
	}
	else{
		return false;
	}
	
	//return frente > tras;
}

bool fila_cheia(){
	if(tras == MAX_TAM-1){
		return true;
	}
	else{
		return false;
	}
}

bool fila_enfilerar(int valor){
	if(fila_cheia()){
		return false;
	}
	else{
		tras ++;
		fila[tras]=valor;
		return true;
	}
}

bool fila_desenfilerar(int &valor){
	if(fila_vazia){
		return false;
	}
	else{
		frente ++;
		valor = fila[frente];
		return true;
	}
}

bool fila_GET(int &valor){
	if(fila_vazia){
		return false;
	}
	else{
		valor = fila[frente];
		return true;
	}
}

fila_tamanho(){
	return (frente - tras)+1;
}
int main(){
	
	int valor;
	fila_construtor();
	
	fila_enfilerar(7);
	fila_enfilerar(5);
	fila_enfilerar(2);
	
	while (fila_desenfilerar(valor)){
		printf("\n\nValor: %d\n\n", valor);
	}
	
	/*if(fila_desenfilerar(valor)){
		printf("\n\nValor: %d\n\n", valor);
	}
	else{
		printf("\n\n A fila esta vazia\n\n");
	}*/
	
	return 0;
}
