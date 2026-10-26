#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>



bool Encontra(char vet[], char letra){
	for(int i =0; i < strlen(vet); i++){
		if( tolower(vet[i]) == tolower(letra)){
			
			return true;
			
		}
		
		return false;
	}
}


int main(){

	char palavra [] = "Helicoptero";
	
	if(Encontra(palavra, 'T')){
		printf("\n\n\n Letra encontrada \n\n\n");
	}else{
		printf("\n\n\n Letra nao encontrada \n\n\n");
	}
	
	return 0;

}
