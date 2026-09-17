#include<stdio.h>

int main(){
	int i=1, v=0;
	
	while(i<=500) {
		
		if(i%3 == 0){
			if(i%2 == 1) {
				v=v+i;
			
			
			}
		}
		i++;
	
	}printf("O resultado da soma de todos os conjuntos impares de 1 a 500 e %d \n",v);
}
