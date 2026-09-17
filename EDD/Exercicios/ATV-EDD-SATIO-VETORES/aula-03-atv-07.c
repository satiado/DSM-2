#include<stdio.h>

int main() {
	int i,ni=0, nam=0;
	float  n[30], m=0, s ;
	
	for(i=0;i<30;i++){
	printf("Digite as notas: ");
	scanf("%f",&n[i]);
	
	if(n[i]>=0 && n[i]<=10){
		s = s + n[i];
		
		
		if(n[i]>=7 && n[i]<=10){
			nam = nam + 1;
		}
	}else{
		ni = ni + 1;
	}
		
	}
	m = s / 30;
	printf("\nMedia: %.1f \nNotas invalidas: %d \nNotas acima da media: %d",m,ni,nam);
	
	
	
}
