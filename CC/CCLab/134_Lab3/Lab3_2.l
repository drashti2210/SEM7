%{
#include<stdio.h>
#include<math.h>
int i, n=0;
%}
%%
[0|1]+ {
        
        for(i=0;i<yyleng;i++)
            n=(n*2)+(yytext[i]-'0');
        printf("Decimal number is %d",n);
    
        }
[^01\n] {printf("invalid");}
%%

int yywrap(void){
    return 1;
}
int main(void)
{
    yylex();
    return 0;
}

