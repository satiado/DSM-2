#include<stdio.h>

int main() {
	int i,m=0, f[20];
	
	for(i=0;i<20;i++){
		printf("Digite um numero: ");
		scanf("%d",&f[i]);
	}
	
	for (i=0;i<20;i++){
		m = (f[i] * i+1);
		printf("\n O resultado e: %d",m);
	}
	

	
	
}
