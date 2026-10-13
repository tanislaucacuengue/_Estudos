#include <stdio.h>
#include <stdlib.h>

void organiza(int vet[], int n){
	
	int menor, aux;
	for(int i=0; i<n-1; i++){
		menor = i;
		for(int j=i+1; j<n; j++){
			if(vet[menor] > vet[j])
			menor = j;
		}
		
		if(menor != i){
			aux = vet[i];
			vet[i] = vet[menor];
			vet[menor] = aux;
		}
	}
}

int main(){
	
	int n=10;
	int vetor[n]={9, 2, 8, 4, 7, 3, 1, 6, 5, 0};
	
	organiza(vetor, n);
	
	for(int i=0; i<n; i++){
		printf(" %d -", vetor[i]);
	}
	return 0;
}
