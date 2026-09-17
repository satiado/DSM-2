#include<stdio.h>

void merge(int vetor[], int inicio, int meio, int fim)
{
	int i, j, k;
	int tamanhoEsquerda = meio - inicio + 1;
	int tamanhoDireita = fim - meio;

	int esquerda[tamanhoEsquerda];
	int direita[tamanhoDireita];

	for(i = 0; i < tamanhoEsquerda; i++){
		esquerda[i] = vetor[inicio + i];
	}
	for(j = 0; j < tamanhoDireita; j++){
		direita[j] = vetor[meio + 1 + j];
	}

	i = 0;
	j = 0;
	k = inicio;

	while(i < tamanhoEsquerda && j < tamanhoDireita){
		if(esquerda[i] <= direita[j]){
			vetor[k] = esquerda[i];
			i++;
		}else{
			vetor[k] = direita[j];
			j++;
		}
		k++;
	}

	while(i < tamanhoEsquerda){
		vetor[k] = esquerda[i];
		i++;
		k++;
	}

	while(j < tamanhoDireita){
		vetor[k] = direita[j];
		j++;
		k++;
	}
}

void mergeSort(int vetor[], int inicio, int fim)
{
	if(inicio < fim){
		int meio = (inicio + fim) / 2;

		mergeSort(vetor, inicio, meio);
		mergeSort(vetor, meio + 1, fim);

		merge(vetor, inicio, meio, fim);
	}
}

int main() {
	int vendas[] = {450, 120, 890, 320, 75, 640, 210, 530};
	int tamanho = 8;
	int i;

	mergeSort(vendas, 0, tamanho - 1);

	for(i = 0; i < tamanho; i++){
		printf("%d ", vendas[i]);
	}

	return 0;
}
