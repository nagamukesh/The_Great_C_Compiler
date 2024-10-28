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
	
	extern int return_stat_val;
	
	extern char curid[20];
	extern char curtype[20];
	extern char curval[20];

	extern int current_nesting;
	extern int checking_val;

	void deletedata (int );
	int checkscope(char*);
	int check_id_is_func(char *);
	void insertST(char*, char*);
	void type_check_2(char *);
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
	
	
	struct node* mknode(struct node *child1, struct node *child2, struct node *child3, struct node *child4, struct node *child5, struct node *child6, struct node *child7, struct node *child8, struct node *child9, struct node *child10, char *token);
	
	struct node *head;
    	struct node { 
		struct node *child1; 
		struct node *child2;
		struct node *child3; 
		struct node *child4; 
		struct node *child5;
		struct node *child6; 
		struct node *child7;
		struct node *child8;
		struct node *child9; 
		struct node *child10; 
		char *token; 
    	};
    	
    	struct queueNode {
    		struct node *treeNode;
    		struct queueNode *next;
	};

	struct queue {
    		struct queueNode *front;
    		struct queueNode *rear;
	};

	void enqueue(struct queue *q, struct node *treeNode) {
    		struct queueNode *newNode = (struct queueNode *)malloc(sizeof(struct queueNode));
    		newNode->treeNode = treeNode;
    		newNode->next = NULL;
    		if (q->rear == NULL) {
        		q->front = q->rear = newNode;
    		} else {
       	 	q->rear->next = newNode;
        	q->rear = newNode;
    	}
	}

	struct node *dequeue(struct queue *q) {
    		if (q->front == NULL) {
       	 		return NULL;
    		}
    		struct queueNode *temp = q->front;
    		struct node *treeNode = temp->treeNode;
    		q->front = q->front->next;
    		if (q->front == NULL) {
        		q->rear = NULL;
    		}
    		free(temp);
    		return treeNode;
	}

	int isEmpty(struct queue *q) {
    		return q->front == NULL;
	}

	void levelOrderTraversal(struct node *root) {
    		if (root == NULL) return;

		struct queue q;
		q.front = q.rear = NULL;

    		enqueue(&q, root);
    		int level = 1;  // Keep track of the level

    		while (!isEmpty(&q)) {
        		int levelSize = 0;  // Number of nodes at the current level
        		struct queueNode *current = q.front;

        		// Count nodes at the current level
        		while (current != NULL) {
            			levelSize++;
            			current = current->next;
        		}
	
        		printf("Level - %d : ", level);
        		for (int i = 0; i < levelSize; i++) {
        		    	struct node *currentNode = dequeue(&q);
        		    	printf("%s ", currentNode->token);
		
		            	// Enqueue child nodes	
		            	if (currentNode->child1 != NULL) {
        			    enqueue(&q, currentNode->child1);
       			    	}
        	    	    	if (currentNode->child2 != NULL) {
        	        	    enqueue(&q, currentNode->child2);
        	    		}
        	    		if (currentNode->child3 != NULL) {
        	        		enqueue(&q, currentNode->child3);
       		     		}
       		     		if (currentNode->child4 != NULL) {
        			    enqueue(&q, currentNode->child4);
       			    	}
        	    	    	if (currentNode->child5 != NULL) {
        	        	    enqueue(&q, currentNode->child5);
        	    		}
        	    		if (currentNode->child6 != NULL) {
        	        		enqueue(&q, currentNode->child6);
       		     		}
       		     		if (currentNode->child7 != NULL) {
        			    enqueue(&q, currentNode->child7);
       			    	}
        		}
        		printf("\n");  // New line after each level
        		level++;  // Move to the next level
    		}
	}

%}


%union { 
	struct var_name { 
		int value;
		char name[100]; 
		struct node* nd;
	} nd_obj; 
} 

%nonassoc <nd_obj> IF
%token <nd_obj> INT CHAR FLOAT DOUBLE LONG SHORT SIGNED UNSIGNED 
%token <nd_obj> INTs FLOATs CHARs DOUBLEs
%token <nd_obj> CONST STRUCT ENUM UNION
%token <nd_obj> RETURN MAIN
%token <nd_obj> VOID
%token <nd_obj> WHILE FOR DO 
%token <nd_obj> BREAK
%token <nd_obj> ENDIF
%token <nd_obj> SWITCH CASE CONTINUE DEFAULT SPREAD
%token <nd_obj> AUTO STATIC REGISTER EXTERN VOLATILE INLINE
%token <nd_obj> PRINTF SCANF 

%token <nd_obj> SEMI_COLON COLON OPEN_CURLY CLOSE_CURLY OPEN_SQR CLOSE_SQR OPEN_BRACE CLOSE_BRACE DOT COMMA 

