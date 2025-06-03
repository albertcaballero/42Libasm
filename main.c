#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

typedef struct s_list {
   void         *data;
   struct s_list *next;
} t_list;

extern size_t ft_strlen(char *c);
extern char *ft_strcpy(char *c, char *s);
extern int ft_strcmp(char *c, char *s);
extern size_t ft_write(int ,char *, int);
extern size_t ft_read(int ,char *, int);
extern char *ft_strdup(char *c);

extern int ft_list_size(t_list *begin_list);
extern void ft_list_push_front(t_list **begin_list, void *data); //FALTA ACABAR


void printList(t_list *list){
    int i = 0;
    while (list != NULL){
        printf("Node %i: %s\n", i, (char *)list->data);
        ++i;
        list = list->next;
    }
}

int main(void){
    {
        printf("=====STRLEN=====\n");
        char *str = "holaquetal";
        printf("original: %lu, mine: %lu\n", strlen(str), ft_strlen(str));
    }
    {
        printf("=====STRCPY=====\n");
        char *str = "holaquetal";
        char buf1[20];
        char buf2[20];
        printf("original: %s, mine: %s\n", strcpy(buf1, str), ft_strcpy(buf2, str));
    }
    {
        printf("=====STRCMP=====\n");
        char *str1 = "holaquetal";
        char *str2 = "holAtal";
        printf("original: %i, mine: %i\n", strcmp(str1, str2), ft_strcmp(str1, str2));
    }
    {
        printf("=====WRITE=====\n");
        char *str = "holaquetal";
        printf("orig: \n");
        int org = write(1, str, strlen(str));
        printf("\nmine: \n");
        int mine = ft_write(1, str, strlen(str));
        printf("\noriginal: %i, mine: %i\n", org, mine);
    }
    {
        printf("=====READ=====\n");
        char buf1[100];
        int fd = open("Makefile", O_RDONLY);
        printf("original: %lu\nstr: %s\n", read(fd,buf1, 100), buf1);
        close(fd);

        fd = open("Makefile", O_RDONLY);
        printf("mine: %lu\nstr: %s\n", ft_read(fd,buf1, 100), buf1);
        close(fd);
    }
    {
        printf("=====STRDUP=====\n");
        char *str = "holaquetal";
        char *dup1 = strdup(str);
        char *dup2 = ft_strdup(str);
        printf("original: %s, mine: %s\n", dup1, dup2);
    }
    {
        printf("=====LIST_SIZE=====\n");
        t_list *list;
        t_list *beg;
        list = malloc(sizeof(t_list));
        beg = list;
        int loops = 4;
        for (int i = 0; i < loops; ++i){
            list->data = ft_strdup("buenos dias");
            if (i == loops-1){
                list->next = NULL; 
                break;
            }
            list->next = malloc(sizeof(t_list));
            list = list->next;
        }
        printf("size: %i\n",ft_list_size(beg));
    }
    {
        printf("=====LIST_PUSH_FRONT=====\n");
        t_list *list;
        t_list *beg;
        list = malloc(sizeof(t_list));
        beg = list;
        int loops = 4;
        for (int i = 0; i < loops; ++i){
            list->data = ft_strdup("buenos dias");
            if (i == loops-1){
                list->next = NULL; 
                break;
            }
            list->next = malloc(sizeof(t_list));
            list = list->next;
        }
        ft_list_push_front(&beg, (void *)"holaquetal");
        printList(beg);
    }
}
