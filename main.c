
#include <stdio.h>
#include <string.h>

extern int ft_strlen(char *c);
extern char *ft_strcpy(char *c, char *s);

int main(void){
	char str[] = "gasdfasdfasd";


	// int i = strlen(str);
    // int j = ft_strlen(str);
    // printf("\tORIGINAL: %d || ASM: %d\n", i, j);



	char tmp[100];
    char tmp1[100];
    char *ex;
    char *ex1;
    ex = strcpy(tmp, "Holiwiaaa");
    printf("orig\tTMP: %s || EX: %s\n", tmp, ex);
    ex1 = ft_strcpy(tmp1, "Holiwiaaa");
    printf("mine\tTMP: %s || EX: %s\n", tmp1, ex1);
}