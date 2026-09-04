#include<stdio.h>

int main() {
	float i,g1,g2,mf;
	int al,a;
	
	printf("Digite a quantidade de alunos: ");
	scanf("%d",&al);
	
	for(i=0;i<al;i++){
		printf("\nDigite a primeira nota: ");
		scanf("%f",&g1);
		
		printf("Digite a segunda nota: ");
		scanf("%f",&g2);
		mf = (g1+g2)/2;
		
	printf("A primeira foi %.1f, a segunda %.1f, resultando na media %.1f \n",g1,g2,mf);
	}
}
