#include <stdio.h>
int main(){
int age;
printf("Enter your age: ");
scanf("%d",&age);

if(age<18){
printf("You are  not allowed to vote in Rwanda");
}else{
printf("You are allowed to vote in Rwanda");
}
return 0;
}

