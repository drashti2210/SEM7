%option noyywrap
%{
	#include<stdio.h>
    int num=5;
%}

%%
[a-z]	{ char ch = yytext[0];
          ch += num;
          if (ch > 'z') ch -= ('z'+1-'a');
          printf ("%c", ch);
        }
          
[A-Z]	{ char ch = yytext[0];
          ch += num;
          if (ch > 'Z') ch -= ('Z'+1-'A');
          printf ("%c", ch);
        }

%%
int main()
{
	yylex();
	return 0;
}