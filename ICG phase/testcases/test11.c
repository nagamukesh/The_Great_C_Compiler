#include<stdio.h>

//Type mismatch error

int myfunc(int b)
{
    int x;
    return x;
}

int check(int a){
	return 1;
}

typedef struct studf{
int a; int b;
}stu;

int main()
{
    int n;
    char ch;
    int x;
    int a;  
    int h[1][20];
    int arr[5]={1,2,3,4,5};
    char bh[10]="bhgu";
    float basdf;
    struct stu hu;
    double m=9.04;
    float f = 9.087;
    for (int i=0;i<10;i++){
        int x="gh";
        int z=check(h);
        
        if(x<4){
            int y;
            while(x<10){
              int y;
                x++;
            }
        }
    }

    switch (a)
    {
    	case 1:
    		printf("hello1\n");
    		break;
    		
    	case 2:
      		printf("hello");
      		break;
    
    	default:
     	 	break;
    }
    return 1;
}

int hi(int a){
  return a;
}
