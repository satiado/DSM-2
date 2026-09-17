#include<stdio.h>

int main() {
	int i, p=0, n=0,s=0, a[10];
	float m,c=0,b=0;
	
	for (i=0;i<10;i++){
	printf("Digite um numero: ");
	scanf("%d",&a[i]);
	
	
	if(a[i]>0){
		p = p+1;
	}	
	else {
		n = n+1;
	} 
	 
	}
	
	for(i=0;i<10;i++){
		s = s+a[i];
	}
	
	m = s/10;
	c = (n/10.0)*100;
	b = (p/10.0)*100;
	
	printf("Tem %d negativos, %d positivos e a media e %.1f. Uma taxa de %.1f positivo e %.1f negativo",n,p,m,b,c);
}
