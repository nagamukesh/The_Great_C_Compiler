%{
	void yyerror(char* s);
	int yylex();
	extern int yylineno;
	
	#include "stdio.h"
	#include "stdlib.h"
	#include "ctype.h"
	#include "string.h"

	void ins();
	void insV();

	int flag=0;
	int func_count=0;
	int isreturn=0;
	
	extern char curid[20];
	extern char curtype[20];
	extern char curval[20];

	extern int current_nesting;

	void deletedata (int );
	int checkscope(char*);
	int check_id_is_func(char *);
	void insertST(char*, char*);
	void insertSTnest(char*, int);
	void insertSTparamscount(char*, int);
	int getSTparamscount(char*);
	int check_duplicate(char*);
	int check_declaration(char*, char *);
	int check_params(char*);
	int duplicate(char *s);
	int checkarray(char*);
	char currfunctype[100];
	char currfunc[100];
	char currfunccall[100];
	void insertSTF(char*);
	char gettype(char*,int);
	char getfirst(char*);
	extern int params_count;
	int call_params_count;
	void append_dim(int);
%}

%nonassoc IF
%token INT CHAR FLOAT DOUBLE LONG SHORT SIGNED UNSIGNED 
%token INTs FLOATs CHARs DOUBLEs
%token CONST STRUCT ENUM UNION
%token RETURN MAIN
%token VOID
%token WHILE FOR DO 
%token BREAK
%token ENDIF
%token SWITCH CASE CONTINUE DEFAULT SPREAD
%token AUTO STATIC REGISTER EXTERN VOLATILE INLINE
%token PRINTF SCANF

%token identifier array_identifier func_identifier
%token integer_constant string_constant float_constant character_constant

%nonassoc ELSE

%right leftshift_assignment_operator rightshift_assignment_operator
%right XOR_assignment_operator OR_assignment_operator
%right AND_assignment_operator modulo_assignment_operator
%right multiplication_assignment_operator division_assignment_operator
%right addition_assignment_operator subtraction_assignment_operator
%right assignment_operator

%left OR_operator
%left AND_operator
%left pipe_operator
%left caret_operator
%left amp_operator
%left equality_operator inequality_operator
%left lessthan_assignment_operator lessthan_operator greaterthan_assignment_operator greaterthan_operator
%left leftshift_operator rightshift_operator 
%left add_operator subtract_operator
%left multiplication_operator division_operator modulo_operator

%right SIZEOF
%right tilde_operator exclamation_operator
%left increment_operator decrement_operator 


%start program

%%
program
			: declaration_list;

declaration_list
			: declaration D 

D
			: declaration_list
			| ;

declaration
			: variable_declaration 
			| function_declaration      {func_count++;}
			| structure_definition
            | enum_declaration;

variable_declaration
			: type_specifier variable_declaration_list ';' 
			| storage_classes type_specifier variable_declaration_list ';'
			| storage_classes CONST type_specifier variable_declaration_list ';'
			| CONST type_specifier variable_declaration_list ';'
			| structure_declaration ';';

storage_classes
            : AUTO | STATIC | REGISTER | EXTERN | VOLATILE

variable_declaration_list
			: variable_declaration_list ',' variable_declaration_identifier | variable_declaration_identifier;

variable_declaration_identifier 
			: identifier {if(duplicate(curid)){char msg[1000]; sprintf(msg,"Duplicate decleration of %s",curid); yyerror(msg);}insertSTnest(curid,current_nesting); ins();  } vdi   
			  | array_identifier {if(duplicate(curid)){char msg[1000]; sprintf(msg,"Duplicate decleration of %s",curid); yyerror(msg);}insertSTnest(curid,current_nesting); ins();  } vdi;
			
			

vdi : identifier_array_type | assignment_operator simple_expression  ; 

identifier_array_type
			: '[' initilization_params
			| ;

initilization_params
			: integer_constant {if(atoi(curval)<1){yyerror("Array dimension less than 1");}append_dim($1);} ']' identifier_array_type initilization  
			| subtract_operator integer_constant {yyerror("Array dimension less than 1");append_dim($1);} ']' identifier_array_type initilization  
			| ']' identifier_array_type string_initilization;

