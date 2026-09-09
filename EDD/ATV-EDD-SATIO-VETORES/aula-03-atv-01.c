#include<stdio.h>

int main() {
	int i,m=0 , a[15];
	
	for (i=0;i<15;i++){
		printf("Digite um numero: ");
		scanf("%d",&a[i]);
	}
	
	for(i=0;i<15;i++) {
		
		if(m<a[i]){
			
			m=a[i];
		}
	}
	
	printf("O maior valor e %d",m);
}
