#include<stdio.h>

void selectionSort(int vetor[], int tamanho)
{
	int i, j, menor, aux;

	for(i = 0; i < tamanho - 1; i++){
		menor = i;

		for(j = i + 1; j < tamanho; j++){
			if(vetor[j] < vetor[menor]){
				menor = j;
			}
		}

		if(menor != i){
			aux = vetor[i];
			vetor[i] = vetor[menor];
			vetor[menor] = aux;
		}
	}
}

int main() {
	int tempos[] = {12, 9, 15, 11, 10, 14, 8, 13};
	int tamanho = 8;
	int i;

	selectionSort(tempos, tamanho);

	for(i = 0; i < tamanho; i++){
		printf("%d ", tempos[i]);
	}

	return 0;
}
