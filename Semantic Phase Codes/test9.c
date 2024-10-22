//modifiers
//arithmetic operation
//logical operations

#include<stdio.h>
int lauda = 1;
int func(int var) {
    return 1;
}

int lassan() {
    int p = 9;
    return p;
}

int main()
{
    long int a, b;
    unsigned long int x;
    signed short int y;
    signed short z;
    int w;
    a = 23;
    a=20;
    b = 15;
    int c = a + b;
    printf("%d",c);
    c = a - b;
    printf("%d",c);
    c = a * b;
    printf("%d",c);
    c = a/b;
    printf("%d",c);
    c = a%b;
    printf("%d",c);

    c = (a>=b);
    printf("%d",c);
    c = (a<=b);
    printf("%d",c);
    c = (a==b);
    printf("%d",c);
    c = (a!=b);
    printf("%d",c);
}