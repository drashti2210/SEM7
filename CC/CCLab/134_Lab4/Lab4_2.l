%option noyywrap
%{
	#include<stdio.h>
	int count,fl;
%}
%%
[ab]	{
			if(fl==1)
			{
				count--;
				if(count<0)
				{
					printf("Invalid\n");
					exit(1);
				}
			}
			else
			{
				if(fl==0)
				{
					count++;
				}
			}
		}
c 		{
			fl++;
			if(fl>=2)
			{
				printf("Invalid\n");
				exit(1);
			}
		}
\n		{
			if(count==0)
			{
				printf("Valid\n");
				exit(0);
			}
			else
			{
				printf("Invalid");
				exit(1);
			}
		}
%%	
int main()
{
	count=0;
	fl=0;
	yylex();
	return 0;
}