%{
	#include <stdio.h>
	#include <string.h>
	#include "y.tab.h"

	struct ConstantTable{
		char constant_name[100];
		char constant_type[100];
		int exist;
	}CT[1000];
	
	struct SymbolTable{
		char symbol_name[100];
		char symbol_type[100];
        char array_dimensions[100];
		char class[100];
        char value[100];
        char parameters[100];
        int line_number;
		int exist;
	}ST[1000];

	unsigned long hash(unsigned char *str)
	{
		unsigned long hash = 5381;
		int c;

		while (c = *str++)
			hash = ((hash << 5) + hash) + c;

		return hash;
	}

	int search_ConstantTable(char* str){
		unsigned long temp_val = hash(str);
		int val = temp_val%1000;
		
		if(CT[val].exist == 0){
			return 0;
		}
		
		else if(strcmp(CT[val].constant_name, str) == 0)
		{
			return 1;
		}
		else
		{
			for(int i = val+1 ; i!=val ; i = (i+1)%1000)
			{
				if(strcmp(CT[i].constant_name,str)==0)
				{
					return 1;
				}
			}
			return 0;
		}
	}

	
	int search_SymbolTable(char* str){
		unsigned long temp_val = hash(str);
		int val = temp_val%1000;
		
		if(ST[val].exist == 0){
			return 0;
		}
		
		else if(strcmp(ST[val].symbol_name, str) == 0)
		{
			return 1;
		}
		else
		{
			for(int i = val+1 ; i!=val ; i = (i+1)%1000)
			{
				if(strcmp(ST[i].symbol_name,str)==0)
				{
					return 1;
				}
			}
			return 0;
		}
	}
	
	
	void insert_ConstantTable(char* name, char* type){
		int index = 0;
		 if(search_ConstantTable(name)){
			return;
		}
		else{
			unsigned long temp_val = hash(name);
			int val = temp_val%1000;
			if(CT[val].exist == 0){
				strcpy(CT[val].constant_name, name);
				strcpy(CT[val].constant_type, type);
				CT[val].exist = 1;
				return;
			}
			
			for(int i = val+1; i != val; i = (i+1)%1000){
				if(CT[i].exist == 0){
					index = i;
					break;
				}
			}
			strcpy(CT[index].constant_name, name);
			strcpy(CT[index].constant_type, type);
			CT[index].exist = 1;			
		}
	}
	
	void insert_SymbolTable(char* name, char* class){
		int index = 0;
		//printf("BBBB");
		 if(search_SymbolTable(name)){
			//printf("AAAAAA");
			return;
		}
		else{
			unsigned long temp_val = hash(name);
			int val = temp_val%1000;
			if(ST[val].exist == 0){
				strcpy(ST[val].symbol_name, name);
				strcpy(ST[val].class, class);
                ST[val].line_number = yylineno;
				ST[val].exist = 1;
				return;
			}
			
			for(int i = val+1; i != val; i = (i+1)%1000){
				if(ST[i].exist == 0){
					index = i;
					break;
				}
			}
			strcpy(ST[index].symbol_name, name);
			strcpy(ST[val].class, class);
			ST[index].exist = 1;			
		}
	}

	void insert_SymbolTable_type(char *str1, char *str2)
	{
		for(int i = 0 ; i < 1000 ; i++)
		{
			if(strcmp(ST[i].symbol_name,str1)==0)
			{
				strcpy(ST[i].symbol_type,str2);
			}
		}
    }

	void insert_SymbolTable_value(char *str1, char *str2)
	{
		for(int i = 0 ; i < 1000 ; i++)
		{
			if(strcmp(ST[i].symbol_name,str1)==0)
			{
				strcpy(ST[i].value,str2);
			}
		}
	}

    void insert_SymbolTable_arraydim(char *str1, char *dim)
	{
		for(int i = 0 ; i < 1000 ; i++)
		{
			if(strcmp(ST[i].symbol_name,str1)==0)
			{
				strcpy(ST[i].array_dimensions,dim);
			}
		}
	}

    void insert_SymbolTable_funcparam(char *str1, char *param)
	{
		for(int i = 0 ; i < 1000 ; i++)
		{
			if(strcmp(ST[i].symbol_name,str1)==0)
			{
				strcat(ST[i].parameters," ");
                strcat(ST[i].parameters,param);
			}
		}
	}

	void insert_SymbolTable_line(char *str1, int line)
	{
		for(int i = 0 ; i < 1000 ; i++)
		{
			if(strcmp(ST[i].symbol_name,str1)==0)
			{
				ST[i].line_number = line;
			}
		}
	}

	void printConstantTable(){
		printf("%20s | %20s\n", "CONSTANT","TYPE");
		for(int i = 0; i < 1000; ++i){
			if(CT[i].exist == 0)
				continue;
				
			printf("%20s | %20s\n", CT[i].constant_name, CT[i].constant_type);
		}
	}

	void printSymbolTable(){
        printf("%10s | %18s | %10s | %10s | %10s | %10s | %10s\n","SYMBOL", "CLASS", "TYPE","VALUE","DIMENSIONS","PARAMETERS","LINE NO");
		for(int i = 0; i < 1000; ++i){
			if(ST[i].exist == 0)
				continue;
			printf("%10s | %18s | %10s | %10s | %10s | %10s | %d\n", ST[i].symbol_name, ST[i].class, ST[i].symbol_type, ST[i].value,ST[i].array_dimensions,ST[i].parameters, ST[i].line_number);
		}
	}
	char current_identifier[20];
	char current_type[20];
	char current_value[20];
    char current_function[20];
	char previous_operator[20];
	extern int flag;

%}