%token <nd_obj> IDENTIFIER ARRAY_IDENTIFIER FUNC_IDENTIFIER
%token <nd_obj> INTEGER_CONSTANT STRING_CONSTANT FLOAT_CONSTANT CHARACTER_CONSTANT

%nonassoc <nd_obj> ELSE

%right <nd_obj> LEFTSHIFT_ASSIGNMENT_OPERATOR RIGHTSHIFT_ASSIGNMENT_OPERATOR 
%right <nd_obj> XOR_ASSIGNMENT_OPERATOR OR_ASSIGNMENT_OPERATOR 
%right <nd_obj> AND_ASSIGNMENT_OPERATOR MODULO_ASSIGNMENT_OPERATOR
%right <nd_obj> MULTIPLICATION_ASSIGNMENT_OPERATOR DIVISION_ASSIGNMENT_OPERATOR
%right <nd_obj> ADDITION_ASSIGNMENT_OPERATOR SUBTRACTION_ASSIGNMENT_OPERATOR

%right <nd_obj> ASSIGNMENT_OPERATOR
%left <nd_obj> OR_OPERATOR
%left <nd_obj> AND_OPERATOR
%left <nd_obj> PIPE_OPERATOR
%left <nd_obj> CARET_OPERATOR
%left <nd_obj> AMP_OPERATOR

%left <nd_obj> EQUALITY_OPERATOR INEQUALITY_OPERATOR
%left <nd_obj> LESSTHAN_ASSIGNMENT_OPERATOR LESSTHAN_OPERATOR GREATERTHAN_ASSIGNMENT_OPERATOR GREATERTHAN_OPERATOR
%left <nd_obj> LEFTSHIFT_OPERATOR RIGHTSHIFT_OPERATOR 
%left <nd_obj> ADD_OPERATOR SUBTRACT_OPERATOR
%left <nd_obj> MULTIPLICATION_OPERATOR DIVISION_OPERATOR MODULO_OPERATOR

%right <nd_obj> SIZEOF
%right <nd_obj> TILDE_OPERATOR EXCLAMATION_OPERATOR
%left <nd_obj> INCREMENT_OPERATOR DECREMENT_OPERATOR 

%type <nd_obj> program declaration_list D declaration variable_declaration storage_classes variable_declaration_list variable_declaration_identifier vdi identifier_array_type initilization_params
%type <nd_obj> initilization type_specifier star_specifier unsigned_grammar signed_grammar long_grammar short_grammar structure_definition V1 structure_declaration struct_or_union function_declaration
%type <nd_obj> function_declaration_type function_declaration_param_statement params parameters_list parameters_identifier_list parameters_identifier_list_breakup param_identifier param_identifier_breakup
%type <nd_obj> statement printf_scanf_statements printf_statement scanf_statement printf_parameters scanf_parameters compound_statement statment_list expression_statment conditional_statements 
%type <nd_obj> conditional_statements_breakup iterative_statements return_statement break_statement continue_statement string_initilization array_initialization array_int_declarations 
%type <nd_obj> array_int_declarations_breakup expression simple_expression and_expression unary_relation_expression regular_expression relational_operators sum_expression sum_operators term MULOP factor 
%type <nd_obj> mutable immutable call arguments arguments_list A constant enum_declaration enum_list enumerator switch_case case_list case_entry
%%
program
			: declaration_list
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "program");
                        	head=$$.nd;
			}
			;

declaration_list
			: declaration D 
			{
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "declaration_list");
			}
			;

D
			: declaration_list
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "D");
			}
			| 
			{
				$$.nd = NULL; 
			}
			;

declaration
			: variable_declaration 
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "declaration");
			}
			| function_declaration      {func_count++;}
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "declaration");
			}
			| structure_definition
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "declaration");
			}
            		| enum_declaration
            		{
            			$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "declaration");
            		}
            		;

variable_declaration
			: type_specifier variable_declaration_list SEMI_COLON 
			{
				$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "variable_declaration");
			}
			| storage_classes type_specifier variable_declaration_list SEMI_COLON
			{
				$4.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, NULL, NULL, NULL, NULL, NULL, NULL, "variable_declaration");
			}
			| storage_classes CONST type_specifier variable_declaration_list SEMI_COLON
			{
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CONST");
				$5.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, $5.nd, NULL, NULL, NULL, NULL, NULL, "variable_declaration");
			}
			| CONST type_specifier variable_declaration_list SEMI_COLON
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CONST");
				$4.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, NULL, NULL, NULL, NULL, NULL, NULL, "variable_declaration");
			}
			| structure_declaration SEMI_COLON
			{
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "variable_declaration");
			}
			;

storage_classes
   			: AUTO
   			{
   				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "AUTO");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "storage_classes");
   			} 
   			| STATIC 
   			{
   				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "STATIC");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "storage_classes");
   			}
   			| REGISTER
   			{
   				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "REGISTER");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "storage_classes");
   			} 
   			| EXTERN 
   			{
   				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "EXTERN");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "storage_classes");
   			}
   			| VOLATILE
   			{
   				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "VOLATILE");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "storage_classes");
   			}
   			;

