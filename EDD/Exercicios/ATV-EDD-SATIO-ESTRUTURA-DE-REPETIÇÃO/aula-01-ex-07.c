#include<stdio.h>

int main() {
	
	int i,a,b=1;
	
	printf("Digite um numero de 1 a 10: ");
	scanf("%d",&a);
	
	for(i=0;i<11;i++){
		b = a * i;
		printf("%d X %d = %d\n",a,i,b);
		
	}
	
}
