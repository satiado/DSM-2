#include<stdio.h>

int main(){
	int i=1,divisor=0,j=1;
	while (i<=100){//gera os números de 0 a 100
			if(i%j == 0){
				divisor++;
			}
			j++;
		}
		if(divisor == 2){
			printf("%d numero e primo \n",i);
		}
		divisor=0;
		j=1; // reseta valor de j
		i++;
	}
}