variable_declaration_list
			: variable_declaration_list COMMA variable_declaration_identifier
			{
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "COMMA");
   				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "variable_declaration_list");
			} 
			| variable_declaration_identifier
			{
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "variable_declaration_list");
			}
			;

variable_declaration_identifier 
			: IDENTIFIER {type_check_2(curtype);if(duplicate(curid)){char msg[1000];sprintf(msg,"Duplicate decleration of %s",curid); yyerror(msg);}ins();} vdi
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "IDENTIFIER");
   				$$.nd=mknode($1.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "variable_declaration_identifier");
			}   
			| ARRAY_IDENTIFIER {if(duplicate(curid)){char msg[1000]; sprintf(msg,"Duplicate decleration of %s",curid); yyerror(msg);} ins();  } vdi
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "ARRAY_IDENTIFIER");
				$$.nd=mknode($1.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "variable_declaration_identifier");
			}
			;
			
			

vdi : identifier_array_type
    {
    	$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "vdi");
    }
    | ASSIGNMENT_OPERATOR simple_expression  
    {
    	$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "ASSIGNMENT_OPERATOR");
    	$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "vdi");
    }
    ; 

identifier_array_type
			: OPEN_SQR initilization_params
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_SQR");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "IDENTIFIER_array_type");
			}
			| 
			{
				$$.nd = NULL; 
			}
			;

initilization_params
			: INTEGER_CONSTANT {if(atoi(curval)<1){yyerror("Array dimension less than 1");}append_dim($1.value);} CLOSE_SQR identifier_array_type initilization  
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "INTEGER_CONSTANT");
				$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_SQR");
				$$.nd=mknode($1.nd, $3.nd, $4.nd, $5.nd, NULL, NULL, NULL, NULL, NULL, NULL, "IDENTIFIER_array_type");
			}
			| CLOSE_SQR identifier_array_type string_initilization
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_SQR");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "IDENTIFIER_array_type");
			}
			;

initilization
			: string_initilization
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "initialization");
			}
			| array_initialization
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "initialization");
			}
			| 
			{
				$$.nd = NULL; 
			}
			;

type_specifier 
			: INT 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "INT");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "type_specifier");
			}
			| CHAR 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CHAR");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "type_specifier");
			}
			| FLOAT  
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "FLOAT");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "type_specifier");
			}
			| DOUBLE 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "DOUBLE");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "type_specifier");
			}
			| star_specifier 
			{
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "type_specifier");
			}
			| LONG long_grammar 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "LONG");
   				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "type_specifier");
			}
			| SHORT short_grammar
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SHORT");
   				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "type_specifier");
			}
			| UNSIGNED unsigned_grammar 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "UNSIGNED");
   				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "type_specifier");
			}
			| SIGNED signed_grammar
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SIGNED");
   				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "type_specifier");
			}
			| VOID  
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "VOID");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "type_specifier");
			}
			;

star_specifier
			: INTs 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "INTs");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "star_specifier");
			}
			| CHARs 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CHARs");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "star_specifier");
			}
			| FLOATs 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "FLOATs");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "star_specifier");
			}
			| DOUBLEs 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "DOUBLEs");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "star_specifier");
			}
			;

unsigned_grammar 
			: INT 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "INT");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "unsigned_grammar");
			}
			| LONG long_grammar 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "LONG");
   				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "unsigned_grammar");
			}
			| SHORT short_grammar 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SHORT");
   				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "unsigned_grammar");
			}
			| 
			{
				$$.nd = NULL; 
			}
			;

signed_grammar 
			: INT 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "INT");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "signed_grammar");
			}
			| LONG long_grammar 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "LONG");
   				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "signed_grammar");
			}
			| SHORT short_grammar 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SHORT");
   				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "signed_grammar");
			}
			| 
			{
				$$.nd = NULL; 
			}
			;

long_grammar 
			: INT 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "INT");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "long_grammar");
			} 
			| 
			{
				$$.nd = NULL; 
			}
			;

short_grammar 
			: INT 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "INT");
   				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "short_grammar");
			}
			| 
			{
				$$.nd = NULL; 
			}
			;

structure_definition
			: struct_or_union IDENTIFIER { ins(); } OPEN_CURLY V1 CLOSE_CURLY SEMI_COLON
			{
				$4.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_CURLY");
				$6.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_CURLY");
				$7.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
   				$$.nd=mknode($1.nd, $2.nd, $4.nd, $5.nd, $6.nd, $7.nd, NULL, NULL, NULL, NULL, "structure_definition");
			}
			;

V1 : variable_declaration V1 
   {
   	$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "V1");
   }
   | 
   {
   	$$.nd = NULL;
   }
   ;

