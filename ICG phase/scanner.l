%{
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>
	#include "y.tab.h"

	struct symboltable
	{
		char name[100];
		char class[100];
		char type[100];
		char value[100];
		char dimension[100];
		int nesting_val;
		int lineno;
		int length;
		int scope_number;
		int params_count;
	}ST[1007];
	
	int return_stat_val=0;

	char curid[20];
	char curtype[20];
	char curval[20];

	struct constanttable
	{
		char name[100];
		char type[100];
		int length;
	}CT[1007];

	int current_nesting = 0;
	int params_count = 0;
	int scope_values=0;
	int checking_val;
	void yyerror(char *s);
	char array_dim_str[10000] = "";

	void append_dim(int* val_to_append){
		char temp[1000];
		sprintf(temp," %d",val_to_append);
		strcat(array_dim_str,temp);
	}

	int hash(char *str)
	{
		int value = 0;
		for(int i = 0 ; i < strlen(str) ; i++)
		{
			value = 10*value + (str[i] - 'A');
			value = value % 1007;
			while(value < 0)
				value = value + 1007;
		}
		return value;
	}

	int lookupST(char *str)
	{
		int value = hash(str);
		if(ST[value].length == 0)
		{
			return 0;
		}
		else if(strcmp(ST[value].name,str)==0)
		{
			
			return value;
		}
		else
		{
			for(int i = value + 1 ; i!=value ; i = (i+1)%1007)
			{
				if(strcmp(ST[i].name,str)==0)
				{
					
					return i;
				}
			}
			return 0;
		}
	}

	int lookupCT(char *str)
	{
		int value = hash(str);
		if(CT[value].length == 0)
			return 0;
		else if(strcmp(CT[value].name,str)==0)
			return 1;
		else
		{
			for(int i = value + 1 ; i!=value ; i = (i+1)%1007)
			{
				if(strcmp(CT[i].name,str)==0)
				{
					return 1;
				}
			}
			return 0;
		}
	}

	void insertSTline(char *str1, int line)
	{
		for(int i = 0 ; i < 1007 ; i++)
		{
			if(strcmp(ST[i].name,str1)==0)
			{
				ST[i].lineno = line;
				ST[i].scope_number=scope_values;
			}
		}
	}


	void insertST(char *str1, char *str2)
	{
		if(lookupST(str1))
		{
			if(strcmp(ST[lookupST(str1)].class,"Identifier")==0 && strcmp(str2,"Array Identifier")==0)
			{
				printf("%s%s",str1,str2);
				yyerror("Error use of array");
			}	
			return;
		}
		else
		{
			int value = hash(str1);
			if(ST[value].length == 0)
			{
				strcpy(ST[value].name,str1);
				strcpy(ST[value].class,str2);
				ST[value].length = strlen(str1);
				ST[value].nesting_val = current_nesting;
				ST[value].params_count = 0;
				insertSTline(str1,yylineno);
				return;
			}

			int pos = 0;

			for (int i = value + 1 ; i!=value ; i = (i+1)%1007)
			{
				if(ST[i].length == 0)
				{
					pos = i;
					break;
				}
			}

			strcpy(ST[pos].name,str1);
			strcpy(ST[pos].class,str2);
			ST[pos].length = strlen(str1);
			ST[pos].nesting_val =current_nesting;
			ST[pos].params_count = 0;
		}
	}
	
	int check_type(char* str){
		
		int value = hash(str);
		if(CT[value].length == 0)
			return 0;
		else if(strcmp(CT[value].name,str)==0){
			if(strcmp(CT[value].type,"Number Constant")==0){
						return 1;
			}
			else if (strcmp(CT[value].type,"Floating Constant")==0){
						return 2;
			}
			else{
						return 3;
			}
		}
			
		else
		{
			for(int i = value + 1 ; i!=value ; i = (i+1)%1007)
			{
				if(strcmp(CT[i].name,str)==0)
				{
					if(strcmp(CT[i].type,"Number Constant")==0){
						return 1;
					}
					else if (strcmp(CT[i].type,"Floating Constant")==0){
						return 2;
					}
					else{
						return 3;
					}
				}
			}
			return 0;
		}
	}

	void insertSTtype(char *str1, char *str2)
	{
		//printf("checking_val : %d\n", checking_val);
		for(int i = 0 ; i < 1007 ; i++)
		{
			if(strcmp(ST[i].name,str1)==0)
			{
				if(checking_val==0){
					strcpy(ST[i].type, str2);	
				}
				else if(checking_val==1){
					if(strcmp(str2, "int")==0) strcpy(ST[i].type, str2);
					else return;
				}
				else if(checking_val==2){
					if(strcmp(str2,"float")==0) strcpy(ST[i].type, str2);
					else return;
				}
			}
		}
    }

	void insertSTvalue(char *str1, char *str2)
	{
		checking_val=check_type(str2);
		//printf("%d\n", checking_val);
		for(int i = 0 ; i < 1007 ; i++)
		{
			if(strcmp(ST[i].name,str1)==0)
			{
				if(checking_val==0){
					strcpy(ST[i].value, str2);	
				}
				else if(checking_val==1){
					if(strcmp(curtype, "int")==0){
						strcpy(ST[i].value, str2);
					}
					else{
						yyerror("Type mismatch");
						return;
					}
				}
				else if(checking_val==2){
					if(strcmp(curtype,"float")==0) strcpy(ST[i].value, str2);
					else{
						yyerror("Type mismatch");
						return;
					}
				}
				else if(checking_val==3){
					if(strcmp(curtype,"char")==0) strcpy(ST[i].value, str2);
					else{
						yyerror("Type mismatch");
						return;
					}
				}
			}
		}
		printf("\n");
	}



	void insertSTnest(char *s, int nest)
	{
		if(lookupST(s) && ST[lookupST(s)].nesting_val != 0)
		{
             int pos = 0;
             int value = hash(s);
			for (int i = value + 1 ; i!=value ; i = (i+1)%1007)
			{
				if(ST[i].length == 0)
				{
					pos = i;
					break;
				}
			}

			strcpy(ST[pos].name,s);
			strcpy(ST[pos].class,"Identifier");
			ST[pos].length = strlen(s);
			ST[pos].nesting_val = nest;
			ST[pos].params_count = -1;
			ST[pos].lineno = yylineno;
		}
		else
		{
			for(int i = 0 ; i < 1007 ; i++)
			{
				if(strcmp(ST[i].name,s)==0 )
				{
					ST[i].nesting_val = nest;
				}
			}
		}
	}

	void insertSTparamscount(char *s, int count)
	{
		for(int i = 0 ; i < 1007 ; i++)
		{
			if(strcmp(ST[i].name,s)==0 )
			{
				ST[i].params_count = count;
			}
		}
	}

	int getSTparamscount(char *s)
	{
		for(int i = 0 ; i < 1007 ; i++)
		{
			if(strcmp(ST[i].name,s)==0 )
			{
				return ST[i].params_count;
			}
		}
		return -2;
	}

	void insertSTF(char *s)
	{
		for(int i = 0 ; i < 1007 ; i++)
		{
			if(strcmp(ST[i].name,s)==0 )
			{
				strcpy(ST[i].class,"Function");
				return;
			}
		}

	}

	void insertCT(char *str1, char *str2)
	{
		if(lookupCT(str1))
			return;
		else
		{
			int value = hash(str1);
			if(CT[value].length == 0)
			{
				strcpy(CT[value].name,str1);
				strcpy(CT[value].type,str2);
				CT[value].length = strlen(str1);
				return;
			}

			int pos = 0;

			for (int i = value + 1 ; i!=value ; i = (i+1)%1007)
			{
				if(CT[i].length == 0)
				{
					pos = i;
					break;
				}
			}

			strcpy(CT[pos].name,str1);
			strcpy(CT[pos].type,str2);
			CT[pos].length = strlen(str1);
		}
	}

	void deletedata (int nesting)
	{
		for(int i = 0 ; i < 1007 ; i++)
		{
			if(ST[i].nesting_val == nesting)
			{
				ST[i].nesting_val = 9999;
			}
		}


	}

	int checkscope(char *s)
	{
		int flag = 0;
		for(int i = 0 ; i < 1000 ; i++)
		{
			if(strcmp(ST[i].name,s)==0)
			{
				if(ST[i].nesting_val > current_nesting)
				{
					flag = 1;
				}
				else
				{
					flag = 0;
					break;
				}
			}
		}
		if(!flag)
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}

	int check_id_is_func(char *s)
	{
		for(int i = 0 ; i < 1000 ; i++)
		{
			if(strcmp(ST[i].name,s)==0)
			{
				if(strcmp(ST[i].class,"Function")==0)
					return 1;
			}
		}
		return 0;
	}

	int checkarray(char *s)
	{
		for(int i = 0 ; i < 1000 ; i++)
		{
			if(strcmp(ST[i].name,s)==0)
			{
				if(strcmp(ST[i].class,"Array Identifier")==0)
				{
					return 0;
				}
			}
		}
		return 1;
	}

	int duplicate(char *s)
	{
		for(int i = 0 ; i < 1000 ; i++)
		{
			if(strcmp(ST[i].name,s)==0)
			{			
				if(ST[i].scope_number == scope_values)
				{
			        	return 1;
				}
				
			}
		}
		
		return 0;
	}

	int check_duplicate(char* str)
	{
		for(int i=0; i<1007; i++)
		{
			if(strcmp(ST[i].name, str) == 0 && strcmp(ST[i].class, "Function") == 0)
			{
				printf("Function redeclaration not allowed\n");
				exit(0);
			}
		}
	}

	int check_declaration(char* str, char *check_type)
	{
		for(int i=0; i<1007; i++)
		{
			if(strcmp(ST[i].name, str) == 0 && strcmp(ST[i].class, "Function") == 0 || strcmp(ST[i].name,"printf")==0 )
			{
				return 1;
			}
		}
		return 0;
	}

	int check_params(char* type_specifier)
	{
		if(!strcmp(type_specifier, "void"))
		{
			yyerror("Parameters cannot be of type void");
		}
		return 0;
	}

	char gettype(char *s, int flag)
	{
			for(int i = 0 ; i < 1007 ; i++ )
			{
				if(strcmp(ST[i].name,s)==0)
				{
					return ST[i].type[0];
				}
			}
		
	}

	

	void process_array_dimensions(){
		// char* cur_array_str = strtok(array_dim_str,"\n");
		// while (cur_array_str != NULL){ // <array name> dim1 dim2
		// 	char array_name[1000] = "";
		// 	char value[100];
		// 	int index = 0;

		// 	while(index < strlen(cur_array_str)){
		// 		if(cur_array_str[index] == ' ') break;
		// 		strcat(array_name, cur_array_str[index]);
		// 		index++;
		// 	}

		// 	while(index < strlen(cur_array_str)){
		// 		strcat(value, cur_array_str[index]);
		// 		index++;
		// 	}
			
		// 	printf("Array name is %s\n",array_name);
			
		// 	insertSTvalue(array_name, value);

		// 	cur_array_str = strtok(NULL,"\n");
		// }

		// char input[] = "id 1 2 3 \n id 4 5 6 \n id 7 8 9 \n";

		char *input = array_dim_str;
		char id[100];  
		char numbers[100];
		int offset = 0;
		
		while (sscanf(input + offset, "%s %[^\n]s", id, numbers) == 2) {
			offset += snprintf(NULL, 0, "%s %s", id, numbers) + 1;
			for(int i = 0 ; i < 1007 ; i++)
			{
				if(strcmp(ST[i].name,id)==0)// && ST[i].nesting_val == current_nesting)
				{
					strcpy(ST[i].value,numbers);
				}
			}
		}
		
	}

	void printST()
	{
		process_array_dimensions();

		printf("----------------------------------------------------------------------------------------------------------------------------------");
		printf("\n");
		printf(" %15s | %16s | %10s | %10s | %10s | %15s | %20s | %10s |\n","Symbol name", "Class", "Type","Value", "Line No.", "Nesting Count", "Count of Params", "Scope");
		printf("----------------------------------------------------------------------------------------------------------------------------------");
		printf("\n");
		for(int i = 0 ; i < 1007 ; i++)
		{
			if(ST[i].length == 0)
			{
				continue;
			}

			// int first_occurrance = 0;
			// int dup[1007];
			// for (int i = 0;i < 1007;i++){
			// 	dup[i] = -1;
			// }


			// for (int j = 0;j < 1007;j++){

			// 	if(strcmp(ST[i].name,ST[j].name)==0) {				
			// 		// if(ST[i].nesting_val == ST[j].nesting_val) //Remove if this thing doesn't work
			// 		{
			// 			first_occurrance = 1;
			// 			int idx = 0;
			// 			for (;idx<1007;idx++){
			// 				if (dup[idx] == -1){
			// 					dup[idx] = ST[j].lineno;
			// 					break;
			// 				}
			// 				// printf("hello");
			// 			}
			// 		}
			// 	}
			// }
			// char line_no_str[3000] = "";
			// if (!first_occurrance){
			// 	continue;
			// } else {
				
			// 	for (int idx = 0;idx < 1007;idx++){
			// 		if (dup[idx] == -1){
			// 			break;
			// 		}
			// 		printf("hi");
			// 		sprintf(line_no_str,"%s%d->",line_no_str,dup[idx]);
			// 	}
			// }

			// printf("%10s | %15s | %10s | %10s | %10s | %15d | %10d |\n",ST[i].name, ST[i].class, ST[i].type, ST[i].value, line_no_str, ST[i].nesting_val, ST[i].params_count);
			printf(" %15s | %16s | %10s | %10s | %10d | %15d | %20d | %10d |\n",ST[i].name, ST[i].class, ST[i].type, ST[i].value, ST[i].lineno, ST[i].nesting_val, ST[i].params_count, ST[i].scope_number);



			/*printf("%10s | %15s | %10s | %10s | ",ST[i].name, ST[i].class, ST[i].type, ST[i].value);
            for (int j = 0;j < 100;j++){
                if (ST[i].lineno[j] == -1) break;
                printf("%d -> ",ST[i].lineno[j]);
            }
            printf("\n");*/
		}
							// printf("hello");
    }


	void printCT()
	{
		printf("----------------------------------------------");
		printf("\n");
		printf(" %20s | %20s |\n","Constant name", "Constant type");
		printf("----------------------------------------------");
		printf("\n");
		for(int i = 0 ; i < 1007 ; i++)
		{
			if(CT[i].length == 0)
				continue;

			printf(" %20s | %20s |\n",CT[i].name, CT[i].type);
		}

		// printf("%s\n",array_dim_str);
	}
%}

