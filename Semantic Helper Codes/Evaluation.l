%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
  
%}

%%

[0-9]+                    { yylval.intval = atoi(yytext); return INT_C; }
[0-9]+"."[0-9]+           { yylval.floatval = atof(yytext); return FLOAT_C; }
"+"                       { return '+'; }
"-"                       { return '-'; }
"*"                       { return '*'; }
"/"                       { return '/'; }
"("                       { return '('; }
")"                       { return ')'; }
\n                        { yylineno++; }
";"                       { return ';'; }
[ \t\r]                     { /* ignore whitespace */ }
"e"                       { return 'e'; }
.                         { printf("Unknown character:%s in line %d\n", yytext, yylineno); exit(1); }

%%

int yywrap() {
    return 1;
}
