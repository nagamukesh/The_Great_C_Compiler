%{
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <float.h>
#include <math.h>

typedef enum { INT_TYPE, FLOAT_TYPE } ValueType;

struct value {
    ValueType type;
    union {
        int i;
        float f;
    } data;
};

struct error {
    const char* message;
    int line_number;
};

struct error error_table[100];  
int error_count = 0;            

void print_error_table();

void yyerror(const char *s);
int yylex();
extern int yylineno;

%}

%union {
    struct value *val; 
    int intval;
    float floatval;
}

%type <val> S E
%token <intval> INT_C
%token <floatval> FLOAT_C 
%token EOL
%token YYEOF
%start S;

%left '+' '-'
%left '*' '/'

%%

S  :  E  ';'   {
                    if(error_count>0){
                        printf("There are errors, so not displaying values\n");
                    }
                    else if($1->type == INT_TYPE) {
                        printf("Output:%d\n",(int)($1->data.i));
                    }
                    else if($1->type == FLOAT_TYPE) {
                        printf("Output:%f\n",(float)($1->data.f));
                    }
                    else{
                        printf("Error in final evaluation\n");
                    }
                }

E  :  E '+' E  {                   
                    $$ = malloc(sizeof(struct value));
                    if ($1->type == INT_TYPE && $3->type == INT_TYPE) {
                        $$->type = INT_TYPE;
                        $$->data.i = $1->data.i + $3->data.i;
                        int sum;
                        if (__builtin_add_overflow($1->data.i, $3->data.i, &sum)) {
                            yyerror("Integer addition overflow detected");
                        }
                    } else if ($1->type == FLOAT_TYPE && $3->type == FLOAT_TYPE) {
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1->data.f + $3->data.f;
                    } else if ($1->type == INT_TYPE && $3->type == FLOAT_TYPE) {
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1->data.i + $3->data.f;
                    } else if ($1->type == FLOAT_TYPE && $3->type == INT_TYPE) {
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1->data.f + $3->data.i;
                    } else {
                        yyerror("Type mismatch in addition");
                    }
                }
    |  E '-' E  {                   
                    $$ = malloc(sizeof(struct value));
                    if ($1->type == INT_TYPE && $3->type == INT_TYPE) {
                        $$->type = INT_TYPE;
                        $$->data.i = $1->data.i - $3->data.i;
                        int sum;
                        if (__builtin_sub_overflow($1->data.i, $3->data.i, &sum)) {
                            yyerror("Integer subtraction overflow detected");
                        }
                    } else if ($1->type == FLOAT_TYPE && $3->type == FLOAT_TYPE) {
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1->data.f - $3->data.f;
                    } else if ($1->type == INT_TYPE && $3->type == FLOAT_TYPE) {
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1->data.i - $3->data.f;
                    } else if ($1->type == FLOAT_TYPE && $3->type == INT_TYPE) {
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1->data.f - $3->data.i;
                    } else {
                        yyerror("Type mismatch in subtraction");
                    }
                }
    |  E '*' E  {                   
                    $$ = malloc(sizeof(struct value));
                    if ($1->type == INT_TYPE && $3->type == INT_TYPE) {
                        $$->type = INT_TYPE;
                        $$->data.i = $1->data.i * $3->data.i;
                        int sum;
                        if (__builtin_mul_overflow($1->data.i, $3->data.i, &sum)) {
                            yyerror("Integer multiplication overflow detected");
                        }
                    } else if ($1->type == FLOAT_TYPE && $3->type == FLOAT_TYPE) {
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1->data.f * $3->data.f;
                    } else if ($1->type == INT_TYPE && $3->type == FLOAT_TYPE) {
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1->data.i * $3->data.f;
                    } else if ($1->type == FLOAT_TYPE && $3->type == INT_TYPE) {
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1->data.f * $3->data.i;
                    } else {
                        yyerror("Type mismatch in multiplication");
                    }
                }
    |  E '/' E  {                   
                    $$ = malloc(sizeof(struct value)); 
                    // Check for dividing by zero
                    if ($3->type == INT_TYPE && $3->data.i == 0) {
                        yyerror("Cannot divide by zero");
                        YYABORT;
                    } else if ($3->type == FLOAT_TYPE && $3->data.f == 0) {
                        yyerror("Cannot divide by zero");
                        YYABORT;
                    } else if ($1->type == INT_TYPE && $3->type == INT_TYPE) {
                        $$->type = INT_TYPE;
                        $$->data.i = $1->data.i / $3->data.i;
                    } else if ($1->type == FLOAT_TYPE && $3->type == FLOAT_TYPE) {
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1->data.f / $3->data.f;
                    } else if ($1->type == INT_TYPE && $3->type == FLOAT_TYPE) {
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1->data.i / $3->data.f;
                    } else if ($1->type == FLOAT_TYPE && $3->type == INT_TYPE) {
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1->data.f / $3->data.i;
                    } else {
                        yyerror("Type mismatch in division");
                    }
                }
    | '(' E ')' {
                    $$ = malloc(sizeof(struct value)); 
                    if ($2->type == INT_TYPE) {
                        $$->type = INT_TYPE;
                        $$->data.i = $2->data.i;
                    } else if ($2->type == FLOAT_TYPE) {
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $2->data.f;
                    }  
                }
    | INT_C     { 
                    $$ = malloc(sizeof(struct value));
                    $$->type = INT_TYPE;
                    $$->data.i = $1;  
                }
    | FLOAT_C   { 
                    $$ = malloc(sizeof(struct value));
                    $$->type = FLOAT_TYPE;
                    $$->data.f = $1;  
                }
    | '-' E     { 
                    $$ = malloc(sizeof(struct value)); 
                    if ($2->type == INT_TYPE) {
                        $$->type = INT_TYPE;
                        $$->data.i = -$2->data.i;
                    } else if ($2->type == FLOAT_TYPE) {
                        $$->type = FLOAT_TYPE;
                        $$->data.f = -$2->data.f;
                    }  
                }
    | INT_C 'e' INT_C {
                        $$ = malloc(sizeof(struct value));
                        $$->type = INT_TYPE;
                        $$->data.i = $1 * pow(10,$3); 
                    }
    | INT_C 'e' FLOAT_C {
                        $$ = malloc(sizeof(struct value));
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1 * pow(10,$3); 
                    }
    | INT_C 'e' '-' INT_C {
                        $$ = malloc(sizeof(struct value));
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1 * pow(10,-$4); 
                    }
    | INT_C 'e' '-' FLOAT_C {
                        $$ = malloc(sizeof(struct value));
                        $$->type = FLOAT_TYPE;
                        $$->data.f = $1 * pow(10,-$4); 
                    }
    ;

%%

void print_error_table(){
    for (int i = 0; i < error_count; i++) {
        printf("Error on line %d: %s\n", error_table[i].line_number, error_table[i].message);
    }
}


void yyerror(const char *msg) {
    if (error_count < 100) {
        error_table[error_count].message = msg;
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
        printf("Errors encountered:\n");
        print_error_table();
    }
    return 0;
}
