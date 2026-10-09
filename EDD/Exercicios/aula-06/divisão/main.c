#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int divisao(a,b){
	if (a == 0){
		return 0;
	}else if (a >0){
		return 1+divisao(a-b,b);
	}
}

int main() {
	int resultado = divisao(15,3);
	printf("%d",resultado);
	return 0;
}