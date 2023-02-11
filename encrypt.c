#include <stdio.h> 
void encrypt_msg(char msg[],char encrypted[]);
void decrypt_msg(char msg[],char decrypted[]);

int main (void) 
{ 
    const int  N = 501; 
    char  original_msg [N]; 
    char  encrypted_msg[N]; 
    char  decrypted_msg[N];
    

    printf("Enter the message to encrypt "); 
    // fgets ( original_msg, N, stdin);
    fscanf( stdin, " %500[^\n]" , original_msg ); 
    printf("original:  %s\n", original_msg); 

    encrypt_msg( original_msg, encrypted_msg); 
    printf("encrypted: %s\n" , encrypted_msg); 

    decrypt_msg( encrypted_msg, decrypted_msg); 
    printf("decrypted: %s\n" , decrypted_msg);

    return 0; 
} 

void encrypt_msg(char msg[],char encrypted[]) 
{ 
    int i;
    int temp;
    
    for(i=0; msg[i]!='\0'; i++)
    {
        if (msg[i] >= 'A' && msg[i] <= 'Z')
        {
            temp = msg[i]+(i+1);
            while ( temp > 'Z')
            {
                temp = temp - 26;
            }
            encrypted[i]=temp;
            
        }
        else if (msg[i] >= 'a' && msg[i] <= 'z')
        {
            temp = msg[i]+(i+1);
            while ( temp > 'z')
            {
                temp = temp - 26;
            }
            encrypted[i] = temp;
            
        }
        else
        {
            encrypted[i] = msg[i];
        }
        

    }
    encrypted[i] = '\0';

} 

void decrypt_msg(char encrypted[],char decrypted[]) 
{ 
    int i;
    int temp;
    
    for(i=0; encrypted[i]!='\0'; i++)
    {
        if (encrypted[i] >= 'A' && encrypted[i] <= 'Z' )
        {
            temp = encrypted[i]-(i+1);
            while (temp < 'A')
            {
                temp = temp + 26;
            }
            decrypted[i] = temp;

        }
        else if (encrypted[i] >= 'a' && encrypted[i] <= 'z')
        {
            temp = encrypted[i]-(i+1);
            while ( temp < 'a')
            {
                temp = temp + 26;
            }
            decrypted[i] = temp;
            
        }
        else
        {
            decrypted[i] = encrypted[i];
        }
        
        
    }
    decrypted[i] = '\0';

} 