structure_declaration 
			: struct_or_union IDENTIFIER variable_declaration_list
			{
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "IDENTIFIER");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "structure_declaration");
			}
			;

struct_or_union
            : STRUCT
            {
            	$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "STRUCT");
   		$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "struct_or_union");
            }
            | UNION 
            {
            	$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "UNION");
   		$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "struct_or_union");
            }
            ;

function_declaration
			: function_declaration_type function_declaration_param_statement
			{
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "function_declaration");
			}
			;

function_declaration_type
			: type_specifier IDENTIFIER OPEN_BRACE  { strcpy(currfunctype, curtype);  strcpy(currfunc, curid); check_duplicate(curid); insertSTF(curid); ins(); }
			{
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "IDENTIFIER");
				$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_BRACE");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "function_declaration_type");
			}
			;

function_declaration_param_statement
			: params CLOSE_BRACE statement 
			{
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_BRACE");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "function_declaration_param_statement");
				if(strcmp(currfunctype,"void")){
					if(isreturn==0){
						yyerror("Function of non void type does not return");
					}
				}
			}
			;

params 
			: parameters_list
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "params");
			}
			| VOID
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "VOID");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "params");
			}
			| 
			{
				$$.nd = NULL; 
			}
			;

parameters_list 
			: type_specifier { check_params(curtype); } parameters_identifier_list { insertSTparamscount(currfunc, params_count); }
			{
				$$.nd=mknode($1.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "parameters_list");
			}
			;

parameters_identifier_list 
			: param_identifier parameters_identifier_list_breakup
			{
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "params");
			}
			;

parameters_identifier_list_breakup
			: COMMA parameters_list 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "COMMA");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "parameters_identifier_list_breakup");
			}
			| 
			{
				$$.nd = NULL; 
			}
			;

param_identifier 
			: IDENTIFIER { ins(); params_count++; } param_identifier_breakup
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "IDENTIFIER");
				$$.nd=mknode($1.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "param_identifier");
			}
			;

param_identifier_breakup
			: OPEN_SQR CLOSE_SQR
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_SQR");
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_SQR");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "param_identifier_breakup");
			}
			| 
			{
				$$.nd = NULL; 
			}
			;

statement 
			: expression_statment 
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "statement");
			}
			| compound_statement 
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "statement");
			}
			| conditional_statements 
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "statement");
			}
			| iterative_statements 
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "statement");
			}
			| return_statement 
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "statement");
			}
			| break_statement 
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "statement");
			}
			| continue_statement
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "statement");
			}
			| variable_declaration 
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "statement");
			}
            		| switch_case 
            		{
            			$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "statement");
            		}
			| printf_scanf_statements
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "statement");
			}
			;

printf_scanf_statements
			: printf_statement SEMI_COLON
			{
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "printf_scanf_statements");
			}
			| scanf_statement SEMI_COLON
			{
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "printf_scanf_statements");
			} 
			;

printf_statement
			: PRINTF OPEN_BRACE printf_parameters CLOSE_BRACE 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "PRINTF");
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_BRACE");
				$4.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_BRACE");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, NULL, NULL, NULL, NULL, NULL, NULL, "printf_statement");
			}
			;

scanf_statement
			:  SCANF OPEN_BRACE scanf_parameters CLOSE_BRACE 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SCANF");
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_BRACE");
				$4.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_BRACE");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, NULL, NULL, NULL, NULL, NULL, NULL, "scanf_statement");
			}
			;

printf_parameters
			: printf_parameters COMMA expression
			{
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "COMMA");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "printf_parameters");
			}
			| STRING_CONSTANT
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "STRING_CONSTANT");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "printf_parameters");
			}
			;

scanf_parameters
			: scanf_parameters COMMA IDENTIFIER
			{
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "COMMA");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "scanf_parameters");
			}
			| scanf_parameters COMMA AMP_OPERATOR IDENTIFIER
			{
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "COMMA");
				$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "AMP_OPERATOR");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, NULL, NULL, NULL, NULL, NULL, NULL, "scanf_parameters");
			}
			| STRING_CONSTANT
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "STRING_CONSTANT");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "scanf_parameters");
			}
			;

compound_statement 
			: OPEN_CURLY  statment_list  CLOSE_CURLY 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_CURLY");
				$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_CURLY");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "compound_statement");
			}
			;

statment_list 
			: statement statment_list 
			{
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "statement_list");
			}
			| 
			{
				$$.nd = NULL; 
			}
			;

expression_statment 
			: expression SEMI_COLON 
			{
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "expression_statment");
			}
			| SEMI_COLON 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "expression_statment");
			}
			;

conditional_statements 
			: IF OPEN_BRACE simple_expression CLOSE_BRACE {if($3.value!=1){yyerror("Condition checking is not of type int");}} statement conditional_statements_breakup
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "IF");
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_BRACE");
				$4.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_BRACE");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, $6.nd, $7.nd, NULL, NULL, NULL, NULL, "conditional_statements");
			}
			;