num              	[0-9]
alpha              	[a-zA-Z]
alphanum            {alpha}|{num}
escape_sequences    0|a|b|f|n|r|t|v|"\\"|"\""|"\'"
ws  				[ \t\r\f\v]+
%x MLCOMMENT
DE "define"
IN "include"

%%

	int nested_count = 0;
	int check_nested = 0;

\n 	{yylineno++;}
"#include"[ ]*"<"{alpha}({alphanum})*".h>"                                  	{ }
"#define"[ ]+(_|{alpha})({alphanum})*[ ]*(.)+                                   { } 
"//".*  																		{ }

"/*"             							 { BEGIN MLCOMMENT; }
<MLCOMMENT>"/*"							 	 { ++nested_count; 
												check_nested = 1;
											 }	
<MLCOMMENT>"*"+"/"        					 { if (nested_count) --nested_count;
											   else{ if(check_nested){
														check_nested = 0;
														BEGIN INITIAL;
														}
													 else{
														BEGIN INITIAL;
													}
											    } 
											 }
<MLCOMMENT>"*"+           					 ; 
<MLCOMMENT>[^/*\n]+						 	 ;
<MLCOMMENT>[/]    							 ;
<MLCOMMENT>\n     							 ;
<MLCOMMENT><<EOF>>							 { printf("Line No. %d ERROR: MULTI LINE COMMENT NOT CLOSED\n", yylineno); return 0;}

"["                                          {return *yytext;}
"]"                                          {return *yytext;}
"("                                          {return *yytext;}
")"                                          {return *yytext;}
"{"                                          {return *yytext;}
"}"                                          {return *yytext;}
","                                          {return *yytext;}
";"                                          {return *yytext;}



"char"			{ strcpy(current_type,yytext); insert_SymbolTable(yytext, "Keyword"); return CHAR;}
"double"		{ strcpy(current_type,yytext); insert_SymbolTable(yytext, "Keyword"); return DOUBLE;}
"else"			{ insert_SymbolTable_line(yytext, yylineno); insert_SymbolTable(yytext, "Keyword"); return ELSE;}
"float"			{ strcpy(current_type,yytext); insert_SymbolTable(yytext, "Keyword");return FLOAT;}
"while"			{ insert_SymbolTable(yytext, "Keyword"); return WHILE;}
"do"			{ insert_SymbolTable(yytext, "Keyword"); return DO;}
"for"			{ insert_SymbolTable(yytext, "Keyword"); return FOR;}
"if"			{ insert_SymbolTable(yytext, "Keyword"); return IF;}
"int"			{ strcpy(current_type,yytext); insert_SymbolTable(yytext, "Keyword");return INT;}
"long"			{ strcpy(current_type,yytext); insert_SymbolTable(yytext, "Keyword");  return LONG;}
"return"		{ insert_SymbolTable(yytext, "Keyword");  return RETURN;}
"short"			{ strcpy(current_type,yytext); insert_SymbolTable(yytext, "Keyword");  return SHORT;}
"signed"		{ strcpy(current_type,yytext); insert_SymbolTable(yytext, "Keyword");  return SIGNED;}
"sizeof" 		{ insert_SymbolTable(yytext, "Keyword");  return SIZEOF;}
"struct" 		{ strcpy(current_type,yytext); insert_SymbolTable(yytext, "Keyword");  return STRUCT;}
"unsigned"		{ insert_SymbolTable(yytext, "Keyword");  return UNSIGNED;}
"void"			{ strcpy(current_type,yytext); insert_SymbolTable(yytext, "Keyword");  return VOID;}
"break"			{ insert_SymbolTable(yytext, "Keyword");  return BREAK;}
"continue"		{ insert_SymbolTable(yytext, "Keyword");  return CONTINUE;}
"goto"			{ insert_SymbolTable(yytext, "Keyword");  return GOTO;}
"switch"		{ insert_SymbolTable(yytext, "Keyword");  return SWITCH;}
"case"			{ insert_SymbolTable(yytext, "Keyword");  return CASE;}
"default"		{ insert_SymbolTable(yytext, "Keyword");  return DEFAULT;}

("\"")[^\n\"]*("\"")                         {strcpy(current_value,yytext); insert_ConstantTable(yytext,"String Constant"); return string_constant;}        
("\"")[^\n\"]*                               { printf("Line No. %d ERROR: UNCLOSED STRING - %s\n", yylineno, yytext); return 0;}
("\'")(("\\"({escape_sequences}))|.)("\'")   {strcpy(current_value,yytext); insert_ConstantTable(yytext,"Character Constant"); return character_constant;}
("\'")(((("\\")[^0abfnrtv\\\"\'][^\n\']*))|[^\n\''][^\n\'']+)("\'") {printf("Line No. %d ERROR: NOT A CHARACTER - %s\n", yylineno, yytext); return 0; }
{num}+(\.{num}+)?e{num}+   		        {strcpy(current_value,yytext); insert_ConstantTable(yytext, "Floating Constant"); return float_constant;} 
{num}+\.{num}+                		    {strcpy(current_value,yytext); insert_ConstantTable(yytext, "Floating Constant"); return float_constant;}                                             
{num}+                           	   	{strcpy(current_value,yytext); insert_ConstantTable(yytext, "Number Constant"); return integer_constant;}    
(_|{alpha})({alpha}|{alpha}|_)*  		{strcpy(current_identifier,yytext);insert_SymbolTable(yytext,"Identifier");  return identifier;}
(_|{alpha})({alpha}|{alpha}|_)*/\[  	{strcpy(current_identifier,yytext);insert_SymbolTable(yytext,"Array Identifier");  return identifier;}
{ws}										 ;

"+"											 {return *yytext;}
"-"											 {return *yytext;}
"*"											 {return *yytext;}
"/"											 {return *yytext;}
"="											 {return *yytext;}
"%"											 {return *yytext;}
"&"											 {return *yytext; }
"^"											 {return *yytext; }
"++"										 {return INCREMENT;}
"--"										 {return DECREMENT;}
"!"											 {return NOT;}
"+="										 {return ADD_EQUAL;}
"-="										 {return SUBTRACT_EQUAL;}
"*="										 {return MULTIPLY_EQUAL;}
"/="										 {return DIVIDE_EQUAL;}
"%="										 {return MOD_EQUAL;}
"&&"										 {return AND_AND;}



"||"										 {return OR_OR;}
">"											 {return GREAT;}
"<"											 {return LESS;}
">="										 {return GREAT_EQUAL;}
"<="										 {return LESS_EQUAL;}
"=="										 {return EQUAL;}
"!="										 {return NOT_EQUAL;}
.											 { flag = 1;
											   if(yytext[0] == '#')
													printf("Line No. %d PREPROCESSOR ERROR - %s\n", yylineno, yytext);
											   else
													printf("Line No. %d ERROR ILLEGAL CHARACTER - %s\n", yylineno, yytext);
											  return 0;}

%%