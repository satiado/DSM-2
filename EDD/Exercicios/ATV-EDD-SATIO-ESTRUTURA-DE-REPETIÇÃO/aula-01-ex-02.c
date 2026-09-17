#include<stdio.h>

int main(){
	float a,ma,mo;
	int i;
	for (i=1; i<=15; i++) {
		printf("Digite a altura :");
		scanf("%f",&a);
		
		if (i==1){
			ma=a;
			mo=a;
		}else{
			if(a>mo){
				mo=a;
			}if(a<ma){
				ma=a;
			}
		}
	}
	printf("O maior e %.2f \n",mo);
	printf("O menor e %.2f",ma);

}

