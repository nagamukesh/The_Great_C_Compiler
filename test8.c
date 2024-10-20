//ERROR FREE - This test case includes nested loops

#include<stdio.h>

int main()
{
        int num = 3;

        for(int i = 0; i<num; i++)
        {
                for(int j = 0; j < num; j++)
                        printf("Hello");
        }
        do{
                int flag=2;
        }while(num>0);
        int *a;
        switch(num){
                case 3: num++;
                default: break;
        }
}
