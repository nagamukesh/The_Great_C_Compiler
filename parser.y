%{
	void yyerror(char* s);
	int yylex();
	#include "stdio.h"
	#include "stdlib.h"
	#include "ctype.h"
	#include "string.h"
	void insert_type();
	void insert_class();
	void insert_value();
	void insert_dimensions();
	void insert_pdl(int pdl);
	void insert_parameters();
	extern int flag=0;
	int insert_flag = 0;
	int pdl;

	extern char current_identifier[20];
	extern char current_type[20];
	extern char current_value[20];
        extern char current_function[20];
	extern char previous_operator[20];

%}

%union {
    char* string;
}

%token IDENTIFIER

%nonassoc IF
%token INT CHAR FLOAT DOUBLE LONG SHORT SIGNED UNSIGNED STRUCT
%token RETURN MAIN
%token VOID
%token WHILE FOR DO 
%token BREAK CONTINUE GOTO
%token ENDIF
%token SWITCH CASE DEFAULT 
%token AUTO CONST BOOL STATIC TYPEDEF UNION VOLATILE

%token integer_constant string_constant float_constant character_constant
%token RIGHT_ASSIGN LEFT_ASSIGN AND_ASSIGN XOR_ASSIGN OR_ASSIGN 
%token RIGHT_OP LEFT_OP PTR_OP

%nonassoc ELSE

%right MOD_EQUAL
%right MUL_EQUAL DIV_EQUAL
%right ADD_EQUAL SUB_EQUAL
%right '='

%left OR_OP
%left AND_OP

%left '^'
%left EQUAL NOT_EQUAL
%left LESSER_EQUAL LESSER GREATER_EQUAL GREATER
%left '+' '-'
%left '*' '/' '%'

%right SIZEOF
%right NOT
%left INCREMENT DECREMENT 


%start state

%%
state
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
			: STRUCT IDENTIFIER { insert_type(); insert_class(0);} '{' structure_content  '}' ';';

structure_content : variable_dec structure_content | ;

variable_dec
			: datatype variables ';' 
			| structure_initialize;

structure_initialize 
			: STRUCT IDENTIFIER variables;

variables
			: identifier_name multiple_variables;

multiple_variables
			: ',' variables 
			| ;

identifier_name 
			: IDENTIFIER { insert_type(); insert_class(2);} extended_identifier;

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
            : function_name '(' parameters ')'  function_data;

function_name: datatype IDENTIFIER{strcpy(current_function,current_identifier);insert_class(1);};

function_data:'{' statments '}'   {insert_pdl(0);}
		| {insert_pdl(1);};

parameters
            : datatype all_parameter_identifiers
            | /* empty */  ;  // Allow no parameters


all_parameter_identifiers 
			: parameter_identifier multiple_parameters;

multiple_parameters
			: ',' parameters 
			| ;

parameter_identifier 
			: IDENTIFIER { insert_parameters(); insert_type(); } extended_parameter;

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
			| SUB_EQUAL{strcpy(previous_operator,"-=");} expression 
			| MUL_EQUAL{strcpy(previous_operator,"*=");} expression 
			| DIV_EQUAL{strcpy(previous_operator,"/=");} expression 
			| MOD_EQUAL{strcpy(previous_operator,"%=");} expression 
			| INCREMENT 
			| DECREMENT ;

simple_expression 
			: and_expression simple_expression_breakup;

simple_expression_breakup 
			: OR_OP and_expression simple_expression_breakup | ;

and_expression 
			: unary_relation_expression and_expression_breakup;

and_expression_breakup
			: AND_OP unary_relation_expression and_expression_breakup
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
			: GREATER_EQUAL{strcpy(previous_operator,">=");}
			| LESSER_EQUAL{strcpy(previous_operator,"<=");}
			| GREATER{strcpy(previous_operator,">");} 
			| LESSER{strcpy(previous_operator,"<");}
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
			: IDENTIFIER 
			| iden extended_iden;

extended_iden
			: '[' expression ']' 
			| '.' IDENTIFIER;

func 
			: '('{strcpy(previous_operator,"(");} expression ')' 
			| func_call | constant;

func_call
			: IDENTIFIER '('{strcpy(previous_operator,"(");insert_class(1);} arguments ')' ;

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
void insert_SymbolTable_class(char *,int);
void insert_SymbolTable_value(char *, char *);
void insert_ConstantTable(char *, char *);
void insert_SymbolTable_arraydim(char *, char *);
void insert_SymbolTable_pdl(char *, int);
void insert_SymbolTable_funcparam(char *, char *);
void printSymbolTable();
void printConstantTable();
void printSymbolDataLine();

int main()
{
	yyin = fopen("test12.c", "r");
	yyparse();
	if(flag==0) printf("VALID PARSE\n");
	printf("\n");
        printf("%30s SYMBOL TABLE \n", " ");
        printf("%1s %s\n", " ", "--------------------------------------------------------------------------------------------");
        printSymbolTable();
        printf("%1s %s\n", " ", "--------------------------------------------------------------------------------------------");
        printf("\n\n%20s CONSTANT TABLE \n", " ");
        printf("%1s %s\n", " ", "-------------------------------------------");
        printConstantTable();
       	printf("%1s %s\n\n", " ", "-------------------------------------------");
	char c;
	printf("Print the symbol, data type and line number? [y/n]: ");
	scanf("%c", &c);
	if(c=='y'){
		printf("\n");
		printf("%1s %s\n", " ", "-------------------------------------");
		printSymbolDataLine();
		printf("%1s %s\n\n", " ", "-------------------------------------");
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

void insert_class(int a){
	insert_SymbolTable_class(current_identifier,a);
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

void insert_pdl(int pdl)
{
    insert_SymbolTable_pdl(current_function, pdl);
}

void insert_parameters()
{
    insert_SymbolTable_funcparam(current_function, current_identifier);
}

int yywrap()
{
	return 1;
}
