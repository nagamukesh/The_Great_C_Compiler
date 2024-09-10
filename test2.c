#include<stdio.h>

int product(int a)
{
	return 5*a;
}

int main()
{
	int a = 5;
	int b = product(a);
	printf("%d ", b);
}      