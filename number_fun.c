#include <stdio.h>
#include <math.h>
void author(void) ;
void part1(void) ; //prototype
void part2(void) ;
void part3(void) ;
void part4(void) ;

void author(void) 
{ 
 printf("number_fun "); 
 printf("Author "); 
 printf("   Jacob Lundquist \n"); 
} 
int main() 
{ 
    author(); 
    part1(); 
    part2(); 
    part3(); 
    part4();
    return 0;
} 

void part1(void) 
{ 
printf("\n the shift of 3 values \n");
/*** declarations should appear at the top of each function ***/ 

 int a; 
 int b;
 int c;
 int x;
 
 printf("\n--- PART 1 ---\n"); 
 printf(" type 3 numbers \n");
 scanf(" %d %d %d", &a, &b, &c ); 
 printf("Before any shifts: \n");  
 printf("a is %d, b is %d, c is %d \n", a, b, c); 
 
 printf("After the shift: \n");  
 x = a;
 a = b;
 b = c;
 c = x;   
 printf("a is %d, b is %d, c is %d \n", a, b, c); 

 printf("After the shift: \n");  
 x = a;
 a = b;
 b = c;
 c = x;   
 printf("a is %d, b is %d, c is %d \n", a, b, c); 

 printf("After the shift: \n");  
 x = a;
 a = b;
 b = c;
 c = x;   
 printf("a is %d, b is %d, c is %d \n", a, b, c); 
} 


void part2(void) 
{
 printf("\n generating the tip \n");
 
 double bill;
 double a;
 double b;
 double c;
 double tot10;
 double tot15;
 double tot20;
 double tot10r;
 double tot15r;
 double tot20r;

 printf("\n\n--- PART 2 ---\n"); 
 printf(" enter a bill amount in $ \n");
 scanf(" %lf",&bill); 
 
 a = floor((bill*0.10)*100.00+0.50)/100.00;
 b = floor((bill*0.15)*100.00+0.50)/100.00;
 c = floor((bill*0.20)*100.00+0.50)/100.00;
 tot10 = bill + a;
 tot15 = bill + b;
 tot20 = bill + c;

 tot10r = floor((tot10)*100.00+0.50)/100.00;
 tot15r = floor((tot15)*100.00+0.50)/100.00;
 tot20r = floor((tot20)*100.00+0.50)/100.00;

 


 printf("For a bill of $'bill' \n");
 printf("a 10%% tip is $%.3f giving a total of $%.3f\n", a, tot10r);
 printf("a 15%% tip is $%.3f giving a total of $%.3f\n", b, tot15r);
 printf("a 20%% tip is $%.3f giving a total of $%.3f\n", c, tot20r);
 

} 



void part3(void) 
{ 
 printf("\n reverse the digits \n");

 int start; 
 int final; 

 int ones;
 int tens;
 int hundreds;
 int thousands;

 printf("\n\n--- PART 3 ---\n"); 
 printf("enter a 4 digit integer \n");
 scanf(" %d",&start); 
 printf("The starting value is %.4d\n",start); 
    
    thousands = start/1000; 
    hundreds = (start-thousands*1000)/100;
    tens = (start - (thousands*1000) - (hundreds*100))/10;
    ones = (start - (thousands*1000) - (hundreds*100) - (tens*10));
    
    final = (ones*1000)+(tens*100)+(hundreds*10)+(thousands*1);

 printf("The final    value is %.4d\n",final); 
} 


void part4(void) 
{ 
 printf("\n shifting letters \n");

 char letter;
 int integer;
 char answer;

 printf("\n\n--- PART 4 ---\n"); 
 printf("please enter an uppercase letter: \n");
 scanf(" %c",&letter);
    if (letter > 96 && letter < 123)
    {
        printf("the character is not an uppercase letter\n");
    }
    else if (letter > 64 && letter < 91)
    {
        printf("please enter an integer (from 0 to 26): \n");
        scanf(" %d",&integer);
        if (integer > 26)
        {
            printf("the shift is too big\n");
        }
        else if (integer < 0)
        {
            printf("the shift is negative\n");
        }
        else
        {
            answer = letter + integer;
            if (letter+integer > 90)
            {
                answer = answer - 26;
            }
            printf(" %c shifted %d positions is %c \n", letter, integer, answer);
        }
            
    }
    else
    {
        printf("the character is not an uppercase letter\n");
    }
 
} 