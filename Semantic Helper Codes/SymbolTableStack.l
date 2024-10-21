%{
	#include <stdio.h>
	#include "y.tab.h"
%}

%%
\n	{yylineno++;}
[ \t] {}
"while" {return WHILE;}
"begin" {return BEGIN;}
"end" {return END;}
"(" {return '(';}
")" {return ')';}
"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"/" {return '/';}
";"	{return ';';}
"," {return ',';}
">=" {return GEQ;}
">" {return '>';}
"<=" {return LEQ;}
"<" {return '<';}
"!=" {return NEQ;}
"==" {return DEQ;}
"=" {return '=';}
"int"	{return INT;}
"char"	{return CHAR;}
"float"	{return FLOAT;}
"bool"	{return BOOL;}

[A-Za-z_][A-Za-z0-9_]* {return ID;}
[0-9]+ 				   {return NUM;}
[0-9]+\.[0-9]+	       {return FLOAT_LITERAL;}
\'([^\'\\]|\\.)\'           { return CHAR_LITERAL; }
. {}
%%
int yywrap(){
	return 1;
}