initilization
			: string_initilization
			| array_initialization
			| ;

type_specifier 
			: INT | CHAR | FLOAT  | DOUBLE | star_specifier 
			| LONG long_grammar 
			| SHORT short_grammar
			| UNSIGNED unsigned_grammar 
			| SIGNED signed_grammar
			| VOID  ;

star_specifier
			: INTs | CHARs | FLOATs | DOUBLEs ;

unsigned_grammar 
			: INT | LONG long_grammar | SHORT short_grammar | ;

signed_grammar 
			: INT | LONG long_grammar | SHORT short_grammar | ;

long_grammar 
			: INT  | ;

short_grammar 
			: INT | ;

structure_definition
			: struct_or_union identifier { ins(); } '{' V1  '}' ';';

V1 : variable_declaration V1 | ;

structure_declaration 
			: struct_or_union identifier variable_declaration_list;

struct_or_union
            : STRUCT
            | UNION ;

function_declaration
			: function_declaration_type function_declaration_param_statement;

function_declaration_type
			: type_specifier identifier '('  { strcpy(currfunctype, curtype); strcpy(currfunc, curid); check_duplicate(curid); insertSTF(curid); ins(); };

function_declaration_param_statement
			: params ')' statement {if(isreturn==0 && strcmp(currfunctype,"void")){yyerror("Function of non void type does not return");}isreturn=0;};

params 
			: parameters_list
			| VOID   {/*function parameters can be only void keyword, but cannot be smth like void a*/}
			| ;

parameters_list 
			: type_specifier { check_params(curtype); } parameters_identifier_list { insertSTparamscount(currfunc, params_count); };

parameters_identifier_list 
			: param_identifier parameters_identifier_list_breakup;

parameters_identifier_list_breakup
			: ',' parameters_list 
			| ;

param_identifier 
			: identifier { ins();insertSTnest(curid,1); params_count++; } param_identifier_breakup;

param_identifier_breakup
			: '[' ']'
			| ;

statement 
			: expression_statment | compound_statement 
			| conditional_statements | iterative_statements 
			| return_statement | break_statement | continue_statement
			| variable_declaration 
            | switch_case 
			| printf_scanf_statements;

printf_scanf_statements
			: printf_statement ';'
			| scanf_statement ';' 
			;

printf_statement
			: PRINTF '(' printf_parameters ')' ;

scanf_statement
			:  SCANF '(' scanf_parameters ')' ;

printf_parameters
			: printf_parameters ',' expression
			| string_constant;

scanf_parameters
			: scanf_parameters ',' identifier
			| scanf_parameters ',' amp_operator identifier
			| string_constant;

compound_statement 
			: {current_nesting++;} '{'  statment_list  '}' {current_nesting--;}  ;

statment_list 
			: statement statment_list 
			| ;

expression_statment 
			: expression ';' 
			| ';' ;

conditional_statements 
			: IF '(' simple_expression ')' {if($3!=1){yyerror("Condition checking is not of type int");}} statement conditional_statements_breakup;

conditional_statements_breakup
			: ELSE statement
			| ;

iterative_statements 
			: WHILE '(' expression ')' {if($3!=1){yyerror("Condition checking is not of type int");}} statement 
			| FOR '(' variable_declaration_list ';' simple_expression ';' {if($5!=1){yyerror("Condition checking is not of type int");}} expression ')' 
			| FOR '(' type_specifier variable_declaration_list ';' simple_expression ';' {if($6!=1){yyerror("Condition checking is not of type int");}} expression ')' 
			| DO statement WHILE '(' simple_expression ')'{if($5!=1){yyerror("Condition checking is not of type int");}} ';';

return_statement 
			: RETURN ';' {if(strcmp(currfunctype,"void")) {yyerror("Returning void of a non-void function"); isreturn=1;}}
			| RETURN expression ';' { 	if(!strcmp(currfunctype, "void"))
										{ 
											yyerror("Function returns something but is declared void");
										}

										if((currfunctype[0]=='i' || currfunctype[0]=='c') && $2!=1)
										{
											yyerror("Expression doesn't match return type of function");
										}
			              				isreturn=1;
			                     	};

