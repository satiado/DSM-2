#include<stdio.h>

int main() {
	int i, vet1[5], vet2[5],s=0,m=0,p=0;
	float d=0;
	
	for(i=0;i<5;i++){
	printf("Digite os primeiros elementos: ");
	scanf("%d",&vet1[i]);
	}
	
	for(i=0;i<5;i++){
	printf("Digite os segundos elementos: ");
	scanf("%d",&vet2[i]);	
	}
	
		printf("\nA soma\n");
	//a. A soma de elementos nas respectivas posições
	for(i=0;i<5;i++){
		if(i == i){
			s = vet1[i] + vet2[i];
		}
		printf("A soma dos valores correspondentes e %d\n",s);
	}	
	
		printf("\nA diferenca\n");
	//b. A diferença dos elementos nas respectivas posições
		for(i=0;i<5;i++){
		if(i == i){
			m = vet1[i] - vet2[i];
		}
		printf("A diferenca dos valores correspondentes e %d\n",m);
	}	
	
		printf("\nO produto\n");
	//c. O produto dos elementos nas respectivas posições
		for(i=0;i<5;i++){
		if(i == i){
			p = vet1[i] * vet2[i];
		}
		printf("O produto dos valores correspondentes e %d\n",p);
	}	
	
		printf("\nA divisao\n");
	//d. A divisão dos elementos nas respectivas posições
		for(i=0;i<5;i++){
		if(i == i){
			d = vet1[i] / vet2[i];
		}
		printf("A divisao dos valores correspondentes e %.2f\n",d);
	}	

}
