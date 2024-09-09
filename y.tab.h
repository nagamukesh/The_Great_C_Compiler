/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IDENTIFIER = 258,              /* IDENTIFIER  */
    IF = 259,                      /* IF  */
    INT = 260,                     /* INT  */
    CHAR = 261,                    /* CHAR  */
    FLOAT = 262,                   /* FLOAT  */
    DOUBLE = 263,                  /* DOUBLE  */
    LONG = 264,                    /* LONG  */
    SHORT = 265,                   /* SHORT  */
    SIGNED = 266,                  /* SIGNED  */
    UNSIGNED = 267,                /* UNSIGNED  */
    STRUCT = 268,                  /* STRUCT  */
    RETURN = 269,                  /* RETURN  */
    MAIN = 270,                    /* MAIN  */
    VOID = 271,                    /* VOID  */
    WHILE = 272,                   /* WHILE  */
    FOR = 273,                     /* FOR  */
    DO = 274,                      /* DO  */
    BREAK = 275,                   /* BREAK  */
    CONTINUE = 276,                /* CONTINUE  */
    GOTO = 277,                    /* GOTO  */
    ENDIF = 278,                   /* ENDIF  */
    SWITCH = 279,                  /* SWITCH  */
    CASE = 280,                    /* CASE  */
    DEFAULT = 281,                 /* DEFAULT  */
    AUTO = 282,                    /* AUTO  */
    CONST = 283,                   /* CONST  */
    BOOL = 284,                    /* BOOL  */
    STATIC = 285,                  /* STATIC  */
    TYPEDEF = 286,                 /* TYPEDEF  */
    UNION = 287,                   /* UNION  */
    VOLATILE = 288,                /* VOLATILE  */
    integer_constant = 289,        /* integer_constant  */
    string_constant = 290,         /* string_constant  */
    float_constant = 291,          /* float_constant  */
    character_constant = 292,      /* character_constant  */
    RIGHT_ASSIGN = 293,            /* RIGHT_ASSIGN  */
    LEFT_ASSIGN = 294,             /* LEFT_ASSIGN  */
    AND_ASSIGN = 295,              /* AND_ASSIGN  */
    XOR_ASSIGN = 296,              /* XOR_ASSIGN  */
    OR_ASSIGN = 297,               /* OR_ASSIGN  */
    RIGHT_OP = 298,                /* RIGHT_OP  */
    LEFT_OP = 299,                 /* LEFT_OP  */
    PTR_OP = 300,                  /* PTR_OP  */
    ELSE = 301,                    /* ELSE  */
    MOD_EQUAL = 302,               /* MOD_EQUAL  */
    MUL_EQUAL = 303,               /* MUL_EQUAL  */
    DIV_EQUAL = 304,               /* DIV_EQUAL  */
    ADD_EQUAL = 305,               /* ADD_EQUAL  */
    SUB_EQUAL = 306,               /* SUB_EQUAL  */
    OR_OP = 307,                   /* OR_OP  */
    AND_OP = 308,                  /* AND_OP  */
    EQUAL = 309,                   /* EQUAL  */
    NOT_EQUAL = 310,               /* NOT_EQUAL  */
    LESSER_EQUAL = 311,            /* LESSER_EQUAL  */
    LESSER = 312,                  /* LESSER  */
    GREATER_EQUAL = 313,           /* GREATER_EQUAL  */
    GREATER = 314,                 /* GREATER  */
    SIZEOF = 315,                  /* SIZEOF  */
    NOT = 316,                     /* NOT  */
    INCREMENT = 317,               /* INCREMENT  */
    DECREMENT = 318                /* DECREMENT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define IDENTIFIER 258
#define IF 259
#define INT 260
#define CHAR 261
#define FLOAT 262
#define DOUBLE 263
#define LONG 264
#define SHORT 265
#define SIGNED 266
#define UNSIGNED 267
#define STRUCT 268
#define RETURN 269
#define MAIN 270
#define VOID 271
#define WHILE 272
#define FOR 273
#define DO 274
#define BREAK 275
#define CONTINUE 276
#define GOTO 277
#define ENDIF 278
#define SWITCH 279
#define CASE 280
#define DEFAULT 281
#define AUTO 282
#define CONST 283
#define BOOL 284
#define STATIC 285
#define TYPEDEF 286
#define UNION 287
#define VOLATILE 288
#define integer_constant 289
#define string_constant 290
#define float_constant 291
#define character_constant 292
#define RIGHT_ASSIGN 293
#define LEFT_ASSIGN 294
#define AND_ASSIGN 295
#define XOR_ASSIGN 296
#define OR_ASSIGN 297
#define RIGHT_OP 298
#define LEFT_OP 299
#define PTR_OP 300
#define ELSE 301
#define MOD_EQUAL 302
#define MUL_EQUAL 303
#define DIV_EQUAL 304
#define ADD_EQUAL 305
#define SUB_EQUAL 306
#define OR_OP 307
#define AND_OP 308
#define EQUAL 309
#define NOT_EQUAL 310
#define LESSER_EQUAL 311
#define LESSER 312
#define GREATER_EQUAL 313
#define GREATER 314
#define SIZEOF 315
#define NOT 316
#define INCREMENT 317
#define DECREMENT 318

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 26 "parser.y"

    char* string;

#line 197 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
