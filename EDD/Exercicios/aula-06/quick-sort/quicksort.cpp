#include<stdio.h>
#include<stdlib.h>

int particiona(int *v, int inicio, int fim){
    int pivo,aux;

    pivo = v[(inicio+fim)/2];

    while(inicio < fim){
        while(inicio < fim && v[inicio] <= pivo){
            inicio = inicio+1;
        }
        while(inicio <fim && v[fim] > pivo){
            fim = fim-1;
        }
        aux=v[inicio];
        v[inicio] = v[fim];
        v[fim]=aux;
    }
    return inicio;
}

void randomQuickSort(int *v, int inicio, int fim){
    int pos;
    if (inicio < fim){
        pos = particiona(v,inicio,fim);
        randomQuickSort(v,inicio,pos-1);
        randomQuickSort(v,pos,fim);
    }
}

void imprimeVetor(int *v, int tam){
    int i;
    printf("\n Ordem correta: v = {");
    for(i=0;i<tam;i++){
        printf("%d ",v[i]);
    }
    printf("}");
}

int main(){
    int v[8]={4,3,6,7,9,10,5,8};
    randomQuickSort(v,0,8);
    imprimeVetor(v,8);
}
