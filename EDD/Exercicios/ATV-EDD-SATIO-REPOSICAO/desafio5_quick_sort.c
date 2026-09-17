#include<stdio.h>

int partition(int vetor[], int inicio, int fim)
{
	int pivo = vetor[fim];
	int i = inicio - 1;
	int j, aux;

	for(j = inicio; j < fim; j++){
		if(vetor[j] < pivo){
			i++;
			aux = vetor[i];
			vetor[i] = vetor[j];
			vetor[j] = aux;
		}
	}

	aux = vetor[i + 1];
	vetor[i + 1] = vetor[fim];
	vetor[fim] = aux;

	return i + 1;
}

void quickSort(int vetor[], int inicio, int fim)
{
	if(inicio < fim){
		int posicaoPivo = partition(vetor, inicio, fim);

		quickSort(vetor, inicio, posicaoPivo - 1);
		quickSort(vetor, posicaoPivo + 1, fim);
	}
}

int main() {
	int precos[] = {350, 120, 890, 250, 75, 430, 180, 600};
	int tamanho = 8;
	int i;

	quickSort(precos, 0, tamanho - 1);

	for(i = 0; i < tamanho; i++){
		printf("%d ", precos[i]);
	}

	return 0;
}