conditional_statements_breakup
			: ELSE statement
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "ELSE");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "conditional_statements_breakup");
			}
			| 
			{
				$$.nd = NULL; 
			}
			;

iterative_statements 
			: WHILE OPEN_BRACE expression CLOSE_BRACE {if($3.value!=1){yyerror("Condition checking is not of type int");}} statement 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "WHILE");
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_BRACE");
				$4.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_BRACE");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, $6.nd, NULL, NULL, NULL, NULL, NULL, "iterative_statements");
			}
			| FOR OPEN_BRACE variable_declaration_list SEMI_COLON simple_expression SEMI_COLON {if($5.value!=1){yyerror("Condition checking is not of type int");}} expression CLOSE_BRACE 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "FOR");
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_BRACE");
				$4.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$6.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$9.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_BRACE");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, $5.nd, $6.nd, $8.nd, $9.nd, NULL, NULL, "iterative_statements");
			}
			| FOR OPEN_BRACE type_specifier variable_declaration_list SEMI_COLON simple_expression SEMI_COLON {if($6.value!=1){yyerror("Condition checking is not of type int");}} expression CLOSE_BRACE 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "FOR");
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_BRACE");
				$5.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$7.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$10.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_BRACE");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, $5.nd, $6.nd, $7.nd, $9.nd, $10.nd, NULL, "iterative_statements");
			}
			| DO statement WHILE OPEN_BRACE simple_expression CLOSE_BRACE{if($5.value!=1){yyerror("Condition checking is not of type int");}} SEMI_COLON
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "DO");
				$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "WHILE");
				$4.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_BRACE");
				$6.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_BRACE");
				$8.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, $5.nd, $6.nd, $8.nd, NULL, NULL, NULL, "iterative_statements");
			}
			;

return_statement 
			: RETURN {return_stat_val=1; isreturn=1;} SEMI_COLON {if(strcmp(currfunctype,"void")) {isreturn=1; yyerror("Returning void of a non-void function"); }}
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "RETURN");
				$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$$.nd=mknode($1.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "return_statement");
			}
			| RETURN { 
					return_stat_val=1;
					isreturn=1;
			           strcpy(curtype, currfunctype);
			         }
			              				
			  expression SEMI_COLON { 				if(!strcmp(currfunctype, "void"))
										{ 
											yyerror("Function returns something but is declared void");
										}

										if((currfunctype[0]=='i' || currfunctype[0]=='c') && $3.value!=1)
										{
											yyerror("Expression doesn't match return type of function");
									        }
			              				
			                     	}
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "RETURN");
				$4.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$$.nd=mknode($1.nd, $3.nd, $4.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "return_statement");
			}
			;

break_statement 
			: BREAK SEMI_COLON 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "BREAK");
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "break_statement");
			}
			;

continue_statement 
			: CONTINUE SEMI_COLON 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CONTINUE");
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "continue_statement");
			}
			;

string_initilization
			: ASSIGNMENT_OPERATOR STRING_CONSTANT {insV();} 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "ASSIGNMENT_OPERATOR");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "string_initialization");
			}	
			;

array_initialization
			: ASSIGNMENT_OPERATOR OPEN_CURLY array_int_declarations CLOSE_CURLY
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "ASSIGNMENT_OPERATOR");
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_CURLY");
				$4.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_CURLY");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, NULL, NULL, NULL, NULL, NULL, NULL, "array_initialization");
			}
			;

array_int_declarations
			: INTEGER_CONSTANT array_int_declarations_breakup
			{
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "array_int_declarations");
			}
			;

array_int_declarations_breakup
			: COMMA array_int_declarations 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "COMMA");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "array_int_declarations_breakup");
			}
			| 
			{
				$$.nd = NULL; 
			}
			;

