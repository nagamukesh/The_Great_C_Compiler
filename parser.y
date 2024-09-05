%{
	void yyerror(char* s);
	int yylex();
	#include "stdio.h"
	#include "stdlib.h"
	#include "ctype.h"
	#include "string.h"
	void insert_type();
	void insert_value();
	void insert_dimensions();
	void insert_parameters();
	extern int flag=0;
	int insert_flag = 0;

	extern char current_identifier[20];
	extern char current_type[20];
	extern char current_value[20];
    extern char current_function[20];
	extern char previous_operator[20];

%}

%nonassoc IF
%token INT CHAR FLOAT DOUBLE LONG SHORT SIGNED UNSIGNED STRUCT
%token RETURN MAIN
%token VOID
%token WHILE FOR DO 
%token BREAK CONTINUE GOTO
%token ENDIF
%token SWITCH CASE DEFAULT

%token identifier
%token integer_constant string_constant float_constant character_constant

%nonassoc ELSE

%right MOD_EQUAL
%right MULTIPLY_EQUAL DIVIDE_EQUAL
%right ADD_EQUAL SUBTRACT_EQUAL
%right '='

%left OR_OR
%left AND_AND
%left '^'
%left EQUAL NOT_EQUAL
%left LESS_EQUAL LESS GREAT_EQUAL GREAT
%left '+' '-'
%left '*' '/' '%'

%right SIZEOF
%right NOT
%left INCREMENT DECREMENT 


%start begin_parse

%%
begin_parse
			: declarations;

declarations
			: declaration declarations 
			|	
			;

declaration
			: variable_dec 
			| function_dec
			| structure_dec;

structure_dec
			: STRUCT identifier { insert_type(); } '{' structure_content  '}' ';';

structure_content : variable_dec structure_content | ;

variable_dec
			: datatype variables ';' 
			| structure_initialize;

structure_initialize 
			: STRUCT identifier variables;

variables
			: identifier_name multiple_variables;

multiple_variables
			: ',' variables 
			| ;

identifier_name 
			: identifier { insert_type(); } extended_identifier;

extended_identifier : array_identifier | '='{strcpy(previous_operator,"=");} expression ; 

array_identifier
			: '[' array_dims
			| ;

array_dims
			: integer_constant {insert_dimensions();} ']' initilization
			| ']' string_initilization;

initilization
			: string_initilization
			| array_initialization
			| ;

string_initilization
			: '='{strcpy(previous_operator,"=");} string_constant { insert_value(); };

array_initialization
			: '='{strcpy(previous_operator,"=");} '{' array_values '}';

array_values
			: integer_constant multiple_array_values;

multiple_array_values
			: ',' array_values 
			| ;


datatype 
			: INT | CHAR | FLOAT | DOUBLE 
			| LONG long_grammar 
			| SHORT short_grammar
			| UNSIGNED unsigned_grammar 
			| SIGNED signed_grammar
			| VOID ;

unsigned_grammar 
			: INT | LONG long_grammar | SHORT short_grammar | ;

signed_grammar 
			: INT | LONG long_grammar | SHORT short_grammar | ;

long_grammar 
			: INT | ;

short_grammar 
			: INT | ;

function_dec
			: function_datatype function_parameters;

function_datatype
			: datatype identifier '('  {strcpy(current_function,current_identifier); insert_type();};

function_parameters
			: parameters ')' statement;

parameters 
			: datatype all_parameter_identifiers | ;

all_parameter_identifiers 
			: parameter_identifier multiple_parameters;

multiple_parameters
			: ',' parameters 
			| ;

parameter_identifier 
			: identifier { insert_parameters(); insert_type(); } extended_parameter;

extended_parameter
			: '[' ']'
			| ;

statement 
			: expression_statment | multiple_statement 
			| conditional_statements | iterative_statements 
			| return_statement | break_statement 
			| variable_dec;

multiple_statement 
			: '{' statments '}' ;

statments 
			: statement statments
			| ;

expression_statment 
			: expression ';' 
			| ';' ;

conditional_statements 
			: IF '(' simple_expression ')' statement extended_conditional_statements;

extended_conditional_statements
			: ELSE statement
			| ;

iterative_statements 
			: WHILE '(' simple_expression ')' statement 
			| FOR '(' for_initialization simple_expression ';' expression ')' 
			| DO statement WHILE '(' simple_expression ')' ';';

