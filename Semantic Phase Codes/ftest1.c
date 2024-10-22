//Duplicate decleration example
//Id undeclared in scope error

#include<stdio.h>

int a;

int main(){

	int a;

	for(int i=0;i<n;i++){  //n is not declared
		int a;  //this a is not an error
		int i;
		float c;
	}
	c=2.0;  //c not declared in this scope

	float a;
	int a;
	return 0;
}
