%option noyywrap
%{
	#include<stdio.h>
	#include<string.h>
	char* inp;
	char* last;
%}

%%
[0-1]+	{
			inp=yytext;
			last=str+strlen(inp)-2;
			if(!strcmp(inp,"0")){
			printf("Multiple of 4\n");
			}
			if(!strcmp(last,"00")) {
				printf("Multiple of 4\n");
			}
	}
%%
int main()
{
	yylex();
	return 0;
}