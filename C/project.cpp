#include <stdio.h>
#include <stdlib.h>


FILE* AbrirArquivo(char mode, char caminho[40]){
	FILE *arquivo;
	switch(mode){
		case 'l':
			arquivo = fopen(caminho, "rt");
			break;
		case 'g':
			arquivo = fopen(caminho, "wt");
			break;
		case 'a':
			arquivo = fopen(caminho, "a");
			break;
	}
	if(arquivo == NULL){
		printf("The file not undefined");
		exit(0);
	}
	
	return arquivo;
}

void FecharArquivo(FILE *arquivo){
	fclose(arquivo);
}

int main() {
	
	int opcao;
	
	do{
	
		
	
		printf("\n\n\t\t Bem Vindo ao programa agenda !! \n");
		printf("\nMENU");
		printf("\n1 - Cadatrar nome e telefone");
		printf("\n2 - Listar todos os nomes e telefones");
		printf("\n3 - Sair\n");
		scanf("%d", &opcao);
	
		switch(opcao){
			case 1:
			
				break;
			case 2:
			
				break;
			case 3:
				printf("\n\nFinalisando...\n\n");
				exit(0);
			default:
				printf("Opcao invalida !! Tente novamente:"); 
				break;
			} 
	
	}while(opcao != 3);
	return 0;
}