expression 
			: mutable ASSIGNMENT_OPERATOR expression              {
										  if($1.value==1 && $3.value==1) 
										  {
			                                                          $$.value=1;
			                                                          } 
			                                                          else if($1.value==2 && $3.value==1){
			                                                          	$$.value=2;
			                                                          }
			                                                          else if($1.value==0 && $3.value==1){
			                                                          	$$.value=0;
			                                                          }
			                                                          else if($1.value==0 && $3.value==2){
			                                                          	$$.value=0;
			                                                          }	
			                                                          else 
			                                                          {$$.value=-1; yyerror("Type mismatch");}
			        $2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "ASSIGNMENT_OPERATOR");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "expression");
			}
			| mutable ADDITION_ASSIGNMENT_OPERATOR expression     {
																	  if($1.value==1 && $3.value==1) 
			                                                          $$.value=1; 
			                                                          else 
			                                                          {$$.value=-1; yyerror("Type mismatch");} 
			                                                      
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "ADDITION_ASSIGNMENT_OPERATOR");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "expression");
			}
			| mutable SUBTRACTION_ASSIGNMENT_OPERATOR expression  {
																	  if($1.value==1 && $3.value==1) 
			                                                          $$.value=1; 
			                                                          else 
			                                                          {$$.value=-1; yyerror("Type mismatch");} 
			        $2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SUBTRACTION_ASSIGNMENT_OPERATOR");                                               
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "expression");
			}
			| mutable MULTIPLICATION_ASSIGNMENT_OPERATOR expression {
																	  if($1.value==1 && $3.value==1) 
			                                                          $$.value=1; 
			                                                          else 
			                                                          {$$.value=-1; yyerror("Type mismatch");} 
			        $2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "MULTIPLICATION_ASSIGNMENT_OPERATOR");                                       
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "expression");
			}
			| mutable DIVISION_ASSIGNMENT_OPERATOR expression 		{
																	  if($1.value==1 && $3.value==1) 
			                                                          $$.value=1; 
			                                                          else 
			                                                          {$$.value=-1; yyerror("Type mismatch");} 
			        $2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "DIVISION_ASSIGNMENT_OPERATOR");                                              
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "expression");
			}
			| mutable MODULO_ASSIGNMENT_OPERATOR expression 		{
																	  if($1.value==1 && $3.value==1) 
			                                                          $$.value=1; 
			                                                          else 
			                                                          {$$.value=-1; yyerror("Type mismatch");} 
			        $2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "MODULO_ASSIGNMENT_OPERATOR");                                              
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "expression");
			}
			| mutable INCREMENT_OPERATOR 							{$$.value=$1.value;
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "INCREMENT_OPERATOR");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "expression");
			}
			| mutable DECREMENT_OPERATOR 							{$$.value=$1.value;
			$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "DECREMENT_OPERATOR");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "expression");
			}
			| simple_expression 								{$$.value=$1.value;
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "expression");
			}
			;


simple_expression 
			: simple_expression OR_OPERATOR and_expression 
			{
				if($1.value == 1 && $3.value==1) $$.value=1; else $$.value=-1;
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OR_OPERATOR");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "simple_expression");
			}
			| and_expression 
			{
				$$.value=$1.value;
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "simple_expression");
			}
			;

and_expression 
			: and_expression AND_OPERATOR unary_relation_expression
			{
				if($1.value == 1 && $3.value==1) $$.value=1; else $$.value=-1;
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "AND_OPERATOR");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "and_expression");
			}
			| unary_relation_expression 
			{
				$$.value=$1.value;
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "and_expression");
			} 
			;


unary_relation_expression 
			: EXCLAMATION_OPERATOR unary_relation_expression 
			{
				if($2.value==1) $$.value=1; else $$.value=-1;
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "EXCLAMATION_OPERATOR");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "unary_relation_expression");
			} 
			| regular_expression 
			{
				$$.value=$1.value;
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "unary_relation_expression");
			} 
			;

regular_expression 
			: regular_expression relational_operators sum_expression 
			{
				if($1.value == 1 && $3.value==1) $$.value=1; else $$.value=-1;
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "regular_expression");
			}
			| sum_expression 
			{
				$$.value=$1.value;
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "regular_expression");
			} 
			;
			
relational_operators 
			: GREATERTHAN_ASSIGNMENT_OPERATOR 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "GREATERTHAN_ASSIGNMENT_OPERATOR");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "relational_operators");
			}
			| LESSTHAN_ASSIGNMENT_OPERATOR 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "LESSTHAN_ASSIGNMENT_OPERATOR");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "relational_operators");
			}
			| GREATERTHAN_OPERATOR 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "GREATERTHAN_OPERATOR");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "relational_operators");
			}
			| LESSTHAN_OPERATOR
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "LESSTHAN_OPERATOR");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "relational_operators");
			} 
			| EQUALITY_OPERATOR 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "EQUALITY_OPERATOR");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "relational_operators");
			}
			| INEQUALITY_OPERATOR 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "INEQUALITY_OPERATOR");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "relational_operators");
			}
			;

sum_expression 
			: sum_expression sum_operators term 
			{
				if($1.value == 1 && $3.value==1) $$.value=1; else $$.value=-1;
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "sum_expression");
			}
			| term 
			{
				$$.value=$1.value;
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "sum_expression");
			}
			;

sum_operators 
			: ADD_OPERATOR
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "ADD_OPERATOR");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "sum_operators");
			} 
			| SUBTRACT_OPERATOR 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SUBTRACT_OPERATOR");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "sum_operators");
			}
			;

term
			: term MULOP factor 
			{
				if($1.value == 1 && $3.value==1) $$.value=1; else $$.value=-1;
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "term");
			}
			| factor 
			{	
				$$.value=$1.value;
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "term");
			} 
			;

