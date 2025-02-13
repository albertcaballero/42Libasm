
#include <stdio.h>
#include <string.h>

extern int ft_strlen(char *c);

int main(void){
	char str[] = "gasdfasdfasd";


	int i = strlen(str);
    int j = ft_strlen(str);
    printf("\tORIGINAL: %d || ASM: %d\n", i, j);
}