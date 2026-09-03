#include<stdio.h>

int main() {
	int i, a[10], b,c;
	
	printf("Digite um numero importante: ");
	scanf("%d",&b);
	
	printf("Digite 10 valores \n");
	
	for(i=0;i<10;i++){
		printf("Digite um numero: ");
		scanf("%d",&a[i]);	
		
		if(a[i] == b){
		c = c+1;
		}
	}	
	
	printf("Voce digitou o %d um total de %d vezes",b,c-1);
}