MULOP 
			: MULTIPLICATION_OPERATOR
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "MULTIPLICATION_OPERATOR");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "MULOP");
			} 
			| DIVISION_OPERATOR
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "DIVISION_OPERATOR");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "MULOP");
			} 
			| MODULO_OPERATOR 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "MODULO_OPERATOR");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "MULOP");
			}
			;

factor 
			: immutable 
			{
				$$.value=$1.value;
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "factor");
			} 
			| mutable 
			{
				$$.value=$1.value;
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "factor");
			} 
			;

mutable 
			: IDENTIFIER {
						  if(check_id_is_func(curid))
						  {char msg[1000]; sprintf(msg,"%s function name used as an IDENTIFIER",curid); yyerror(msg);}
			              if(!checkscope(curid))
			              {char msg[1000]; sprintf(msg,"%s Undeclared",curid); yyerror(msg);} 
			              if(!checkarray(curid))
			              {char msg[1000]; sprintf(msg,"%s Array ID has no subscript",curid); yyerror(msg);}
			              if(gettype(curid,0)=='i'){
			              	$$.value = 1;
			              }
			              else if(gettype(curid,0)=='c'){
			              	$$.value = 3;
			              }
			              else if(gettype(curid,0)=='f'){
			              	$$.value = 2;
			              }
			              else if(gettype(curid,0)=='d'){
			              	$$.value = 0;
			              }
			              else
			              $$.value = -1;
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "IDENTIFIER");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "mutable");
			}
			| ARRAY_IDENTIFIER {if(!checkscope(curid)){char msg[1000]; sprintf(msg,"%s Undeclared",curid); yyerror(msg);}} OPEN_SQR expression CLOSE_SQR 
			                   {if(gettype(curid,0)=='i' || gettype(curid,1)== 'c')
			              		$$.value = 1;
			              		else
			              		$$.value = -1;
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "ARRAY_IDENTIFIER");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "mutable");              		
			}
			| AMP_OPERATOR IDENTIFIER
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "AMP_OPERATOR_IDENTIFIER");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "mutable");
			}
			;

immutable 
			: OPEN_BRACE expression CLOSE_BRACE 
			{	
				if($2.value==1) $$.value=1; else $$.value=-1;
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_BRACE");
				$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_BRACE");
				$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "immutable");
			}
			| call               
			{
				if($1.value==1) $$.value=1; else $$.value=-1;
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "immutable");
			}
			| constant 
			{	
				if($1.value==1) $$.value=1; else $$.value=-1;
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "immutable");
			}
			;

call: IDENTIFIER OPEN_BRACE arguments CLOSE_BRACE {
       		if(!check_declaration(curid, "Function")) {
               		yyerror("Need to declare function"); 
               		$$.value = -1; 
           	}
           	insertSTF(curid); 
           	strcpy(currfunccall, curid);
           if (strcmp(currfunccall, "printf") && strcmp(currfunccall, "scanf")) {
           	printf("%s\n", currfunccall);
           	insertSTparamscount(currfunccall, call_params_count);
        	printf("params in st: %d\n", getSTparamscount(currfunccall));
        	printf("params count : %d\n", call_params_count);
               if (getSTparamscount(currfunccall) != call_params_count) {	
                   yyerror("function arguments required does not match the passed arguments...");
                   $$.value = -1;
               }
           } 
           if ($$.value != -1)
               $$.value = 1;
              
           $1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "IDENTIFIER");    
           $2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_BRACE");
	   $4.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_BRACE");
	   $$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, NULL, NULL, NULL, NULL, NULL, NULL, "call");
       }
   ;
arguments 
			: arguments_list 
			{
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "arguments");
			}
			| 
			{
				$$.nd = NULL; 
			}
			;

arguments_list 
			: expression { call_params_count++; } A 
			{
				$$.nd=mknode($1.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "arguments_list");
			}
			;

A
			: COMMA expression { call_params_count++; } A 
			{
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "COMMA");
				$$.nd=mknode($1.nd, $2.nd, $4.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "A");
			}
			| 
			{
				$$.nd = NULL; 
			}
			;

constant 
			: INTEGER_CONSTANT 	
			{  
				if(return_stat_val==1) {return_stat_val=0;}
				else{
					insV();
				} 
				$$.value=1;
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "INTEGER_CONSTANT");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "constant");
			} 
			| SUBTRACT_OPERATOR INTEGER_CONSTANT 
			{
				char newval[256]; sprintf(newval, "-%s", curval); insV(); strcpy(curval,newval); insV(); $$.value=1;
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SUBTRACT_OPERATOR");
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "INTEGER_CONSTANT");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "constant");
			}
			| STRING_CONSTANT	
			{  
				insV(); $$.value=-1;
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "STRING_CONSTANT");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "constant");
			} 
			| FLOAT_CONSTANT	
			{  
				insV();
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "FLOAT_CONSTANT");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "constant");
			} 
			| SUBTRACT_OPERATOR FLOAT_CONSTANT 
			{
				char newval[256]; sprintf(newval, "-%s", curval); insV(); strcpy(curval,newval); insV(); $$.value=1;
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SUBTRACT_OPERATOR");
				$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "FLOAT_CONSTANT");
				$$.nd=mknode($1.nd, $2.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "constant");
			}
			| CHARACTER_CONSTANT
			{  
				insV();$$.value=1;
				$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CHARACTER_CONSTANT");
				$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "constant"); 
			}
			;

