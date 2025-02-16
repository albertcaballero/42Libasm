#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

extern int ft_strlen(char *c);
extern char *ft_strcpy(char *c, char *s);
extern int ft_strcmp(char *c, char *s);
extern size_t ft_write(int ,char *, int);

int main(void){
	printf("\tORIGINAL: %ld || ASM: %ld\n", write(1, "holiwi", 6), ft_write(1, "holiwi", 6));
}