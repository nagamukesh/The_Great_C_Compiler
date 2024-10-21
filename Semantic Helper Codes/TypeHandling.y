%{
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <float.h>
#include <math.h>
#include <stdbool.h>
#include <string.h>

typedef enum { ERROR_TYPE, INT_TYPE, FLOAT_TYPE, CHAR_TYPE, BOOL_TYPE } ValueType;

struct value {
    ValueType type;
	int nesting_level;
	char name[100];
};

struct error {
    char message[1000];
    int line_number;
};

struct SymbolRecord {
	char name[100];
	ValueType type;
	int line_number;
	int nesting_level;
}ST[100];
// can uniquely identify each symbol table by (name, nesting_level) pair

int symbol_count=0;
int nesting_level=0;
ValueType current_data_type;
struct error error_table[100];  
int error_count = 0;            
const char* typeString(ValueType type);
ValueType getType(const char *name);
int getLine(const char *name);
void AddSymbol(const char *name, ValueType datatype);
int checkDeclared(const char* name);
int checkDeclaredScope(const char* name);

void print_error_table();

void yyerror(const char *s);
int yylex();
extern int yylineno;
extern char *yytext;

%}

%union {
    struct value *val; 
    int intval;
    float floatval;
	char charval;
	int boolval;
}

%token WHILE BEGINS END GEQ LEQ NEQ DEQ INT CHAR FLOAT BOOL ID NUM FLOAT_LITERAL CHAR_LITERAL BOOL_LITERAL EOL YYEOF
%start S

%type <val> expr cond_stmt arithm_expr params ID1
%right '='
%nonassoc DEQ NEQ
%nonassoc GEQ LEG '>' '<'
%left '+' '-'
%left '*' '/'

%%

S : stmts while_loop stmts
	;

stmts : stmt stmts
	| ;

stmt : var_decl
	| var_init
	;

cond_stmt : expr DEQ expr	{
								$$ = malloc(sizeof(struct value));
								$$->type = BOOL_TYPE;
								$$->nesting_level = nesting_level;
								strcpy($$->name, "condition");
								if($1->type==0 || $3->type==0){}   //error in declaration alr
								else if($1->type!=$3->type)
								{
									char error_msg[1000];
									snprintf(error_msg, sizeof(error_msg), "Cannot compare %s type of %s with %s type of %s", typeString($1->type), $1->name, typeString($3->type), $3->name); 
									yyerror(error_msg);
								}
							}
		| expr NEQ expr		{
								$$ = malloc(sizeof(struct value));
								$$->type = BOOL_TYPE;
								$$->nesting_level = nesting_level;
								strcpy($$->name, "condition");
								if($1->type==0 || $3->type==0){}   //error in declaration alr
								else if($1->type!=$3->type)
								{
									char error_msg[1000];
									snprintf(error_msg, sizeof(error_msg), "Cannot compare %s type of %s with %s type of %s", typeString($1->type), $1->name, typeString($3->type), $3->name); 
									yyerror(error_msg);
								}
							}
		| expr GEQ expr		{
								$$ = malloc(sizeof(struct value));
								$$->type = BOOL_TYPE;
								$$->nesting_level = nesting_level;
								strcpy($$->name, "condition");
								if($1->type==0 || $3->type==0){}   //error in declaration alr
								else if($1->type!=$3->type)
								{
									char error_msg[1000];
									snprintf(error_msg, sizeof(error_msg), "Cannot compare %s type of %s with %s type of %s", typeString($1->type), $1->name, typeString($3->type), $3->name); 
									yyerror(error_msg);
								}
							}
		| expr LEQ expr		{
								$$ = malloc(sizeof(struct value));
								$$->type = BOOL_TYPE;
								$$->nesting_level = nesting_level;
								strcpy($$->name, "condition");
								if($1->type==0 || $3->type==0){}   //error in declaration alr
								else if($1->type!=$3->type)
								{
									char error_msg[1000];
									snprintf(error_msg, sizeof(error_msg), "Cannot compare %s type of %s with %s type of %s", typeString($1->type), $1->name, typeString($3->type), $3->name); 
									yyerror(error_msg);
								}
							}
		| expr '>' expr		{
								$$ = malloc(sizeof(struct value));
								$$->type = BOOL_TYPE;
								$$->nesting_level = nesting_level;
								strcpy($$->name, "condition");
								if($1->type==0 || $3->type==0){}   //error in declaration alr
								else if($1->type!=$3->type)
								{
									char error_msg[1000];
									snprintf(error_msg, sizeof(error_msg), "Cannot compare %s type of %s with %s type of %s", typeString($1->type), $1->name, typeString($3->type), $3->name); 
									yyerror(error_msg);
								}
							}
		| expr '<' expr		{
								$$ = malloc(sizeof(struct value));
								$$->type = BOOL_TYPE;
								$$->nesting_level = nesting_level;
								strcpy($$->name, "condition");
								if($1->type==0 || $3->type==0){}   //error in declaration alr
								else if($1->type!=$3->type)
								{
									char error_msg[1000];
									snprintf(error_msg, sizeof(error_msg), "Cannot compare %s type of %s with %s type of %s", typeString($1->type), $1->name, typeString($3->type), $3->name); 
									yyerror(error_msg);
								}
							}
		;

