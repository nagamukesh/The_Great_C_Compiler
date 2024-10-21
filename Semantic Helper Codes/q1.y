%{
	#include <stdio.h>
	#include <ctype.h>
	#include <stdlib.h>
	#include <string.h>
	extern int yylineno;
	
	#define MAX_SYMBOLS 100
	#define MAX_SYMBOL_NAME 100
	#define MAX_SYMBOL_TYPE 100

	int nesting_level = 0;

	struct SymbolRecord {
		char symbol_name[MAX_SYMBOL_NAME];
		char symbol_type[MAX_SYMBOL_TYPE];
		int line_number;
		int nesting_level;
	};

	struct SymbolTable {
		struct SymbolRecord symbols[MAX_SYMBOLS];
		int count; 
		int nesting_level; 
		int start_line; 
		int end_line;   
		struct SymbolTable* next; 
	};

	struct SymbolTable* createSymbolTable(int nesting_level, int start_line, int end_line) {
		struct SymbolTable* newTable = (struct SymbolTable*)malloc(sizeof(struct SymbolTable));
		newTable->count = 0;
		newTable->nesting_level = nesting_level;
		newTable->start_line = start_line;
		newTable->end_line = end_line;
		newTable->next = NULL;
		return newTable;
	}

	void pushTable(struct SymbolTable** head, int nesting_level, int start_line, int end_line) {
		struct SymbolTable* newTable = createSymbolTable(nesting_level, start_line, end_line);
		newTable->next = *head;
		*head = newTable;
	}

	struct SymbolTable* popTable(struct SymbolTable** head) {
		if (*head == NULL) {
			printf("No more symbol tables to pop!\n");
			exit(EXIT_FAILURE); 
		}

		struct SymbolTable* current = *head;
		*head = current->next;
		free(current);
		return *head;
	}

	struct SymbolTable* peekTable(struct SymbolTable* head) {
		if (head == NULL) {
			printf("No symbol table to peek!\n");
			exit(EXIT_FAILURE);
		}

		return head;
	}

	void addSymbol(struct SymbolTable* table, struct SymbolRecord symbol) {
		if (table == NULL) {
			printf("Symbol table is not initialized!\n");
			exit(EXIT_FAILURE);
		}

		if (table->count >= MAX_SYMBOLS) {
			printf("Symbol table is full!\n");
			return;
		}

		table->symbols[table->count++] = symbol;
	}

	struct SymbolRecord* searchSymbol(struct SymbolTable* table, const char* name, int nesting_level) {
		if (table == NULL) {
			printf("Symbol table is not initialized!\n");
			return NULL;
		}

		for (int i = 0; i < table->count; i++) {
			if (strcmp(table->symbols[i].symbol_name, name) == 0 &&
				table->symbols[i].nesting_level == nesting_level) {
				return &table->symbols[i]; // Return pointer to found symbol
			}
		}

		return NULL;
	}

	/*add variable to symbol table within scope when declared*/
	void addNewSymbolToTop(struct SymbolTable** stack, const char* name, const char* type, int line_number, int nesting_level) {
		struct SymbolTable* currentTable = peekTable(*stack);
		
		if (currentTable == NULL) {
			printf("No symbol table available to add the symbol!\n");
			return;
		}

		/* Check if the symbol already exists*/
		if (searchSymbol(currentTable, name, nesting_level)) {
			char error_message[256];
			snprintf(error_message, sizeof(error_message), "Symbol '%s' in this scope with nesting level %d already declared.", name, nesting_level);
			yyerror(error_message); 
			return; // Exit the function if the symbol exists
		}

		struct SymbolRecord newSymbol;
		strncpy(newSymbol.symbol_name, name, MAX_SYMBOL_NAME);
		strncpy(newSymbol.symbol_type, type, MAX_SYMBOL_TYPE);
		newSymbol.line_number = line_number;
		newSymbol.nesting_level = nesting_level;

		addSymbol(currentTable, newSymbol);
	}

	/* Check if ID is declared in the top of the symbol table stack */
	struct SymbolRecord* checkIdDeclared(struct SymbolTable* stack, const char* id_name) {
		struct SymbolTable* currentTable = peekTable(*stack);

		//If current table is NULL
		if(currentTable==NULL){
			yyerror("Exitted global dimension, impossible, inception, abort");
			return NULL
		}

		/* Check if the symbol exists in the top of the stack (current scope, including outer scopes) */
		int nesting_lvl = currentTable->nesting_level+1;
		struct SymbolRecord* symbol = NULL;
		while(nesting_lvl--){
			if (symbol = searchSymbol(currentTable, id_name, nesting_lvl)) {
				return symbol;
			}
		}

		/* If we reach here, the ID is undeclared */
		char error_message[256];
		snprintf(error_message, sizeof(error_message), "Error: Identifier '%s' is undeclared at line %d.", id_name, yylineno);
		yyerror(error_message);

		return NULL;
	}

	/* Add new symbol table to the stack and copy current table's symbols */
	void pushTableWithCopy(struct SymbolTable** head, int nesting_level) {
		struct SymbolTable* newTable = createSymbolTable(nesting_level, yylineno, yylineno);

		/* If there is already a table at the top, copy its contents to the new table */
		if (*head != NULL) {
			memcpy(newTable->symbols, (*head)->symbols, sizeof((*head)->symbols));
			newTable->count = (*head)->count;  // Copy symbol count
		}

		/* Push the new table onto the stack */
		newTable->next = *head;
		*head = newTable;

		printf("New symbol table created with nesting level %d at line %d\n", nesting_level, start_line);
	}

	void printSymbolTable(struct SymbolTable* table) {
		if (table == NULL) {
			printf("No symbol table to print.\n");
			return;
		}

		printf("Symbol Table (Nesting Level %d):\n", table->nesting_level);
		for (int i = 0; i < table->count; i++) {
			printf("Symbol: %s, Type: %s, Line: %d, Nesting Level: %d\n",
				table->symbols[i].symbol_name,
				table->symbols[i].symbol_type,
				table->symbols[i].line_number,
				table->symbols[i].nesting_level);
		}
		printf("\n");
	}

	void popAndPrintTable(struct SymbolTable** head) {
		struct SymbolTable* currentTable = peekTable(*head);
		
		if (currentTable == NULL) {
			printf("No symbol table to pop!\n");
			return;
		}

		// Update end_line with the current line number
		currentTable->end_line = yylineno;

		// Print the symbol table before popping
		printf("Symbol table for scope from line %d to %d:\n", currentTable->start_line, currentTable->end_line);
		printSymbolTable(currentTable);

		// Store the symbol table in a temporary location before popping
		struct SymbolTable* tempTable = copySymbolTable(currentTable);

		// Pop the symbol table off the stack
		popTable(head);

		// Get the new active symbol table after the pop
		struct SymbolTable* newActiveTable = peekTable(*head);

		if (newActiveTable != NULL) {
			for(int i=0; i<newActiveTable->count; i++)
				newActiveTable->symbols[i] = tempTable->symbols[i];
		}

		// Free the temporary table
		free(tempTable);
	}

	struct SymbolTable* stack = NULL;
	pushTable(&stack, 0, 1, 100); /*this is the global scope*/
	char* current_datatype;

%}

