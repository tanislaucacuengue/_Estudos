#include <stdio.h>
#include <stdlib.h>

/*

FPUTC == SERVE PARA GRAVAR UM CARACTER
FGETC == sERVE PARA LER UM CARACTER

FPUTS == SERVE PARA PARA GRAVAR UMA SEQUENCIA DE CARACTERES 
FGETS == SERVE PARA PARA LER UMA SEQUENCIA DE CARACTERES 

*/

FILE* AbrirArquivo(char modo, char caminho[30]){
	FILE *arquivo;
	switch(modo){
		
		case 'g':
			arquivo = fopen(caminho, "wt");
			break;
		case 'l':
			arquivo = fopen(caminho, "rt");
			break;
		case 'a':
			arquivo = fopen(caminho, "a");
			break;
	}
	if(arquivo == NULL){
		printf("The file not undefined!!!");
		exit(0);
	}
	return arquivo;
}

void FecharArquivo(FILE *arquivo){
	fclose(arquivo);
}


int main() {
	
	FILE *arquivo;
	char valor[100];
	
	arquivo = AbrirArquivo('g', "teste.txt");
	
	fprintf(arquivo, "Ola_Tudo_bem");
	
	FecharArquivo(arquivo);
	
	arquivo = AbrirArquivo('l', "teste.txt");
	
	fscanf(arquivo, "%s", valor);
	printf("%s", valor);
	
	FecharArquivo(arquivo);
	
	return 0;
}