expr: ID			{
						$$ = malloc(sizeof(struct value));
						$$->nesting_level = nesting_level;
						// must be declared before itself, else cant use for cond_stmt or arithm_expr
						if(checkDeclared(yytext))
						{
							$$->type = getType(yytext);	
						}
						else
						{
							char error_msg[1000];
							snprintf(error_msg, sizeof(error_msg), "%s not declared in scope", yytext); 
							yyerror(error_msg);
						}
						strcpy($$->name,yytext);
					}		
	| NUM			{
						$$ = malloc(sizeof(struct value));
						$$->type = INT_TYPE;
						$$->nesting_level = nesting_level;
						strcpy($$->name,yytext);
					}
	| FLOAT_LITERAL {
						$$ = malloc(sizeof(struct value));
						$$->type = FLOAT_TYPE;
						$$->nesting_level = nesting_level;
						strcpy($$->name,yytext);
					}
	| CHAR_LITERAL	{
						$$ = malloc(sizeof(struct value));
						$$->type = CHAR_TYPE;
						$$->nesting_level = nesting_level;
						strcpy($$->name,yytext);
					}
	| BOOL_LITERAL  {
						$$ = malloc(sizeof(struct value));
						$$->type = BOOL_TYPE;
						$$->nesting_level = nesting_level;
						strcpy($$->name,yytext);
					}
	;

var_decl : datatype params;

datatype : INT		{current_data_type=INT_TYPE;}
		| CHAR		{current_data_type=CHAR_TYPE;}
		| FLOAT		{current_data_type=FLOAT_TYPE;}	
		| BOOL		{current_data_type=BOOL_TYPE;}
		;

params: ID1 more_params ';'	{
								//check if symbol is already declared in current scope
								if(!checkDeclaredScope($1->name))
								{
									AddSymbol($1->name,current_data_type);
									$1->nesting_level = nesting_level;
								}
								else
								{
									char error_msg[1000];
									snprintf(error_msg, sizeof(error_msg), "%s already declared in this scope in line %d", $1->name, getLine($1->name)); 
									yyerror(error_msg);
									$1->type=ERROR_TYPE;
								}
							}
	;

more_params: ',' ID1	{
							//check if symbol is already declared in current scope
							if(!checkDeclaredScope($2->name))
							{
								AddSymbol($2->name,current_data_type);
								$2->nesting_level = nesting_level;
							}
							else
							{
								char error_msg[1000];
								snprintf(error_msg, sizeof(error_msg), "%s already declared in this scope in line %d", $2->name, getLine($2->name)); 
								yyerror(error_msg);
								$2->type=ERROR_TYPE;
							}
						}
		| 
		;