%token WHILE BEGIN END GEQ LEG NEQ DEQ INT CHAR FLOAT BOOL ID NUM FLOAT_LITERAL CHAR_LITERAL
%start S

%right '='
%nonassoc DEQ NEQ
%nonassoc GEQ LEG '>' '<'
%left '+' '-'
%left '*' '/'

%%

S : stmts {	if (peekTable(stack) != NULL) {
				peekTable(stack)->end_line = yylineno; // Set the end line
				struct SymbolTable* poppedTable = popTable(&stack); // Pop the table
				free(poppedTable); // Free the popped symbol table if necessary
			}
		}
	;

stmts : stmt stmts
	| ;

stmt : cond_stmt
	| var_decl
	| var_init
	| while_loop
	;

cond_stmt : expr DEQ expr
		| expr NEQ expr
		| expr GEQ expr
		| expr LEQ expr
		| expr '>' expr
		| expr '<' expr
		;

expr: ID					{checkIdDeclared(stack, $1); }
	| NUM
	| FLOAT_LITERAL
	| CHAR_LITERAL
	;

var_decl : datatype params;

datatype : INT				{strcpy(current_datatype, "int");}
		| CHAR				{strcpy(current_datatype, "char");}
		| FLOAT				{strcpy(current_datatype, "float");}
		| BOOL				{strcpy(current_datatype, "bool");}
		;

params: ID more_params ';'	{addNewSymbolToTop(&stack, $1, current_datatype, yylineno, peekTable(stack)->nesting_level);}
	;

more_params: ',' ID			{addNewSymbolToTop(&stack, $2, current_datatype, yylineno, peekTable(stack)->nesting_level);}
		| 
		;

var_init : ID '=' arithm_expr ';' {checkIdDeclared(stack, $1); }
		;

arithm_expr : expr '+' expr
			| expr '-' expr
			| expr '*' expr
			| expt '/' expr
			;

while_loop : WHILE while_cond while_content
			;

while_cond : cond_stmt
			;

while_content : while_start while_inside while_end 
			;

while_start : BEGIN           {nesting_level++;  pushTableWithCopy(&stack, nesting_level);}
			;

while_inside : stmts
			;

while_outside : END           {popAndPrintTable(struct SymbolTable** head); nesting_level--;}


%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    /*exit(1);*/  
}
int main(){
	extern FILE *yyin;
	yyin = fopen("input.txt","r");
	yyparse();
	return 1;
}