enum_declaration
            : ENUM IDENTIFIER OPEN_CURLY enum_list CLOSE_CURLY SEMI_COLON
            {
            		$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "ENUM");
			$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "IDENTIFIER");
			$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_CURLY");
			$5.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_CURLY");
			$6.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
			$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, $5.nd, $6.nd, NULL, NULL, NULL, NULL, "enum_declaration");	
            }
            ;

enum_list
            : enumerator
            {
            	$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "enum_list");
            }
            | enum_list COMMA enumerator 
            {
            	$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "COMMA");
		$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "enum_list"); 
            }
            ;

enumerator
            : IDENTIFIER
            {
            	$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "IDENTIFIER");
		$$.nd=mknode($1.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "enumerator"); 
            }
            | IDENTIFIER ASSIGNMENT_OPERATOR INTEGER_CONSTANT
            {
            	$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "IDENTIFIER");
		$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "ASSIGNMENT_OPERATOR");
		$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "INTEGER_CONSTANT");
		$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "enumerator");	
            }
            ;

switch_case
            : SWITCH  OPEN_BRACE IDENTIFIER CLOSE_BRACE OPEN_CURLY case_list CLOSE_CURLY
            {
            	$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SWITCH");
		$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_BRACE");
		$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "IDENTIFIER");
		$4.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_BRACE");
		$5.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "OPEN_CURLY");
		$7.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CLOSE_CURLY");
		$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, $5.nd, $6.nd, $7.nd, NULL, NULL, NULL, "switch_case");
            } 
            ;

case_list
            : case_entry BREAK SEMI_COLON
            {
            	$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "BREAK");
		$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
		$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "case_list");	
            }
            | case_list case_entry BREAK SEMI_COLON
            {
            	$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "BREAK");
		$4.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SEMI_COLON");
		$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, NULL, NULL, NULL, NULL, NULL, NULL, "case_list");	
            }
            ;

case_entry  
            : CASE constant COLON statement
            {
            	$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CASE");
		$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "COLON");
		$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, NULL, NULL, NULL, NULL, NULL, NULL, "case_entry");	
            }
            | CASE constant SPREAD constant COLON statement
            {
            	$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "CASE");
		$3.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "SPREAD");
		$5.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "COLON");
		$$.nd=mknode($1.nd, $2.nd, $3.nd, $4.nd, $5.nd, $6.nd, NULL, NULL, NULL, NULL, "case_entry");	
            }
            | DEFAULT COLON statement
            {
            	$1.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "DEFAULT");
		$2.nd=mknode(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "COLON");
		$$.nd=mknode($1.nd, $2.nd, $3.nd, NULL, NULL, NULL, NULL, NULL, NULL, NULL, "case_entry");
            }
            |
            {
		$$.nd = NULL; 
	    }
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
		yyerror("No function declarations");
	else if(strcmp(currfunc,"main")!=0)
		yyerror("main not last function or missing");
	if(flag == 0)
	{
		printf( "PASSED: Semantic Phase\n");
		printf("%30s"  "PRINTING SYMBOL TABLE"  "\n\n", " ");
		printST();
		printf("----------------------------------------------------------------------------------------------------------------------------------");
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
	if(flag==0){
        	printf("\n\nLevel Order Traversal of AST\n\n");
        	levelOrderTraversal(head);
        }
        else{
        	printf("\nNo AST\n");
        }	

}

struct node* mknode(struct node *child1, struct node *child2, struct node *child3, struct node *child4, struct node *child5, struct node *child6, struct node *child7, struct node *child8, struct node *child9, struct node *child10, char *token) {	
	struct node *newnode = (struct node *)malloc(sizeof(struct node));
	char *newstr = (char *)malloc(strlen(token)+1);
	strcpy(newstr, token);
	newnode->child1 = child1;
	newnode->child2 = child2;
	newnode->child3 = child3;
	newnode->child4 = child4;
	newnode->child5 = child5;
	newnode->child6 = child6;
	newnode->child7 = child7;
	newnode->child5 = child8;
	newnode->child6 = child9;
	newnode->child7 = child10;
	newnode->token = newstr;
	return(newnode);
}

void type_check_2(char *str){
	if(strcmp(str,"int")==0) checking_val=1;
	else if(strcmp(str,"float")==0) checking_val=2;
	else if(strcmp(str, "double")==0) checking_val=0;
	else checking_val=3;
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
