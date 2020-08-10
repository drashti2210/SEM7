%option noyywrap
%{
	#include<stdio.h>
	#include<string.h>
	int i;
	char* str;
	int length;
	int flag;
%}

%%
^[A-Za-z]+$	{
			str = yytext;
			length=strlen(str);
			flag=0;
			for(i=0;i<length-1;++i){
				if(str[i]>str[i+1]){
					flag=1;
					break;
				}
			}
			if(!flag){
				printf("Valid\n");
			}
}
%%
int main()
{
	flag=0;
	yylex();
	return 0;
}