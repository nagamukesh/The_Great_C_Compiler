//error test for function return mismatch
#include<stdio.h>

int intReturningFunc(int a)
{
    int abc=1;
    a = a + 5;
    return 1;
}

enum token {
    qwer=9,
    sdakfgk=23,
    lsahf
};


int main()
{
    int i,n;
    float b;
    b=intReturningFunc(i);

    switch (i) {
        case 1:
            printf("asfas");
            break;
        case 3:
            printf("asfas");
            break;
        case 7:
            scanf("%d", n);
            break;
        default:
            printf("this is default");
            break;
    }


    printf("%d",i);
}
