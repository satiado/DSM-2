int main() {
    int i, n[15], p[15], I[15];
    int pi = 0, ii = 0;  

    for(i = 0; i < 15; i++){
        printf("Digite um numero: ");
        scanf("%d", &n[i]);
    }

    for(i = 0; i < 15; i++){
        if(n[i] % 2 == 0){
            p[pi] = n[i];
            pi++;
        } else {
            I[ii] = n[i];
            ii++;
        }
    }

    for(i = 0; i < pi; i++)
        printf("\n%d e par", p[i]);

    for(i = 0; i < ii; i++)
        printf("\n%d e impar", I[i]);

}
