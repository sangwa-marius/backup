#include <stdio.h>

int main(){
	int num1,num2,sum,product;
	printf("Enter two numbers: ");
	scanf("%d %d",&num1,&num2);
	sum = num1+num2;
	product = num1*num2;
	printf("The sum of %d and %d is %d and their product is %d",num1,num2,sum,product);
	return 0;

}
