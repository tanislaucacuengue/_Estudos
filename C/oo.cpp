#include <stdio.h>
#include <stdlib.h>


int Global;

void GlobalSet(int valor){
	Global = valor;
}

int GlobalGet(){
	return Global;
}

void GlobalMulti(){
	Global *= Global;
}

int main(){
	
	GlobalSet(25);
	GlobalMulti();
	
	
	printf("Valor: %d", GlobalGet());
	
	return 0;
}
