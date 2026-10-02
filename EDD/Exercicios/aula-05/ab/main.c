#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int multiplica(int a,int b){
	if(a==1){//caso base
		return b;
	}else{//caso geral
		return b+multiplica(a-1,b);
	}
}

int main() {
	
	int a=4,b=3,resultado;
	resultado = multiplica(a,b);
	printf("Multiplicacao (%d,%d) = (%d)",a,b,resultado);
	
	return 0;
}