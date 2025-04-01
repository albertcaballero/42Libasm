#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

extern int ft_strlen(char *c);
extern char *ft_strcpy(char *c, char *s);
extern int ft_strcmp(char *c, char *s);
extern size_t ft_write(int ,char *, int);
extern size_t ft_read(int ,char *, int);
extern char *ft_strdup(char *c);

int main(void){
	char src[] = "HOLIWIS";
    char *mall;
    char *mall1;
    mall = strdup(src);
    printf("orig:-%s-\n", mall);
    mall1 = ft_strdup(src);
	if (!mall1)
		return -1;
	printf("mine:-%s-\n", mall1);

}