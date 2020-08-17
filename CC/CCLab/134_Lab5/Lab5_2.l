%option noyywrap

%{
	#include <stdio.h>
	int n1 = 0;
	int n2 = 0;
	int out = 0;
	int flag = 0;
%}

%%
\n {	
	if (flag==0)
	{
		n1 = out;
		out = 0;
		flag =1;	
	}
	else{
		n2 = out;
		out = 0;
		flag = 0;
		printf("Addition of %d and %d is %d\n", n1, n2, n1+n2);
	}
}

I { out += 1; }
IV { out += 4; }
V { out += 5; }
IX { out += 9; }
X { out += 10; }
XL { out += 40; }
L { out += 50; }
XC { out += 90; }
C { out += 100; }
CD { out += 400; }
D { out += 500; }
CM { out += 900; }
M { out += 1000; }

[^IVXLCDM] {
	printf("invalid\n");
	exit(1);
}

%%
int main()
{
	printf("Give input two roman numbers line by line\n");
	yyin = stdin; 
	yylex();
	return 0;
}
