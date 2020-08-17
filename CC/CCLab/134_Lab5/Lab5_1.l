%option noyywrap
%{
	#include <stdio.h>
	#define STACK_SIZE 100
	char stack[STACK_SIZE];
	int t= -1;
	char st = '0';
	void push(char c)
	{
		stack[++t] = c;
	};
	char pop()
	{	
		return stack[t--];
	};
	int empty()
	{
		return (t < 0);
	}
%}
%%
a {
	if(st =='0' || st =='a')
	{
		push(yytext[0]);
		st = 'a';	
	}
	else
	{
		printf("Incorrect\n");
		exit(1);
	}
  }
b {
	if(st =='a' || st =='b')
	{
		if(!empty()){
			st='b';
			pop();
		}
		else{
			st ='B';
			push('b');
		}
	}
	else if (st =='B')
	{
		push('b');
	}
	else{
		printf("Incorrect\n");
		exit(1);
	}
}
c {
	if(st =='B' || st =='c')
	{
		if(!empty()){
			st = 'c';
			pop();
		}
		else{
		printf("Incorrect\n");
			exit(1);
		}
	}
	else{
		printf("Incorrect\n");
		exit(1);
	}
}
\n {
	if(st =='c' && empty())
	{
		printf("Correct\n");
		exit(0);
	}
	else{
		printf("Incorrect\n\n");
		exit(1);
	}
}
[^abc\n] {
	printf("Invalid\n");	
	exit(1);
   }
%%
int main()
{
	yyin = stdin; // default
	yylex();
	return 0;
}

