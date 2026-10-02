#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int fatorial(int n){
	if((n==1) || (n==0)){//caso base 
		return 1;
	}else{//caso geral
		return n*fatorial(n-1);
	}
}

int main() {
	
	int n=5, resultado;
	resultado = fatorial(n);
	printf("Fatorial (%d) = %d",n,resultado);
	fatorial(n);
	
	return 0;
}