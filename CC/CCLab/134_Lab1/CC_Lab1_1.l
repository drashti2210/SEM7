%option noyywrap
%{
    #include<stdio.h>
%}
%%
{
    (00|11)(0|1)*+(0|1)*(00|11) {printf("Valid");}
}
%%
int main()
{
    yylex();
    return 0;
}