break_statement 
			: BREAK ';' ;

continue_statement 
			: CONTINUE ';' ;

string_initilization
			: assignment_operator string_constant {insV();} ;

array_initialization
			: assignment_operator '{' array_int_declarations '}';

array_int_declarations
			: integer_constant array_int_declarations_breakup;

array_int_declarations_breakup
			: ',' array_int_declarations 
			| ;

expression 
			: mutable assignment_operator expression              {
																	  if($1==1 && $3==1) 
																	  {
			                                                          $$=1;
			                                                          } 
			                                                          else 
			                                                          {$$=-1; yyerror("Type mismatch");} 
			                                                       }
			| mutable addition_assignment_operator expression     {
																	  if($1==1 && $3==1) 
			                                                          $$=1; 
			                                                          else 
			                                                          {$$=-1; yyerror("Type mismatch");} 
			                                                       }
			| mutable subtraction_assignment_operator expression  {
																	  if($1==1 && $3==1) 
			                                                          $$=1; 
			                                                          else 
			                                                          {$$=-1; yyerror("Type mismatch");} 
			                                                       }
			| mutable multiplication_assignment_operator expression {
																	  if($1==1 && $3==1) 
			                                                          $$=1; 
			                                                          else 
			                                                          {$$=-1; yyerror("Type mismatch");} 
			                                                       }
			| mutable division_assignment_operator expression 		{
																	  if($1==1 && $3==1) 
			                                                          $$=1; 
			                                                          else 
			                                                          {$$=-1; yyerror("Type mismatch");} 
			                                                       }
			| mutable modulo_assignment_operator expression 		{
																	  if($1==1 && $3==1) 
			                                                          $$=1; 
			                                                          else 
			                                                          {$$=-1; yyerror("Type mismatch");} 
			                                                       }
			| mutable increment_operator 							{if($1 == 1) $$=1; else $$=-1;}
			| mutable decrement_operator 							{if($1 == 1) $$=1; else $$=-1;}
			| simple_expression {if($1 == 1) $$=1; else $$=-1;}
			;


simple_expression 
			: simple_expression OR_operator and_expression {if($1 == 1 && $3==1) $$=1; else $$=-1;}
			| and_expression {if($1 == 1) $$=1; else $$=-1;};

and_expression 
			: and_expression AND_operator unary_relation_expression {if($1 == 1 && $3==1) $$=1; else $$=-1;}
			  |unary_relation_expression {if($1 == 1) $$=1; else $$=-1;} ;


unary_relation_expression 
			: exclamation_operator unary_relation_expression {if($2==1) $$=1; else $$=-1;} 
			| regular_expression {if($1 == 1) $$=1; else $$=-1;} ;

regular_expression 
			: regular_expression relational_operators sum_expression {if($1 == 1 && $3==1) $$=1; else $$=-1;}
			  | sum_expression {if($1 == 1) $$=1; else $$=-1;} ;
			
relational_operators 
			: greaterthan_assignment_operator | lessthan_assignment_operator | greaterthan_operator 
			| lessthan_operator | equality_operator | inequality_operator ;

sum_expression 
			: sum_expression sum_operators term  {if($1 == 1 && $3==1) $$=1; else $$=-1;}
			| term {if($1 == 1) $$=1; else $$=-1;};

sum_operators 
			: add_operator 
			| subtract_operator ;

term
			: term MULOP factor {if($1 == 1 && $3==1) $$=1; else $$=-1;}
			| factor {if($1 == 1) $$=1; else $$=-1;} ;

MULOP 
			: multiplication_operator | division_operator | modulo_operator ;

factor 
			: immutable {if($1 == 1) $$=1; else $$=-1;} 
			| mutable {if($1 == 1) $$=1; else $$=-1;} ;

