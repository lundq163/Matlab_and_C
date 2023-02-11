#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void author(void);
void initialize_rng(void);
void rock_paper_scissors (void);
void score(void);

int main (void)
// DO NOT ALTER THIS FUNCTION
{
	author ();
	initialize_rng();
	rock_paper_scissors();
    score();

	return 0;
}

int human = 0;
int comp = 0;
int ties = 0;

void score(void)
{
    printf("human = %d\n", human);
    printf("computer = %d\n", comp);
    printf("ties = %d\n", ties);
}

void author(void)
{
	printf("RPS ");
	printf("Author(s) ");
	printf(" Jacob Lundquist ");
	printf("\n");
}

void initialize_rng(void) // DO NOT ALTER THIS FUNCTION
{
   //This sets the seed for the random number generator.
   //This need only be done once in the program.
	srand((unsigned)time(NULL));
}

void rock_paper_scissors (void)
{
   
   char user;
   int num;
   float pct;
   float total = 0;

 while( 1 )
 {
 do{
   score();
   printf("Enter R for ROCK, P for PAPER, S for Scissors, or Q for Quit ");
   scanf(" %c",&user);
   printf("human chose %c\n", user);
   if(!(user=='R'||user=='P'||user=='S'||user=='r'||user=='p'||user=='s'||user=='Q'||user=='q'))
   {
       printf("your entry is incorrect. try again\n");
   }
 }while ( !(user=='R'||user=='P'||user=='S'||user=='r'||user=='p'||user=='s'||user=='Q'||user=='q') );
   {
     // Example to generate one of ten numbers from 0 to 9.
    
	 num = rand()%3;
     if ( num == 0 )
     {
        printf("Computer chose ROCK\n");
        if (user == 'R' || user == 'r')
       {
           printf("Tie! \n" );
           ties = ties + 1;
           total = total + 1;
       }
       else if (user == 'S' || user == 's')
       {
           printf("Computer wins :( \n" );
           comp = comp + 1;
           total = total + 1;
       }
       else if (user == 'P' || user == 'p')
       {
           printf("Human wins! \n" );
           human = human + 1;
           total = total + 1;
       }
       else if (user == 'Q' || user == 'q')
       {
        pct = (human/total)*100.00;
        printf("win percentage = %f\n",pct);
        break;
       }
     }
     else if (num == 1)
     {
        printf("Computer chose PAPER\n");
        if (user == 'R' || user == 'r')
       {
           printf("Computer wins :( \n" );
           comp = comp + 1;
           total = total + 1;
       }
       else if (user == 'S' || user == 's')
       {
           printf("Human wins! \n" );
           human = human + 1;
           total = total + 1;
       }
       else if (user == 'P' || user == 'p')
       {
           printf("Tie! \n" );
           ties = ties + 1;
           total = total + 1;
       }
       else if (user == 'Q' || user == 'q')
       {
        pct = (human/total)*100.00;
        printf("win percentage = %f\n",pct);
        break;
       }
     }
     else if (num == 2)
     {
        printf("Computer chose SCISSORS\n");
        if (user == 'R' || user == 'r')
       {
           printf("Human wins! \n" );
           human = human + 1; 
           total = total + 1;
       }
       else if (user == 'S' || user == 's')
       {
           printf("Tie! \n" );
           ties = ties + 1;  
           total = total + 1;
       }
       else if (user == 'P' || user == 'p')
       {
           printf("Computer wins :( \n" );
           comp = comp + 1; 
           total = total + 1;
       }
       else if (user == 'Q' || user == 'q')
       {
        pct = (human/total)*100.00;
        printf("win percentage = %.3f\n",pct);
        break;
       }
     }
    }
  }
} 
 
 

   
   


