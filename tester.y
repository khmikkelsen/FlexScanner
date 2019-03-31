%{
#include <stdio.h>
%}

%token NUMBER PLUS MINUS DIVIDE LPAR RPAR TIMES
%%
program : expression_list
;
expression_list : expression
	| expression expression_list
	;

expression : term calc
;
term : primary calc2
;
calc2 : term PLUS term
	| term MINUS term
;
calc : TIMES primary
	| TIMES primary
	| DIVIDE primary
	;
primary : NUMBER
	| LPAR expression RPAR
	| MINUS primary
%%

int main (int argc, char** argv) {
	*FILE file = fopen("test.txt",r);
	yyin = file;
	yyparse();
}
