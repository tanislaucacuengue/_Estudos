#include <stdio.h>
#include <stdlib.h>

void selecao(int vet[], int n){
	
	int menor, aux;
	for(int i=0; i<n-1; i++){
		menor = i;
		for(int j=i+1; j<n; j++){
			if(vet[menor] > vet[j]){
				menor = j;
			}	
		}
		
		if(i != menor){
			aux = vet[i];
			vet[i] = vet[menor];
			vet[menor] = aux;
		}
	}
	
}

int main() {
	
	int n = 9;
	int vetor[n] = {2,4,1,5,3,7,6,8,9};
	
	selecao(vetor, n);
	
	printf("\n\n\n\n");
	
	for(int i=0; i<n; i++){

		printf("%d -", vetor[i]);
	}
	
	return 0;
}
