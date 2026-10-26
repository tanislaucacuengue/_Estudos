#include <stdio.h>
#include <stdlib.h>

int divide(int vetor[], int esq, int dir){
		int aux;
		int cont;
	for(int i = esq+1; i < dir; i++){
		
		if(vetor[i] < vetor[esq]){
			
			cont ++;
			aux = vetor[i];
			vetor[i] = vetor[cont];
			vetor[cont] = aux;
			
		}
	}
	
	aux = vetor[esq];
	vetor[esq] = vetor[cont];
	vetor[cont] = aux;
	return cont ;
}

void quick(int vetor[], int esq, int dir){
	
	int pos;
	if(esq < dir){
		pos = divide(vetor, esq, dir);
		quick(vetor, esq, pos-1);
		quick(vetor, pos+1, dir);
	}
	
}

int main(){
	
	int n = 10;
	int vetor[] = {1,3,5,7,9,2,4,6,8};
	
	quick(vetor, 0, n);
	
	printf("\n\n\n");
	
	for(int i = 0; i < n; i++){
		printf("%d -", vetor[i]);
	}
	
	return 0;
}
