#include<stdio.h>
void func(int a,char b);

int main(){
    int x[10]={1,2,3,4,5,6};
    printf("%d\n",x[0]);
    if(x[0]==2){
        printf("good only");
    }
    if(x[4]==5){
    	printf("still good\n");
    }

}
