#include<stdio.h>

int main() {
	int i, x[20], y[20], pe=0, ps=0;
	
	for(i=0;i<20;i++){
		printf("Digite o valor de X: ");
		scanf("%d",&x[i]);
	}
	printf("\n");
	for(i=0;i<20;i++){
		printf("Digite o valor de Y: ");
		scanf("%d",&y[i]);
	}
	
	for(i=0;i<20;i++){
	if(i == i){
		ps = x[i] * y[i];
		pe = ps + pe;
	}
	
	}
	
	printf("\nO valor do Produto Escalar de X e Y e %d",pe);
		
}

