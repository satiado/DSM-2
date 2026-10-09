#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int tamanhoString(char str[], int indice){
	if (str[indice] == '\0'){
		return 0;
	}else{
		return 1 + tamanhoString(str,indice + 1);
	}
}

int main() {
	char texto[] = "satio";
	int qtd = tamanhoString(texto, 0);
	printf("Quantidade de caracteres: %d\n",qtd);
	return 0;
}