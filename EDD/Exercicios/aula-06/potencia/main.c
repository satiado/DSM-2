#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int potencia(int a, int b){
	if(b==1){
		return a;
	}else{
		return a * potencia(a,b-1);
	}
}

int main() {
	int resultado = potencia(10,5);
	printf("%d",resultado);
	return 0;
}