var_init : ID1 '=' arithm_expr ';' {
										//first check if ID is declared
										if(checkDeclared($1->name)){}
										else
										{
											char error_msg[1000];
											snprintf(error_msg, sizeof(error_msg), "%s not declared in scope", yytext); 
											yyerror(error_msg);

										}
										$1->type = getType($1->name);
										//next check if ID1 and arithm_expr have the same datatype
										if($3->type==0 || $1->type==0){}  //ignore if there were alr type mismatch errors
										else if($1->type!=$3->type)
										{
											char error_msg[1000];
											snprintf(error_msg, sizeof(error_msg), "Assigning %s of type %s a value of type %s", $1->name, typeString($1->type), typeString($3->type)); 
											yyerror(error_msg);
										}
								}
		;

ID1 : ID {
			$$ = malloc(sizeof(struct value));
			strcpy($$->name,yytext);
		}  
	;

arithm_expr : expr '+' expr	{
								$$ = malloc(sizeof(struct value));
								$$->nesting_level = nesting_level;
								strcpy($$->name, "condition");
								if($1->type==0 || $3->type==0){}   //error in declaration alr
								else if($1->type!=$3->type)
								{
									char error_msg[1000];
									//printf("%s\n%s\n%s\n%s\n", typeString($1->type), $1->name, typeString($3->type), $3->name);
									snprintf(error_msg, sizeof(error_msg), "Cannot add %s type of %s with %s type of %s", typeString($1->type), $1->name, typeString($3->type), $3->name); 
									yyerror(error_msg);
									$$->type=ERROR_TYPE;
								}
								else{
									$$->type=$1->type;
								}
								char newname[1000];
								strcpy(newname, $1->name);
								strcat(newname, "+");
								strcat(newname, $3->name);
								strcpy($$->name, newname);
							}
			| expr '-' expr	{
								$$ = malloc(sizeof(struct value));
								$$->nesting_level = nesting_level;
								strcpy($$->name, "condition");
								if($1->type==0 || $3->type==0){}   //error in declaration alr
								else if($1->type!=$3->type)
								{
									char error_msg[1000];
									snprintf(error_msg, sizeof(error_msg), "Cannot subtract %s type of %s with %s type of %s", typeString($1->type), $1->name, typeString($3->type), $3->name); 
									yyerror(error_msg);
									$$->type=ERROR_TYPE;
								}
								else{
									$$->type=$1->type;
								}
								char newname[1000];
								strcpy(newname, $1->name);
								strcat(newname, "-");
								strcat(newname, $3->name);
								strcpy($$->name, newname);
							}
			| expr '*' expr {
								$$ = malloc(sizeof(struct value));
								$$->type = BOOL_TYPE;
								$$->nesting_level = nesting_level;
								strcpy($$->name, "condition");
								if($1->type==0 || $3->type==0){}   //error in declaration alr
								else if($1->type!=$3->type)
								{
									char error_msg[1000];
									snprintf(error_msg, sizeof(error_msg), "Cannot multiply %s type of %s with %s type of %s", typeString($1->type), $1->name, typeString($3->type), $3->name); 
									yyerror(error_msg);
									$$->type=ERROR_TYPE;
								}
								else{
									$$->type=$1->type;
								}
								char newname[1000];
								strcpy(newname, $1->name);
								strcat(newname, "*");
								strcat(newname, $3->name);
								strcpy($$->name, newname);
							}
			| expr '/' expr {
								$$ = malloc(sizeof(struct value));
								$$->type = BOOL_TYPE;
								$$->nesting_level = nesting_level;
								strcpy($$->name, "condition");
								if($1->type==0 || $3->type==0){}   //error in declaration alr
								else if($1->type!=$3->type)
								{
									char error_msg[1000];
									snprintf(error_msg, sizeof(error_msg), "Cannot divide %s type of %s with %s type of %s", typeString($1->type), $1->name, typeString($3->type), $3->name); 
									yyerror(error_msg);
									$$->type=ERROR_TYPE;
								}
								else{
									$$->type=$1->type;
								}
								char newname[1000];
								strcpy(newname, $1->name);
								strcat(newname, "/");
								strcat(newname, $3->name);
								strcpy($$->name, newname);
							}
			| expr			{
								$$ = malloc(sizeof(struct value));
								$$->type = $1->type;
								$$->nesting_level = nesting_level;
								strcpy($$->name,$1->name);
							}
			;

