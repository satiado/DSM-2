#include<stdio.h>
#include<stdlib.h>

void merge(int *v, int esq, int meio, int dir)
{
    int i, j, k;
    int a_tam = meio-esq+1;
    int b_tam = dir-meio;
    int a[a_tam],b[b_tam];

    for (i = 0; i < a_tam; i++)
    {
        a[i] = v[i+esq];
    }

    for (i = 0; i < b_tam; i++)
    {
        b[i] = v[i+meio+1];
    }

    i=0;
    j=0;

    for (k = esq; k <= dir; k++)
    {
        if (i == a_tam)
        {
            v[k] = b[j++];
        }
        else
        {
            if (j == b_tam)
            {
                v[k] = a[i++];
            }
            else
            {
                if(a[i] < b[j])
                {
                    v[k] = a[i++];
                }
                else
                {
                    v[k] = b[j++];
                }
            }
        }
    }
}
//esquerda = 0 e direita = 7
void mergeSort(int *v, int esq, int dir)
{
	// = == 7
    if (esq == dir) //caso base 
        return;

	//caso geral
    int meio = (esq + dir) / 2; // merio = 3
    mergeSort(v, esq, meio); //esquerda 0 e direita = 3
    mergeSort(v, meio+1, dir); // 4 e 7 
    merge(v, esq, meio, dir);// etapa de conquista 
    return;
}

void imprimeVetor(int *v, int tam)
{
    int i;
    printf("\n Ordem correta: v = {");
    for(i=0; i<tam; i++)
    {
        printf("%d ",v[i]);
    }
    printf("}");
}

int main()
{
    int v[8]= {14,7,8,12,9,11,6,5};
    mergeSort(v, 0, 7);
    imprimeVetor(v,8);
}