mutable 
			: identifier {
						  if(check_id_is_func(curid))
						  {char msg[1000]; sprintf(msg,"%s function name used as an identifier",curid); yyerror(msg);}
			              if(!checkscope(curid))
			              {char msg[1000]; sprintf(msg,"%s Undeclared",curid); yyerror(msg);} 
			              if(!checkarray(curid))
			              {char msg[1000]; sprintf(msg,"%s Array ID has no subscript",curid); yyerror(msg);}
			              if(gettype(curid,0)=='i' || gettype(curid,1)== 'c')
			              $$ = 1;
			              else
			              $$ = -1;
			              }
			| array_identifier {if(!checkscope(curid)){char msg[1000]; sprintf(msg,"%s Undeclared",curid); yyerror(msg);}} '[' expression ']' 
			                   {if(gettype(curid,0)=='i' || gettype(curid,1)== 'c')
			              		$$ = 1;
			              		else
			              		$$ = -1;
			              		}
			| amp_operator identifier;

immutable 
			: '(' expression ')' {if($2==1) $$=1; else $$=-1;}
			| call               {if($1==1) $$=1; else $$=-1;}
			| constant {if($1==1) $$=1; else $$=-1;};

call
			: identifier '('{
			             if(!check_declaration(curid, "Function"))
			             { yyerror("Need to declare function"); $$=-1;} 
			             insertSTF(curid); 
						 strcpy(currfunccall,curid);
						 if($$!=-1)
							$$=1;
			             } arguments ')' 
						 { if( strcmp(currfunccall,"printf") && strcmp(currfunccall,"scanf"))
							{ 
								if(getSTparamscount(currfunccall)!=call_params_count)
								{	
									yyerror("function arguments required does not match the passed arguments...");
									$$=-1;
								}
							} 
							if($$!=-1)
								$$=1;
						 };

arguments 
			: arguments_list | ;

arguments_list 
			: expression { call_params_count++; } A ;

A
			: ',' expression { call_params_count++; } A 
			| ;

constant 
			: integer_constant 	{  insV(); $$=1; } 
			| subtract_operator integer_constant {char newval[256]; sprintf(newval, "-%s", curval); insV(); strcpy(curval,newval); insV(); $$=1;}
			| string_constant	{  insV(); $$=-1;} 
			| float_constant	{  insV(); } 
			| subtract_operator float_constant {char newval[256]; sprintf(newval, "-%s", curval); insV(); strcpy(curval,newval); insV(); $$=1;}
			| character_constant{  insV();$$=1; };

enum_declaration
            : ENUM identifier '{' enum_list '}' ';'
            ;

enum_list
            : enumerator
            | enum_list ',' enumerator ;

enumerator
            : identifier
            | identifier assignment_operator integer_constant
            ;

switch_case
            : SWITCH  '(' identifier ')' '{' case_list '}' ;

case_list
            : case_entry BREAK ';'
            | case_list case_entry BREAK ';'
            ;

case_entry  
            : CASE constant ':' statement
            | CASE constant SPREAD constant':' statement
            | DEFAULT ':' statement
            |
            ;

%%

extern FILE *yyin;
extern char *yytext;
void insertSTtype(char *,char *);
void insertSTvalue(char *, char *);
void incertCT(char *, char *);
void printST();
void printCT();

int main()
{
	yyparse();
	if(func_count==0)
		yyerror("No function declerations");
	else if(strcmp(currfunc,"main")!=0)
		yyerror("main not last function or missing");
	if(flag == 0)
	{
		printf( "PASSED: Semantic Phase\n");
		printf("%30s"  "PRINTING SYMBOL TABLE"  "\n\n", " ");
		printST();
		printf("---------------------------------------------------------------------------------------------------------------");
		printf("\n");
		printf("\n\n%30s"  "PRINTING CONSTANT TABLE"  "\n\n", " ");
		printCT();
		printf("----------------------------------------------");
		printf("\n");
	}
	else
	{
		printf( "FAILED: Semantic Phase Parsing failed\n" );
	}
		

}

void yyerror(char *s)
{
	if(flag==0){
		printf("Error Table:\n");
	}
	printf( "%d %s \n", yylineno, s);
	flag=1;
}

void ins()
{
	insertSTtype(curid,curtype);
}

void insV()
{
	insertSTvalue(curid,curval);
}

int yywrap()
{
	return 1;
}