while_loop : WHILE '(' cond_stmt ')' while_content
			;

while_content : while_start stmts while_end 
			;

while_start : BEGINS           {nesting_level++;}
			;

while_end : END					{nesting_level--;}           
			;


%%

void AddSymbol(const char *name, ValueType datatype){
	if(symbol_count>100)
	{
		yyerror("Symbol Stack Overflow");
		return;
	}
	strcpy(ST[symbol_count].name, name);
	ST[symbol_count].type = datatype;
	ST[symbol_count].line_number = yylineno;
	ST[symbol_count].nesting_level = nesting_level;
	symbol_count++;
}

void PrintSymbolTable(){
	printf("Symbol Table:\n");
	printf("--------------------------------------------------------------\n");
	printf("|  Symbol Name       | datatype  |  lineno  |  nesting_level |\n");
	printf("--------------------------------------------------------------\n");
    for (int i = 0; i < symbol_count; i++) {
        printf("|%-20s|%11s|%10d|%16d|\n",ST[i].name, typeString(ST[i].type), ST[i].line_number, ST[i].nesting_level);
		printf("--------------------------------------------------------------\n");
    }
}

int checkDeclaredScope(const char *name) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(ST[i].name, name) == 0 && nesting_level==ST[i].nesting_level) {
            return 1;  
        }
    }
    return 0;  
}

int checkDeclared(const char *name) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(ST[i].name, name) == 0 && nesting_level==ST[i].nesting_level) {
            return 1;  
        }
    }
	if(nesting_level==1)
	{
		//check if it is declared in the global scope
		for (int i = 0; i < symbol_count; i++) {
			if (strcmp(ST[i].name, name) == 0 && ST[i].nesting_level==0) {
				return 1;  
			}
		}
	}
    return 0;  
}

ValueType getType(const char *name) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(ST[i].name, name) == 0 && nesting_level==ST[i].nesting_level) {
            return ST[i].type;  
        }
    }
	if(nesting_level==1)
	{
		//check if it is declared in the global scope
		for (int i = 0; i < symbol_count; i++) {
			if (strcmp(ST[i].name, name) == 0 && ST[i].nesting_level==0) {
				return ST[i].type;
			}
		}
	}
    return ERROR_TYPE;  
}

int getLine(const char *name){
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(ST[i].name, name) == 0 && nesting_level==ST[i].nesting_level) {
            return ST[i].line_number;  
        }
    }
	if(nesting_level==1)
	{
		//check if it is declared in the global scope
		for (int i = 0; i < symbol_count; i++) {
			if (strcmp(ST[i].name, name) == 0 && ST[i].nesting_level==0) {
				return ST[i].line_number;
			}
		}
	}
    return -1;  
}

const char* typeString(ValueType type) {
    switch(type) {
        case INT_TYPE:
            return "int";
        case FLOAT_TYPE:
            return "float";
        case CHAR_TYPE:
            return "char";
        case BOOL_TYPE:
            return "bool";
        case ERROR_TYPE:
            return "error";
        default:
            return "unknown";
    }
}

void print_error_table(){
	printf("------------------------------------------------------------------------\n");
	printf("| Error                                                      | lineno  |\n");
	printf("------------------------------------------------------------------------\n");
    for (int i = 0; i < error_count; i++) {
        printf("|%-60s|%9d|\n", error_table[i].message, error_table[i].line_number);
		printf("------------------------------------------------------------------------\n");
    }
	
}

void yyerror(const char *msg) {
	//printf("%s--%d--%d\n",msg,error_count,yylineno);
    if (error_count < 100) {
        strcpy(error_table[error_count].message,msg);
        error_table[error_count].line_number = yylineno;
        error_count++;
    }
}


int main() {
    if (yyparse() == 0) {
        printf("Parsed successfully.\n");
    } else {
        printf("Failed to parse the expression.\n");
    }
    if (error_count > 0) {
        printf("Error Table:\n");
        print_error_table();
    }
	PrintSymbolTable();
    return 0;
}
