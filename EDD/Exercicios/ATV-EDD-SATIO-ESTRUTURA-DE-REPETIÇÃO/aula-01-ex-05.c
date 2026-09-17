#include<stdio.h>

int main() {
	int a, p=0, i=0, b=0;
	float sp=0, mp=0, mg=0, sg=0;
	
	printf("Digite um numero, e 0 para sair: \n") ;
	while(1){
	
	scanf("%d",&a);
	if(a==0){
		break;
	}
	
	sg = sg + a;
	 
	if(a % 2 == 0){
		p = p + 1;
		b = b+1;
		sp = sp + a;
	}if(a % 2 == 1){
		i = i + 1;
		b = b + 1;
	}
	
	mg = sg / b;
	mp = sp / p;
	
	}
	
	printf("Foram %d pares e %d impares. A media dos pares e %.1f, e a media geral e %.1f",p,i,mp,mg);
}
