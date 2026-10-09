#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int resto (int a,int b){
	if(a < b){
		return a;
	}else{
		return resto(a-b,b);
	}
}

int main() {
	int resultado = resto(10,5);
	printf("%d",resultado);
	return 0;
}