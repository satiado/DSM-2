#include<stdio.h>

void bubbleSort(int vetor[], int tamanho)
{
	int i, j, aux;

	for(i = 0; i < tamanho - 1; i++){
		for(j = 0; j < tamanho - 1 - i; j++){

			if(vetor[j] > vetor[j + 1]){
				aux = vetor[j];
				vetor[j] = vetor[j + 1];
				vetor[j + 1] = aux;
			}
		}
	}
}

int main() {
	int temperaturas[] = {32, 25, 28, 21, 30, 26, 24, 35};
	int tamanho = 8;
	int i;

	bubbleSort(temperaturas, tamanho);

	for(i = 0; i < tamanho; i++){
		printf("%d ", temperaturas[i]);
	}

	return 0;
}
