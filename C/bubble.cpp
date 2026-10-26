#include <stdio.h>
#include <stdlib.h>

void selecao(int vetor[], int n){
	
	int k = n;
	int aux;
	
	for(int i = 0; i < n; i++){
		for(int j = 0; j < k; j++){
			if(vetor[j] > vetor[j +1]){
				aux = vetor[j];
				vetor[j] = vetor[j+1];
				vetor[j+1] = aux;
			}
		}
		
		k--;
	}
}


int main() {
	
	int n =10;
	int vetor[n] = {1,3,2,4,8,6,5,7,9,0};
	
	selecao(vetor, n);
	
	printf("\n\n\n");
	
	for( int i = 0; i < n; i++){
		printf("%d - ", vetor[i]);
	}
	return 0;
}
