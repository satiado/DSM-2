#include<stdio.h>

int main(){
	int op, num1=6, num2=2;
	do{
		printf("1 - SOMA \n");
		printf("2 - SUBTRAcaO \n");
		printf("3 - MULTIPLICAcaO \n");
		printf("4 - DIVISaO \n");
		printf("5 - SAIR \n");
		scanf("%d",&op);
		
		switch(op){
			case 1:
				printf("Soma = %d \n", num1+num2);
			break;
			case 2:
				printf("Subtracao = %d \n",num1-num2);
			break;
			case 3:
				printf("Multiplicacao = %d \n",num1*num2);
			break;
			case 4:
				printf("Divisao = %d \n",num1/num2);
			break;
			case 5:
				printf("Bye bye \n");
			break;
			default:
				printf("Ops, opcao errada! \n");
		}
	}while(op != 5);
	return 0;
}