DE "define"
IN "include"

%%
\n 	{yylineno++;}
([#][" "]*({IN})[ ]*([<]?)([A-Za-z]+)[.]?([A-Za-z]*)([>]?))/["\n"|\/|" "|"\t"]	{ }
([#][" "]*({DE})[" "]*([A-Za-z]+)(" ")*[0-9]+)/["\n"|\/|" "|"\t"]				{ } 
\/\/(.*)																		{ }
\/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+\/										{ }
[ \n\t] ;
";"				{ return SEMI_COLON; }
","				{ return COMMA; }
("{")			{ current_nesting++; scope_values++; return OPEN_CURLY; }
("}")			{ current_nesting--; return CLOSE_CURLY; }
"("				{ return OPEN_BRACE; }
")"				{ return CLOSE_BRACE; }
("["|"<:")		{ return OPEN_SQR; }
("]"|":>") 		{ return CLOSE_SQR; }
":"				{ return COLON; }
"."				{ return DOT; }
"..."           { return SPREAD;}

"const"		    { insertST(yytext, "Keyword");  return CONST;}
"default"		{ insertST(yytext, "Keyword");  return DEFAULT;}
"char"			{ strcpy(curtype,yytext); insertST(yytext, "Keyword");return CHAR;}
"double"		{ strcpy(curtype,yytext); insertST(yytext, "Keyword"); return DOUBLE;}
"else"			{ insertST(yytext, "Keyword"); return ELSE;}
"float"			{ strcpy(curtype,yytext); insertST(yytext, "Keyword"); return FLOAT;}
"while"			{ insertST(yytext, "Keyword"); return WHILE;}
"do"			{ insertST(yytext, "Keyword"); return DO;}
"for"			{ insertST(yytext, "Keyword"); return FOR;}
"if"			{ insertST(yytext, "Keyword"); return IF;}
"int"			{ strcpy(curtype,yytext); insertST(yytext, "Keyword"); return INT;}
"long"			{ strcpy(curtype,yytext); insertST(yytext, "Keyword"); return LONG;}
"return"		{ insertST(yytext, "Keyword"); return RETURN;}
"short"			{ strcpy(curtype,yytext); insertST(yytext, "Keyword"); return SHORT;}
"signed"		{ strcpy(curtype,yytext); insertST(yytext, "Keyword"); return SIGNED;}
"sizeof" 		{ insertST(yytext, "Keyword"); return SIZEOF;}
"struct"		{ strcpy(curtype,yytext);   insertST(yytext, "Keyword");  return STRUCT;}
"enum"		    { strcpy(curtype,yytext); insertST(yytext, "Keyword");  return ENUM;}
"union"		    { strcpy(curtype,yytext); insertST(yytext, "Keyword");  return UNION;}
"unsigned"		{ insertST(yytext, "Keyword");   return UNSIGNED;}
"void"			{ strcpy(curtype,yytext);   insertST(yytext, "Keyword");  return VOID;}
"break"			{ insertST(yytext, "Keyword");  return BREAK;}
"switch"		{ insertST(yytext, "Keyword");  return SWITCH;}
"case"			{ insertST(yytext, "Keyword");  return CASE;}
"continue"			{ insertST(yytext, "Keyword");  return CONTINUE;}

"int*"			{ strcpy(curtype,yytext); insertST(yytext, "Keyword");return INTs;}
"float*"		{ strcpy(curtype,yytext); insertST(yytext, "Keyword");return FLOATs;}
"char*"			{ strcpy(curtype,yytext); insertST(yytext, "Keyword");return CHARs;}
"double*"		{ strcpy(curtype,yytext); insertST(yytext, "Keyword");return DOUBLEs;}

"auto"          { insertST(yytext, "Keyword"); return AUTO; }
"static"        { insertST(yytext, "Keyword"); return STATIC; }
"register"      { insertST(yytext, "Keyword"); return REGISTER; }
"extern"        { insertST(yytext, "Keyword"); return EXTERN; }
"volatile"      { insertST(yytext, "Keyword"); return EXTERN; }
"inline"        { insertST(yytext, "Keyword"); return INLINE; }

"printf"		{ insertST(yytext, "Keyword");  return PRINTF;}
"scanf"			{ insertST(yytext, "Keyword");  return SCANF;}


"++"            { return INCREMENT_OPERATOR; }
"--"            { return DECREMENT_OPERATOR; }
"<<"            { return LEFTSHIFT_OPERATOR; }
">>"            { return RIGHTSHIFT_OPERATOR; }
"<="            { return LESSTHAN_ASSIGNMENT_OPERATOR; }
"<"             { return LESSTHAN_OPERATOR; }
">="            { return GREATERTHAN_ASSIGNMENT_OPERATOR; }
">"             { return GREATERTHAN_OPERATOR; }
"=="            { return EQUALITY_OPERATOR; }
"!="            { return INEQUALITY_OPERATOR; }
"&&"            { return AND_OPERATOR; }
"||"            { return OR_OPERATOR; }
"^"             { return CARET_OPERATOR; }
"*="            { return MULTIPLICATION_ASSIGNMENT_OPERATOR; }
"/="            { return DIVISION_ASSIGNMENT_OPERATOR; }
"%="            { return MODULO_ASSIGNMENT_OPERATOR; }
"+="            { return ADDITION_ASSIGNMENT_OPERATOR; }
"-="            { return SUBTRACTION_ASSIGNMENT_OPERATOR; }
"<<="           { return LEFTSHIFT_ASSIGNMENT_OPERATOR; }
">>="           { return RIGHTSHIFT_ASSIGNMENT_OPERATOR; }
"&="            { return AND_ASSIGNMENT_OPERATOR; }
"^="            { return XOR_ASSIGNMENT_OPERATOR; }
"|="            { return OR_ASSIGNMENT_OPERATOR; }
"&"             { return AMP_OPERATOR; }
"!"             { return EXCLAMATION_OPERATOR; }
"~"             { return TILDE_OPERATOR; }
"-"             { return SUBTRACT_OPERATOR; }
"+"             { return ADD_OPERATOR; }
"*"             { return MULTIPLICATION_OPERATOR; }
"/"             { return DIVISION_OPERATOR; }
"%"             { return MODULO_OPERATOR; }
"|"             { return PIPE_OPERATOR; }
\=              { return ASSIGNMENT_OPERATOR;}


\"[^\n]*\"/[;|,|\)]             {strcpy(curval,yytext); insertCT(yytext,"String Constant"); return STRING_CONSTANT;}
\'[A-Z|a-z]\'/[;|,|\)|:]        {strcpy(curval,yytext); insertCT(yytext,"Character Constant"); return CHARACTER_CONSTANT;}
[a-z|A-Z]([a-z|A-Z]|[0-9])*/\[      {strcpy(curid,yytext); insertST(yytext, "Array Identifier"); strcat(array_dim_str,"\n");strcat(array_dim_str,yytext); return ARRAY_IDENTIFIER;}
[1-9][0-9]*|0|[;,\s\)\<\>\=\!\|\&\+\-\*\/\%\~\]\}\:\n\t\^]          {strcpy(curval,yytext); insertCT(yytext, "Number Constant"); return INTEGER_CONSTANT;}
([0-9]*)\.([0-9]+)/[;|,|" "|\)|<|>|=|\!|\||&|\+|\-|\*|\/|\%|~|\n|\t|\^]     {strcpy(curval,yytext); insertCT(yytext, "Floating Constant"); return FLOAT_CONSTANT;}
[A-Za-z_][A-Za-z_0-9]* {strcpy(curid,yytext); insertST(curid,"Identifier"); return IDENTIFIER;}

(.?) {
		if(yytext[0]=='#')
		{
			char msg[1000];
			sprintf(msg,"Error in Pre-Processor directive at line no. %d\n",yylineno);
			yyerror(msg);
		}
		else if(yytext[0]=='/')
		{
			char msg[1000];
			sprintf(msg,"ERR_UNMATCHED_COMMENT at line no. %d\n",yylineno);
			yyerror(msg);
		}
		else if(yytext[0]=='"')
		{
			char msg[1000];
			sprintf(msg,"ERR_INCOMPLETE_STRING at line no. %d\n",yylineno);
			yyerror(msg);
		}
		else
		{
			char msg[1000];
			sprintf(msg,"Error at line no. %d\n",yylineno);
			yyerror(msg);
		}
		//printf("%s\n", yytext);
		return 0;
}

%%
