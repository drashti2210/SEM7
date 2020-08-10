%option noyywrap
%{
	#include<stdio.h>
%}

%%
^(1|01)+$	{ printf("Valid\n"); }
%%
int main()
{
	yylex();
	return 0;
}

