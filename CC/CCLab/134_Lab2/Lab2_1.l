%option noyywrap
%s A B C DEAD
%{
	#include<stdio.h>
%}

%%
<INITIAL>0 BEGIN A;
<INITIAL>1 BEGIN B;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL;{printf("Not Accepted\n");};

<A>0 BEGIN INITIAL;
<A>1 BEGIN C;
<A>[^01\n] BEGIN DEAD;
<A>\n BEGIN INITIAL;{printf("Accepted\n");}

<B>0 BEGIN C;
<B>1 BEGIN INITIAL;
<B>[^01\n] BEGIN DEAD;
<B>\n BEGIN INITIAL;{printf("Not Accepted\n");};

<C>0 BEGIN B;
<C>1 BEGIN A;
<C>[^01\n] BEGIN DEAD;
<C>\n BEGIN INITIAL;{printf("Not Accepted\n");};

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("Invalid\n");};
%%

int main()
{
	yylex();
	return(0);
}
