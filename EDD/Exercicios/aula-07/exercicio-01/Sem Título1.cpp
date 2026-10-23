#include<stdio.h>

int main(){
	
	int vet[100],i;
	int *p;
	p = vet;
	//inicializar todas as posições com 0 
	for(i=0;i<100;i++){
		*(p+i) = 0;
	}
	
	//gerar valores de 0 a 100
	for(i=0;i<100;i++){
		*(p+i) = i+1;
		printf("\nvalor %d na posicao %d",vet[i],i);
	}
	
	return 0;
}