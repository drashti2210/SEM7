%option noyywrap
%{
	#include<stdio.h>
	#include<stdlib.h>
%}
%%
[0-9]+	{
		int decimal = 0, octal = 0, i = 1;
		decimal = atoi(yytext);
		    while (decimal != 0)
		    {
		        octal += (decimal % 8) * i;
		        decimal /= 8;
		        i *= 10;
		    }
			printf("%d\n",octal);
		}
%%
int main() {
	yylex();
	return 0;
}