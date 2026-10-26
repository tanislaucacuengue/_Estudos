#include <stdio.h>
#include <stdlib.h>

void selecao(int vetor[], int n){
	
	int menor, aux;
	
	for( int i = 0; i < n - 1; i ++){
		menor = i;
		
		for(int j = i +1; j < n; j++){
			if(vetor[menor] > vetor[j]){
				menor = j;
			}
		}
		
		if(i != menor){
			aux = vetor[i];
			vetor[i] = vetor[menor];
			vetor[menor] = aux;
		}
	}
}

int main(){
	
	int n = 10;
	int vetor[n] = {2,5,1,4,3,6,8,9,7,0};
	
	selecao(vetor, n);
	
	printf("\n\n\n");
	
	for(int i = 0; i < n; i++){
		printf("%d -", vetor[i]);
	}
	
	return 0;
}
