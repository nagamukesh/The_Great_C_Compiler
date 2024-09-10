#include<stdio.h>

int main()
{
	int A[5] = {1,2,3,4,5};
	char B[10] = "Hello";
	
	if(B[0] == 'H'){
		if(A[0] == '1')
			printf("Hello 1");
		else
			printf("Hello 2");
	}
	else
		printf("Not Hello");
}