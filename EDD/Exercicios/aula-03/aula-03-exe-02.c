#include<stdio.h>

int main(){
	int i;
	float  s1, n1[5], n2[5];
	
	for (i=0;i<5;i++){
		printf("Digite a nota: ");
		scanf("%f",&n1[i]);
	}
	
	for (i=0;i<5;i++){
		printf("Digite as outras notas: ");
		scanf("%f",&n2[i]);
	}
	
	for (i=0;i<5;i++){
		if(n1[i] == n2[i]){
			s1 = n1[i] + n2[i];
			printf("\n a soma dos numeros sao: %.1f",s1);
		}
	}
}