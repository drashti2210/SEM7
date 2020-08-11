%option noyywrap
%{
	#include<stdio.h>
	#include<stdlib.h>
	static int cnt;
	static char stack[100];
	static void push(char x)
	{	
		cnt++;
		if(cnt<100)
		{
			stack[cnt]=x;
		}
		else
		{
			printf("Overflow\n");
			exit(1);
		}
	}
	static char pop()
	{	
		if(cnt>=0)
		{
			return stack[cnt--];
		}
		else
		{
			printf("Underflow\n");
			return "";
		}
	}
%}
%%
[\{\[\(]	{
				push(yytext[0]);
			}

[\}\]\)]	{
				char c=pop();
				if((c=='[' && yytext[0]==']')||(c=='(' && yytext[0]==')')||(c=='{' && yytext[0]=='}'))
				{
					
				}
				else
				{
					printf("invalid\n");
					exit(1);
				}
			}
[^\{\}\[\]\(\)\n] 	{
				printf("Invalid\n");
				exit(1);
			}
\n			{
				if(cnt==-1)
				{
					printf("Valid\n");
					exit(0);
				}
				else
				{
					printf("Invalid\n");
					exit(1);
				}
			}
%%

int main() 
{
	cnt=-1;
    yylex(); 
    return 0; 
}