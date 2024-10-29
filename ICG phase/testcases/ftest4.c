//function related errors

#include<stdio.h>

int funcwrong(int a,void x){
	printf("hi");
}

void funcwrong2(){
	return 3;
}

int funcnotright(void){
	float b;
	printf("hi");
	return b;
	return 4.0;
}

void funcok(int a, float b){
	printf("hi");
}

int main(){
	printf("hi");
	funcok(2,2);
	funcok(2,2.0);
	funcok(2);
}

int lastfunc(){
	int a;
	printf("hi");
	return a;
}
