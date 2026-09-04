#include<stdio.h>

int main(){
	float media,soma=0, notas[4];
	int  i;
	
	for (i=0;i<4;i++){
		printf("Digite a nota: ");
		scanf("%f",notas[i]);
	}
	
	for (i=0;i<4;i++){
		soma = soma+notas[i];
	}
	
	media=soma/4;
	
	printf("Sua media foi %.1f",media);
}