//Array errors
//during compilation, we check only 2 array errors: array subscript less than 1 and array subscript missing

#include<stdio.h>

int main(){

    int arr1[20];
    float arr2[20];
    int arr3[-20];
    int arr4[0];

    int a=arr1[2];
    int b=arr1[-2];
    int d=arr1;
    int e=arr2[5];
    int f=arr3[3];
    int g=arr2[0];

return 0;
}
