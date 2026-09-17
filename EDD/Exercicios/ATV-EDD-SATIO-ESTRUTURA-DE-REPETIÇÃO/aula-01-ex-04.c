#include<stdio.h>

int main() {
	int a,b=0,c=0,d=0,e=0;
	
	printf("Digite um numero de 0 a 100, e negativo para sair: ");
	while(1){
	scanf("%d",&a);
	if(a<0){
	break;
	}	

	
	if(a>=0 && a<=25){
		b = b+1;
	}
	else if(a>=26 && a<=50){
		c = c+1;
	}
	else if(a>=51 && a<=75){
		d = d+1;
	}
	else if (a>=76 && a<=100){
		e = e+1;
		}
	}
	
	printf("Voce digitou entre 0-25: %d",b);
	printf("\nVoce digitou entre 26-50: %d",c);
	printf("\nVoce digitou entre 51-75: %d",d);
	printf("\nVoce digitou entre 76-100: %d",e);
	return 0;
}
