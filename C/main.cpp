#include <stdio.h>
#include <stdlib.h>

void ImprimiMenu(int &opcao){
	
	printf("\n\tMENU\n");
	printf("\n\t1 OPCAO 1");
	printf("\n\t2 OPCAO 2");
	printf("\n\t3 OPCAO 3");
	printf("\n\t4 SAIR\n\n");
	printf("Digite a opcao desejada:\n");
	scanf("%d", &opcao);
}

void ControlaMenu(int opcao){
	switch(opcao){
		
		case 1:
			
			break;
			
		case 2:
			
			break;
			
		case 3:
			
			break;
			
		case 4:
			
			break;
			
		default:
			printf("Valor invalida!!");
	}
}

void ConversorTipo(){
	
	double valor;
	valor = 5.00;
	
	int VALOR_INT;
	VALOR_INT = (int) valor;
	
	if(VALOR_INT != valor){
		printf("O valor tem parte decimal");
	}else{
		printf("Valor Inteiro");
	}
}


int main() {
	
	/*int opcao;
	ImprimiMenu(opcao);
	ControlaMenu(opcao);
	*/
	ConversorTipo();
	return 0;
}
