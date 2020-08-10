%option noyywrap
%{
	#include<stdio.h>
	#include<string.h>

	char a[] = "a";
	char an[] = "an";
	char the[] = "the";
	int count_a, count_an, count_the=0;
%}

%%
[a-zA-Z]+	{ 		int i;
					for(i=0;i<=strlen(yytext);i++){
      					if(yytext[i]>=65 && yytext[i]<=90)
         					yytext[i]=yytext[i]+32;
					}
				if(strcmp(yytext, a) == 0){
				count_a++; }
				if(strcmp(yytext, an) == 0){
				count_an++; }
				if(strcmp(yytext, the) == 0){
				count_the++; }}
.	;	
%%


int main()
{
	extern FILE *yyin;
	yyin=fopen("test.txt", "r");
	yylex();

	printf("%d %d %d", count_a, count_an, count_the);
	
}