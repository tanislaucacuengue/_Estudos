#include <stdio.h>
#include <stdlib.h>

void selecao(int vet[], int n){
	
	int menor, aux;
	for(int i=0; i<n-1; i++){
		menor=i;
		
		for(int j=i+1; j<n; j++){
			
			if(vet[menor]>vet[j]){
				menor= j;
			}
			
			if(i != menor){
				aux = vet[i];
				vet[i] = vet[menor];
				vet[menor] = aux;
			}
		}
	}
}

int main(){
	
	int n = 10;
	int vetor[n] = {3,2,4,6,5,8,7,9,1};
	
	selecao(vetor, n);
	
	printf("\n\n\n");
	
	for(int i=0; i<n; i++){
		printf("%d -", vetor[i]);
	}
	
	return 0;
}
