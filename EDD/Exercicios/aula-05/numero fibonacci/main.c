#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int numero(int n){
	if(n==0){
		return 0;
	}else if(n==1){
		return 1;
	}else {
		return numero(n-1)+numero(n-2);
	}
	
}

int main() {
	
	int n=6 ,resultado;
	resultado=numero(n);
	printf("O resultado de (%d) = (%d)\n",n,resultado);
	return 0;
}
                       
                                          