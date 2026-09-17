#include<stdio.h>

void insertionSort(int vetor[], int tamanho)
{
	int i, j, chave;

	for(i = 1; i < tamanho; i++){
		chave = vetor[i];
		j = i - 1;

		while(j >= 0 && vetor[j] > chave){
			vetor[j + 1] = vetor[j];
			j = j - 1;
		}

		vetor[j + 1] = chave;
	}
}

int main() {
	int notas[] = {7, 4, 9, 6, 8, 5, 10, 3};
	int tamanho = 8;
	int i;

	insertionSort(notas, tamanho);
	for(i = 0; i < tamanho; i++){
		printf("%d ", notas[i]);
	}

	return 0;
}
