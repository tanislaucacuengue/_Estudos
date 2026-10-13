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

void Cadastra(char nome[30], int telefone){
	FILE *arquivo;
	arquivo = AbrirArquivo('a', "agenda.txt");
	
	fprintf(arquivo, "%s %d\n", nome, telefone);
	
	FecharArquivo(arquivo);
}

void Listar(){
	
	FILE *arquivo;
	char nome[30];
	int telefone;
	
	arquivo = AbrirArquivo('l', "agenda.txt");
	
	while(!feof(arquivo)){
		fscanf(arquivo, "%s %d\n", &nome, &telefone);
		printf("Nome: %s || Telefone: %i\n", nome, telefone);
	}
	
	FecharArquivo(arquivo);
}


int main() {
	
	int opcao;
	int telefone;
	char nome[30];
	
	do{
	
		//system("cls");
		printf("\n\n\t\t Bem Vindo ao programa agenda !! \n");
		printf("\nMENU");
		printf("\n1 - Cadatrar nome e numero de telefone");
		printf("\n2 - Listar todos os nomes e telefones");
		printf("\n3 - Sair\n");
		
		printf("\nDigite uma opcao:");
		scanf("%d", &opcao);
		
		system("cls");
	
		switch(opcao){
			case 1:
				printf("Digite o nome: ");
				scanf("%s", nome);
				setbuf(stdin, NULL);
				printf("Digite o numero: ");
				scanf("%d", &telefone);
				
				Cadastra(nome, telefone);
				break;
			case 2:
				Listar();
				break;
			case 3:
				printf("\n\nFinalisando...\n\n");
				exit(0);
				break;
				
			default:
				printf("Opcao invalida !! Tente novamente:"); 
				break;
			} 
	
	}while(opcao != 3);
	
	return 0;
}