for_initialization
			: variable_dec
			| expression ';'
			| ';' ;

return_statement 
			: RETURN return_suffix;

return_suffix
			: ';' 
			| expression ';' ;

break_statement 
			: BREAK ';' ;

expression 
			: iden expressions
			| simple_expression ;

expressions
			: '='{strcpy(previous_operator,"=");} expression 
			| ADD_EQUAL{strcpy(previous_operator,"+=");} expression 
			| SUBTRACT_EQUAL{strcpy(previous_operator,"-=");} expression 
			| MULTIPLY_EQUAL{strcpy(previous_operator,"*=");} expression 
			| DIVIDE_EQUAL{strcpy(previous_operator,"/=");} expression 
			| MOD_EQUAL{strcpy(previous_operator,"%=");} expression 
			| INCREMENT 
			| DECREMENT ;

simple_expression 
			: and_expression simple_expression_breakup;

simple_expression_breakup 
			: OR_OR and_expression simple_expression_breakup | ;

and_expression 
			: unary_relation_expression and_expression_breakup;

and_expression_breakup
			: AND_AND unary_relation_expression and_expression_breakup
			| ;

unary_relation_expression 
			: NOT unary_relation_expression 
			| regular_expression ;

regular_expression 
			: sum_expression regular_expression_breakup;

regular_expression_breakup
			: relational_operators sum_expression 
			| ;

relational_operators 
			: GREAT_EQUAL{strcpy(previous_operator,">=");}
			| LESS_EQUAL{strcpy(previous_operator,"<=");}
			| GREAT{strcpy(previous_operator,">");} 
			| LESS{strcpy(previous_operator,"<");}
			| EQUAL{strcpy(previous_operator,"==");}
			| NOT_EQUAL{strcpy(previous_operator,"!=");} ;

sum_expression 
			: sum_expression sum_operators term 
			| term ;

sum_operators 
			: '+' 
			| '-' ;

term
			: term multiply_operators factor 
			| factor ;

multiply_operators 
			: '*' | '/' | '%' ;

factor 
			: func | iden ;

iden 
			: identifier 
			| iden extended_iden;

extended_iden
			: '[' expression ']' 
			| '.' identifier;

func 
			: '('{strcpy(previous_operator,"(");} expression ')' 
			| func_call | constant;

func_call
			: identifier '('{strcpy(previous_operator,"(");} arguments ')';

arguments 
			: arguments_list | ;

arguments_list 
			: expression extended_arguments;

extended_arguments
			: ',' expression extended_arguments 
			| ;

constant 
			: integer_constant 	{ insert_value(); } 
			| string_constant	{ insert_value(); } 
			| float_constant	{ insert_value(); } 
			| character_constant{ insert_value(); };

%%

extern FILE *yyin;
extern int yylineno;
extern char *yytext;
void insert_SymbolTable_type(char *,char *);
void insert_SymbolTable_value(char *, char *);
void insert_ConstantTable(char *, char *);
void insert_SymbolTable_arraydim(char *, char *);
void insert_SymbolTable_funcparam(char *, char *);
void printSymbolTable();
void printConstantTable();


int main()
{
	yyin = fopen("test15.c", "r");
	yyparse();

	if(flag == 0)
	{
		printf("VALID PARSE\n");
		printf("%30s SYMBOL TABLE \n", " ");
		printf("%30s %s\n", " ", "------------");
		printSymbolTable();

		printf("\n\n%30s CONSTANT TABLE \n", " ");
		printf("%30s %s\n", " ", "--------------");
		printConstantTable();
	}	
}

void yyerror(char *s)
{
	printf("Line No. : %d %s %s\n",yylineno, s, yytext);
	flag=1;
	printf("INVALID PARSE\n");
}

void insert_type()
{
	insert_SymbolTable_type(current_identifier,current_type);
}

void insert_value()
{	
	if(strcmp(previous_operator, "=") == 0)
	{	insert_SymbolTable_value(current_identifier,current_value);
	}
}	

void insert_dimensions()
{
    insert_SymbolTable_arraydim(current_identifier, current_value);
}

void insert_parameters()
{
    insert_SymbolTable_funcparam(current_function, current_identifier);
}

int yywrap()
{
	return 1;
}