#include<stdio.h>

int main() {
	float media, soma=0, notas[5];
	int i;
	
	//percorre todos os indices do vetor
	for(i=0;i<5;i++){
		printf("\n Informe a nota: ");
		scanf("%f",&notas[i]);
		//i = valor da posição de elemento
	}
	
	//realiza a soma das notas
	for(i=0;i<5;i++){
		soma = soma + notas[i];
	}
	
	//calcula a media
	media = soma/5;
	
	printf("Media: %.2f",media);
	
}
