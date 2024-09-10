/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "parser.y"

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


#line 96 "y.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
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

#line 279 "y.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_IDENTIFIER = 3,                 /* IDENTIFIER  */
  YYSYMBOL_IF = 4,                         /* IF  */
  YYSYMBOL_INT = 5,                        /* INT  */
  YYSYMBOL_CHAR = 6,                       /* CHAR  */
  YYSYMBOL_FLOAT = 7,                      /* FLOAT  */
  YYSYMBOL_DOUBLE = 8,                     /* DOUBLE  */
  YYSYMBOL_LONG = 9,                       /* LONG  */
  YYSYMBOL_SHORT = 10,                     /* SHORT  */
  YYSYMBOL_SIGNED = 11,                    /* SIGNED  */
  YYSYMBOL_UNSIGNED = 12,                  /* UNSIGNED  */
  YYSYMBOL_STRUCT = 13,                    /* STRUCT  */
  YYSYMBOL_RETURN = 14,                    /* RETURN  */
  YYSYMBOL_MAIN = 15,                      /* MAIN  */
  YYSYMBOL_VOID = 16,                      /* VOID  */
  YYSYMBOL_WHILE = 17,                     /* WHILE  */
  YYSYMBOL_FOR = 18,                       /* FOR  */
  YYSYMBOL_DO = 19,                        /* DO  */
  YYSYMBOL_BREAK = 20,                     /* BREAK  */
  YYSYMBOL_CONTINUE = 21,                  /* CONTINUE  */
  YYSYMBOL_GOTO = 22,                      /* GOTO  */
  YYSYMBOL_ENDIF = 23,                     /* ENDIF  */
  YYSYMBOL_SWITCH = 24,                    /* SWITCH  */
  YYSYMBOL_CASE = 25,                      /* CASE  */
  YYSYMBOL_DEFAULT = 26,                   /* DEFAULT  */
  YYSYMBOL_AUTO = 27,                      /* AUTO  */
  YYSYMBOL_CONST = 28,                     /* CONST  */
  YYSYMBOL_BOOL = 29,                      /* BOOL  */
  YYSYMBOL_STATIC = 30,                    /* STATIC  */
  YYSYMBOL_TYPEDEF = 31,                   /* TYPEDEF  */
  YYSYMBOL_UNION = 32,                     /* UNION  */
  YYSYMBOL_VOLATILE = 33,                  /* VOLATILE  */
  YYSYMBOL_integer_constant = 34,          /* integer_constant  */
  YYSYMBOL_string_constant = 35,           /* string_constant  */
  YYSYMBOL_float_constant = 36,            /* float_constant  */
  YYSYMBOL_character_constant = 37,        /* character_constant  */
  YYSYMBOL_RIGHT_ASSIGN = 38,              /* RIGHT_ASSIGN  */
  YYSYMBOL_LEFT_ASSIGN = 39,               /* LEFT_ASSIGN  */
  YYSYMBOL_AND_ASSIGN = 40,                /* AND_ASSIGN  */
  YYSYMBOL_XOR_ASSIGN = 41,                /* XOR_ASSIGN  */
  YYSYMBOL_OR_ASSIGN = 42,                 /* OR_ASSIGN  */
  YYSYMBOL_RIGHT_OP = 43,                  /* RIGHT_OP  */
  YYSYMBOL_LEFT_OP = 44,                   /* LEFT_OP  */
  YYSYMBOL_PTR_OP = 45,                    /* PTR_OP  */
  YYSYMBOL_ELSE = 46,                      /* ELSE  */
  YYSYMBOL_MOD_EQUAL = 47,                 /* MOD_EQUAL  */
  YYSYMBOL_MUL_EQUAL = 48,                 /* MUL_EQUAL  */
  YYSYMBOL_DIV_EQUAL = 49,                 /* DIV_EQUAL  */
  YYSYMBOL_ADD_EQUAL = 50,                 /* ADD_EQUAL  */
  YYSYMBOL_SUB_EQUAL = 51,                 /* SUB_EQUAL  */
  YYSYMBOL_52_ = 52,                       /* '='  */
  YYSYMBOL_OR_OP = 53,                     /* OR_OP  */
  YYSYMBOL_AND_OP = 54,                    /* AND_OP  */
  YYSYMBOL_55_ = 55,                       /* '^'  */
  YYSYMBOL_EQUAL = 56,                     /* EQUAL  */
  YYSYMBOL_NOT_EQUAL = 57,                 /* NOT_EQUAL  */
  YYSYMBOL_LESSER_EQUAL = 58,              /* LESSER_EQUAL  */
  YYSYMBOL_LESSER = 59,                    /* LESSER  */
  YYSYMBOL_GREATER_EQUAL = 60,             /* GREATER_EQUAL  */
  YYSYMBOL_GREATER = 61,                   /* GREATER  */
  YYSYMBOL_62_ = 62,                       /* '+'  */
  YYSYMBOL_63_ = 63,                       /* '-'  */
  YYSYMBOL_64_ = 64,                       /* '*'  */
  YYSYMBOL_65_ = 65,                       /* '/'  */
  YYSYMBOL_66_ = 66,                       /* '%'  */
  YYSYMBOL_SIZEOF = 67,                    /* SIZEOF  */
  YYSYMBOL_NOT = 68,                       /* NOT  */
  YYSYMBOL_INCREMENT = 69,                 /* INCREMENT  */
  YYSYMBOL_DECREMENT = 70,                 /* DECREMENT  */
  YYSYMBOL_71_ = 71,                       /* '{'  */
  YYSYMBOL_72_ = 72,                       /* '}'  */
  YYSYMBOL_73_ = 73,                       /* ';'  */
  YYSYMBOL_74_ = 74,                       /* ','  */
  YYSYMBOL_75_ = 75,                       /* '['  */
  YYSYMBOL_76_ = 76,                       /* ']'  */
  YYSYMBOL_77_ = 77,                       /* '('  */
  YYSYMBOL_78_ = 78,                       /* ')'  */
  YYSYMBOL_79_ = 79,                       /* '.'  */
  YYSYMBOL_YYACCEPT = 80,                  /* $accept  */
  YYSYMBOL_state = 81,                     /* state  */
  YYSYMBOL_declarations = 82,              /* declarations  */
  YYSYMBOL_declaration = 83,               /* declaration  */
  YYSYMBOL_structure_dec = 84,             /* structure_dec  */
  YYSYMBOL_85_1 = 85,                      /* $@1  */
  YYSYMBOL_structure_content = 86,         /* structure_content  */
  YYSYMBOL_variable_dec = 87,              /* variable_dec  */
  YYSYMBOL_structure_initialize = 88,      /* structure_initialize  */
  YYSYMBOL_variables = 89,                 /* variables  */
  YYSYMBOL_multiple_variables = 90,        /* multiple_variables  */
  YYSYMBOL_identifier_name = 91,           /* identifier_name  */
  YYSYMBOL_92_2 = 92,                      /* $@2  */
  YYSYMBOL_extended_identifier = 93,       /* extended_identifier  */
  YYSYMBOL_94_3 = 94,                      /* $@3  */
  YYSYMBOL_array_identifier = 95,          /* array_identifier  */
  YYSYMBOL_array_dims = 96,                /* array_dims  */
  YYSYMBOL_97_4 = 97,                      /* $@4  */
  YYSYMBOL_initilization = 98,             /* initilization  */
  YYSYMBOL_string_initilization = 99,      /* string_initilization  */
  YYSYMBOL_100_5 = 100,                    /* $@5  */
  YYSYMBOL_array_initialization = 101,     /* array_initialization  */
  YYSYMBOL_102_6 = 102,                    /* $@6  */
  YYSYMBOL_array_values = 103,             /* array_values  */
  YYSYMBOL_multiple_array_values = 104,    /* multiple_array_values  */
  YYSYMBOL_datatype = 105,                 /* datatype  */
  YYSYMBOL_unsigned_grammar = 106,         /* unsigned_grammar  */
  YYSYMBOL_signed_grammar = 107,           /* signed_grammar  */
  YYSYMBOL_long_grammar = 108,             /* long_grammar  */
  YYSYMBOL_short_grammar = 109,            /* short_grammar  */
  YYSYMBOL_function_dec = 110,             /* function_dec  */
  YYSYMBOL_function_name = 111,            /* function_name  */
  YYSYMBOL_function_data = 112,            /* function_data  */
  YYSYMBOL_parameters = 113,               /* parameters  */
  YYSYMBOL_all_parameter_identifiers = 114, /* all_parameter_identifiers  */
  YYSYMBOL_multiple_parameters = 115,      /* multiple_parameters  */
  YYSYMBOL_parameter_identifier = 116,     /* parameter_identifier  */
  YYSYMBOL_117_7 = 117,                    /* $@7  */
  YYSYMBOL_extended_parameter = 118,       /* extended_parameter  */
  YYSYMBOL_statement = 119,                /* statement  */
  YYSYMBOL_multiple_statement = 120,       /* multiple_statement  */
  YYSYMBOL_statments = 121,                /* statments  */
  YYSYMBOL_expression_statment = 122,      /* expression_statment  */
  YYSYMBOL_conditional_statements = 123,   /* conditional_statements  */
  YYSYMBOL_extended_conditional_statements = 124, /* extended_conditional_statements  */
  YYSYMBOL_iterative_statements = 125,     /* iterative_statements  */
  YYSYMBOL_for_initialization = 126,       /* for_initialization  */
  YYSYMBOL_return_statement = 127,         /* return_statement  */
  YYSYMBOL_return_suffix = 128,            /* return_suffix  */
  YYSYMBOL_break_statement = 129,          /* break_statement  */
  YYSYMBOL_expression = 130,               /* expression  */
  YYSYMBOL_expressions = 131,              /* expressions  */
  YYSYMBOL_132_8 = 132,                    /* $@8  */
  YYSYMBOL_133_9 = 133,                    /* $@9  */
  YYSYMBOL_134_10 = 134,                   /* $@10  */
  YYSYMBOL_135_11 = 135,                   /* $@11  */
  YYSYMBOL_136_12 = 136,                   /* $@12  */
  YYSYMBOL_137_13 = 137,                   /* $@13  */
  YYSYMBOL_simple_expression = 138,        /* simple_expression  */
  YYSYMBOL_simple_expression_breakup = 139, /* simple_expression_breakup  */
  YYSYMBOL_and_expression = 140,           /* and_expression  */
  YYSYMBOL_and_expression_breakup = 141,   /* and_expression_breakup  */
  YYSYMBOL_unary_relation_expression = 142, /* unary_relation_expression  */
  YYSYMBOL_regular_expression = 143,       /* regular_expression  */
  YYSYMBOL_regular_expression_breakup = 144, /* regular_expression_breakup  */
  YYSYMBOL_relational_operators = 145,     /* relational_operators  */
  YYSYMBOL_sum_expression = 146,           /* sum_expression  */
  YYSYMBOL_sum_operators = 147,            /* sum_operators  */
  YYSYMBOL_term = 148,                     /* term  */
  YYSYMBOL_multiply_operators = 149,       /* multiply_operators  */
  YYSYMBOL_factor = 150,                   /* factor  */
  YYSYMBOL_iden = 151,                     /* iden  */
  YYSYMBOL_extended_iden = 152,            /* extended_iden  */
  YYSYMBOL_func = 153,                     /* func  */
  YYSYMBOL_154_14 = 154,                   /* $@14  */
  YYSYMBOL_func_call = 155,                /* func_call  */
  YYSYMBOL_156_15 = 156,                   /* $@15  */
  YYSYMBOL_arguments = 157,                /* arguments  */
  YYSYMBOL_arguments_list = 158,           /* arguments_list  */
  YYSYMBOL_extended_arguments = 159,       /* extended_arguments  */
  YYSYMBOL_constant = 160                  /* constant  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  33
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   246

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  80
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  81
/* YYNRULES -- Number of rules.  */
#define YYNRULES  159
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  243

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   318


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,    66,     2,     2,
      77,    78,    64,    62,    74,    63,    79,    65,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    73,
       2,    52,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    75,     2,    76,    55,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    71,     2,    72,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    53,    54,    56,
      57,    58,    59,    60,    61,    67,    68,    69,    70
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    71,    71,    74,    75,    79,    80,    81,    84,    84,
      86,    86,    89,    90,    93,    96,    99,   100,   103,   103,
     105,   105,   105,   108,   109,   112,   112,   113,   116,   117,
     118,   121,   121,   124,   124,   127,   130,   131,   135,   135,
     135,   135,   136,   137,   138,   139,   140,   143,   143,   143,
     143,   146,   146,   146,   146,   149,   149,   152,   152,   155,
     157,   159,   160,   163,   164,   168,   171,   172,   175,   175,
     178,   179,   182,   182,   183,   183,   184,   184,   185,   188,
     191,   192,   195,   196,   199,   202,   203,   206,   207,   208,
     211,   212,   213,   216,   219,   220,   223,   226,   227,   230,
     230,   231,   231,   232,   232,   233,   233,   234,   234,   235,
     235,   236,   237,   240,   243,   243,   246,   249,   250,   253,
     254,   257,   260,   261,   264,   265,   266,   267,   268,   269,
     272,   273,   276,   277,   280,   281,   284,   284,   284,   287,
     287,   290,   291,   294,   295,   298,   298,   299,   299,   302,
     302,   305,   305,   308,   311,   312,   315,   316,   317,   318
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "IDENTIFIER", "IF",
  "INT", "CHAR", "FLOAT", "DOUBLE", "LONG", "SHORT", "SIGNED", "UNSIGNED",
  "STRUCT", "RETURN", "MAIN", "VOID", "WHILE", "FOR", "DO", "BREAK",
  "CONTINUE", "GOTO", "ENDIF", "SWITCH", "CASE", "DEFAULT", "AUTO",
  "CONST", "BOOL", "STATIC", "TYPEDEF", "UNION", "VOLATILE",
  "integer_constant", "string_constant", "float_constant",
  "character_constant", "RIGHT_ASSIGN", "LEFT_ASSIGN", "AND_ASSIGN",
  "XOR_ASSIGN", "OR_ASSIGN", "RIGHT_OP", "LEFT_OP", "PTR_OP", "ELSE",
  "MOD_EQUAL", "MUL_EQUAL", "DIV_EQUAL", "ADD_EQUAL", "SUB_EQUAL", "'='",
  "OR_OP", "AND_OP", "'^'", "EQUAL", "NOT_EQUAL", "LESSER_EQUAL", "LESSER",
  "GREATER_EQUAL", "GREATER", "'+'", "'-'", "'*'", "'/'", "'%'", "SIZEOF",
  "NOT", "INCREMENT", "DECREMENT", "'{'", "'}'", "';'", "','", "'['",
  "']'", "'('", "')'", "'.'", "$accept", "state", "declarations",
  "declaration", "structure_dec", "$@1", "structure_content",
  "variable_dec", "structure_initialize", "variables",
  "multiple_variables", "identifier_name", "$@2", "extended_identifier",
  "$@3", "array_identifier", "array_dims", "$@4", "initilization",
  "string_initilization", "$@5", "array_initialization", "$@6",
  "array_values", "multiple_array_values", "datatype", "unsigned_grammar",
  "signed_grammar", "long_grammar", "short_grammar", "function_dec",
  "function_name", "function_data", "parameters",
  "all_parameter_identifiers", "multiple_parameters",
  "parameter_identifier", "$@7", "extended_parameter", "statement",
  "multiple_statement", "statments", "expression_statment",
  "conditional_statements", "extended_conditional_statements",
  "iterative_statements", "for_initialization", "return_statement",
  "return_suffix", "break_statement", "expression", "expressions", "$@8",
  "$@9", "$@10", "$@11", "$@12", "$@13", "simple_expression",
  "simple_expression_breakup", "and_expression", "and_expression_breakup",
  "unary_relation_expression", "regular_expression",
  "regular_expression_breakup", "relational_operators", "sum_expression",
  "sum_operators", "term", "multiply_operators", "factor", "iden",
  "extended_iden", "func", "$@14", "func_call", "$@15", "arguments",
  "arguments_list", "extended_arguments", "constant", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-106)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-61)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     174,  -106,  -106,  -106,  -106,    -2,    24,    23,    66,    28,
    -106,    34,  -106,   174,  -106,  -106,  -106,    44,  -106,    -5,
    -106,  -106,  -106,  -106,  -106,    -2,    24,  -106,  -106,    -2,
      24,  -106,    50,  -106,  -106,    -4,     6,    11,   213,  -106,
    -106,  -106,  -106,  -106,    25,  -106,   -45,  -106,    50,  -106,
      98,    26,   194,  -106,    -8,  -106,  -106,  -106,  -106,  -106,
      31,    35,    99,    36,   194,    50,    21,  -106,    57,  -106,
      37,   213,  -106,   140,  -106,    50,    40,  -106,    45,  -106,
    -106,  -106,  -106,    21,  -106,  -106,  -106,    68,    70,  -106,
      78,   -24,  -106,   119,  -106,  -106,  -106,    47,  -106,  -106,
      51,  -106,  -106,    52,     1,    53,    54,   140,    59,   140,
    -106,  -106,   140,  -106,    90,  -106,  -106,  -106,  -106,  -106,
      91,  -106,  -106,  -106,   -14,    21,    21,  -106,    21,  -106,
    -106,  -106,  -106,  -106,  -106,  -106,  -106,  -106,  -106,    56,
      56,  -106,  -106,  -106,    56,  -106,  -106,  -106,  -106,  -106,
    -106,  -106,  -106,    21,   125,  -106,  -106,   111,   137,  -106,
      21,  -106,  -106,   100,    21,     9,   161,  -106,   120,  -106,
    -106,  -106,    21,   113,    68,    70,   -54,   -24,  -106,    21,
      21,    21,    21,    21,    21,   117,  -106,   124,  -106,  -106,
    -106,  -106,   118,  -106,   131,  -106,  -106,    21,   139,   138,
    -106,   123,   136,  -106,  -106,  -106,  -106,  -106,  -106,  -106,
    -106,  -106,  -106,  -106,   145,   140,   140,   153,  -106,    21,
      21,  -106,  -106,   193,   182,  -106,    21,   152,   123,   157,
     160,   140,  -106,   155,   162,  -106,   193,  -106,  -106,  -106,
    -106,  -106,  -106
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       4,    38,    39,    40,    41,    56,    58,    54,    50,     0,
      46,     0,     2,     4,     7,     5,    13,     0,     6,     0,
      55,    42,    57,    43,    51,    56,    58,    45,    47,    56,
      58,    44,     8,     1,     3,    18,     0,    17,    64,    52,
      53,    48,    49,    18,     0,    14,    24,    12,     0,    15,
       0,     0,    11,    21,     0,    19,    20,    16,    68,    63,
      67,    62,     0,     0,    11,     0,     0,    25,     0,    23,
      71,    64,    65,    81,    59,     0,     0,    10,   141,   156,
     157,   158,   159,     0,   145,    22,    98,   115,   118,   120,
     123,   131,   135,   140,   139,   147,   148,     0,    31,    27,
       0,    69,    66,     0,     0,     0,     0,     0,     0,    81,
      83,    78,    81,    73,     0,    72,    74,    75,    76,    77,
       0,     9,   149,   119,   140,     0,     0,   113,     0,   116,
     128,   129,   125,   127,   124,   126,   132,   133,   121,     0,
       0,   136,   137,   138,     0,   109,   105,   107,   101,   103,
      99,   111,   112,     0,     0,    97,   142,    30,     0,    70,
       0,    94,    93,     0,     0,     0,     0,    96,     0,    80,
      61,    82,   152,     0,   115,   118,   122,   130,   134,     0,
       0,     0,     0,     0,     0,     0,   144,    31,    26,    28,
      29,    32,     0,    95,     0,    92,    90,     0,     0,     0,
      79,   155,     0,   151,   146,   114,   117,   110,   106,   108,
     102,   104,   100,   143,     0,     0,     0,     0,    91,     0,
       0,   153,   150,     0,    86,    87,     0,     0,   155,    37,
       0,     0,    84,     0,     0,   154,     0,    35,    34,    85,
      88,    89,    36
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -106,  -106,   221,  -106,  -106,  -106,   172,     0,  -106,   -21,
    -106,  -106,  -106,  -106,  -106,  -106,  -106,  -106,  -106,    80,
    -106,  -106,  -106,     2,  -106,    10,  -106,  -106,    55,    69,
    -106,  -106,  -106,   168,  -106,  -106,  -106,  -106,  -106,  -105,
    -106,   -15,  -106,  -106,  -106,  -106,  -106,  -106,  -106,  -106,
     -65,  -106,  -106,  -106,  -106,  -106,  -106,  -106,   -94,    67,
     114,    71,   -78,  -106,  -106,  -106,   103,  -106,   104,  -106,
     101,   -77,  -106,  -106,  -106,  -106,  -106,  -106,  -106,    15,
    -106
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,    11,    12,    13,    14,    44,    63,   111,    16,    36,
      49,    37,    46,    55,    66,    56,    69,    97,   188,    99,
     158,   190,   214,   230,   237,    65,    31,    27,    21,    23,
      18,    19,    74,    51,    59,    72,    60,    70,   101,   112,
     113,   114,   115,   116,   232,   117,   197,   118,   162,   119,
     120,   155,   184,   182,   183,   180,   181,   179,    86,   127,
      87,   129,    88,    89,   138,   139,    90,   140,    91,   144,
      92,    93,   156,    94,   125,    95,   172,   202,   203,   221,
      96
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      15,    85,   166,    20,    78,   123,   124,    53,   136,   137,
      17,    45,    78,    15,     1,     2,     3,     4,     5,     6,
       7,     8,    62,    17,    78,    10,    67,    57,    24,    22,
      54,    32,    25,    26,    33,    79,    80,    81,    82,   163,
     141,   142,   143,    79,    80,    81,    82,    35,    50,   124,
     175,   124,    64,    43,    45,    79,    80,    81,    82,    78,
     173,   153,   124,   124,    64,   154,   192,   124,    68,    83,
     194,    28,    38,   -60,   161,    29,    30,    83,    84,    47,
      39,    50,   195,   124,    41,    48,    84,   124,   185,    83,
      79,    80,    81,    82,   168,    40,    52,   169,    84,    42,
     198,    58,    75,   217,    61,    71,    73,   201,    76,    98,
     224,   225,   100,   121,   207,   208,   209,   210,   211,   212,
     124,   126,   122,   157,   128,   227,   239,   159,   186,   160,
     164,   165,   167,    84,   130,   131,   132,   133,   134,   135,
     136,   137,   124,    78,   103,     1,     2,     3,     4,     5,
       6,     7,     8,    62,   104,   228,    10,   105,   106,   107,
     108,   233,   170,   187,   171,   196,   145,   146,   147,   148,
     149,   150,   191,   193,    79,    80,    81,    82,   199,     1,
       2,     3,     4,     5,     6,     7,     8,     9,   151,   152,
      10,   204,   200,   213,   153,   -33,   215,   220,   154,     1,
       2,     3,     4,     5,     6,     7,     8,    62,    83,   216,
      10,   109,   218,   110,   222,   219,   223,    84,     1,     2,
       3,     4,     5,     6,     7,     8,   226,   229,   231,    10,
     234,   236,   238,   240,    34,   241,    77,   189,   242,   102,
     174,   205,   176,   235,   177,   178,   206
};

static const yytype_uint8 yycheck[] =
{
       0,    66,   107,     5,     3,    83,    83,    52,    62,    63,
       0,    32,     3,    13,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    13,     3,    16,    34,    48,     5,     5,
      75,     3,     9,    10,     0,    34,    35,    36,    37,   104,
      64,    65,    66,    34,    35,    36,    37,     3,    38,   126,
     128,   128,    52,     3,    75,    34,    35,    36,    37,     3,
     125,    75,   139,   140,    64,    79,   160,   144,    76,    68,
     164,     5,    77,    77,    73,     9,    10,    68,    77,    73,
      25,    71,    73,   160,    29,    74,    77,   164,   153,    68,
      34,    35,    36,    37,   109,    26,    71,   112,    77,    30,
     165,     3,     3,   197,    78,    74,    71,   172,    72,    52,
     215,   216,    75,    73,   179,   180,   181,   182,   183,   184,
     197,    53,    77,    76,    54,   219,   231,    76,     3,    77,
      77,    77,    73,    77,    56,    57,    58,    59,    60,    61,
      62,    63,   219,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,   220,    16,    17,    18,    19,
      20,   226,    72,    52,    73,   165,    47,    48,    49,    50,
      51,    52,    35,    73,    34,    35,    36,    37,    17,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    69,    70,
      16,    78,    72,    76,    75,    71,    78,    74,    79,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    68,    78,
      16,    71,    73,    73,    78,    77,    71,    77,     5,     6,
       7,     8,     9,    10,    11,    12,    73,    34,    46,    16,
      78,    74,    72,    78,    13,    73,    64,   157,   236,    71,
     126,   174,   139,   228,   140,   144,   175
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      16,    81,    82,    83,    84,    87,    88,   105,   110,   111,
       5,   108,     5,   109,     5,     9,    10,   107,     5,     9,
      10,   106,     3,     0,    82,     3,    89,    91,    77,   108,
     109,   108,   109,     3,    85,    89,    92,    73,    74,    90,
     105,   113,    71,    52,    75,    93,    95,    89,     3,   114,
     116,    78,    13,    86,    87,   105,    94,    34,    76,    96,
     117,    74,   115,    71,   112,     3,    72,    86,     3,    34,
      35,    36,    37,    68,    77,   130,   138,   140,   142,   143,
     146,   148,   150,   151,   153,   155,   160,    97,    52,    99,
      75,   118,   113,     4,    14,    17,    18,    19,    20,    71,
      73,    87,   119,   120,   121,   122,   123,   125,   127,   129,
     130,    73,    77,   142,   151,   154,    53,   139,    54,   141,
      56,    57,    58,    59,    60,    61,    62,    63,   144,   145,
     147,    64,    65,    66,   149,    47,    48,    49,    50,    51,
      52,    69,    70,    75,    79,   131,   152,    76,   100,    76,
      77,    73,   128,   130,    77,    77,   119,    73,   121,   121,
      72,    73,   156,   130,   140,   142,   146,   148,   150,   137,
     135,   136,   133,   134,   132,   130,     3,    52,    98,    99,
     101,    35,   138,    73,   138,    73,    87,   126,   130,    17,
      72,   130,   157,   158,    78,   139,   141,   130,   130,   130,
     130,   130,   130,    76,   102,    78,    78,   138,    73,    77,
      74,   159,    78,    71,   119,   119,    73,   138,   130,    34,
     103,    46,   124,   130,    78,   159,    74,   104,    72,   119,
      78,    73,   103
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_uint8 yyr1[] =
{
       0,    80,    81,    82,    82,    83,    83,    83,    85,    84,
      86,    86,    87,    87,    88,    89,    90,    90,    92,    91,
      93,    94,    93,    95,    95,    97,    96,    96,    98,    98,
      98,   100,    99,   102,   101,   103,   104,   104,   105,   105,
     105,   105,   105,   105,   105,   105,   105,   106,   106,   106,
     106,   107,   107,   107,   107,   108,   108,   109,   109,   110,
     111,   112,   112,   113,   113,   114,   115,   115,   117,   116,
     118,   118,   119,   119,   119,   119,   119,   119,   119,   120,
     121,   121,   122,   122,   123,   124,   124,   125,   125,   125,
     126,   126,   126,   127,   128,   128,   129,   130,   130,   132,
     131,   133,   131,   134,   131,   135,   131,   136,   131,   137,
     131,   131,   131,   138,   139,   139,   140,   141,   141,   142,
     142,   143,   144,   144,   145,   145,   145,   145,   145,   145,
     146,   146,   147,   147,   148,   148,   149,   149,   149,   150,
     150,   151,   151,   152,   152,   154,   153,   153,   153,   156,
     155,   157,   157,   158,   159,   159,   160,   160,   160,   160
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     0,     1,     1,     1,     0,     7,
       2,     0,     3,     1,     3,     2,     2,     0,     0,     3,
       1,     0,     3,     2,     0,     0,     4,     2,     1,     1,
       0,     0,     3,     0,     5,     2,     2,     0,     1,     1,
       1,     1,     2,     2,     2,     2,     1,     1,     2,     2,
       0,     1,     2,     2,     0,     1,     0,     1,     0,     5,
       2,     3,     0,     2,     0,     2,     2,     0,     0,     3,
       2,     0,     1,     1,     1,     1,     1,     1,     1,     3,
       2,     0,     2,     1,     6,     2,     0,     5,     7,     7,
       1,     2,     1,     2,     1,     2,     2,     2,     1,     0,
       3,     0,     3,     0,     3,     0,     3,     0,     3,     0,
       3,     1,     1,     2,     3,     0,     2,     3,     0,     2,
       1,     2,     2,     0,     1,     1,     1,     1,     1,     1,
       3,     1,     1,     1,     3,     1,     1,     1,     1,     1,
       1,     1,     2,     3,     2,     0,     4,     1,     1,     0,
       5,     1,     0,     2,     3,     0,     1,     1,     1,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 8: /* $@1: %empty  */
#line 84 "parser.y"
                                            { insert_type(); insert_class(0);}
#line 1623 "y.tab.c"
    break;

  case 18: /* $@2: %empty  */
#line 103 "parser.y"
                                     { insert_type(); insert_class(2);}
#line 1629 "y.tab.c"
    break;

  case 21: /* $@3: %empty  */
#line 105 "parser.y"
                                            {strcpy(previous_operator,"=");}
#line 1635 "y.tab.c"
    break;

  case 25: /* $@4: %empty  */
#line 112 "parser.y"
                                           {insert_dimensions();}
#line 1641 "y.tab.c"
    break;

  case 31: /* $@5: %empty  */
#line 121 "parser.y"
                             {strcpy(previous_operator,"=");}
#line 1647 "y.tab.c"
    break;

  case 32: /* string_initilization: '=' $@5 string_constant  */
#line 121 "parser.y"
                                                                              { insert_value(); }
#line 1653 "y.tab.c"
    break;

  case 33: /* $@6: %empty  */
#line 124 "parser.y"
                             {strcpy(previous_operator,"=");}
#line 1659 "y.tab.c"
    break;

  case 60: /* function_name: datatype IDENTIFIER  */
#line 157 "parser.y"
                                  {strcpy(current_function,current_identifier);insert_class(1);}
#line 1665 "y.tab.c"
    break;

  case 61: /* function_data: '{' statments '}'  */
#line 159 "parser.y"
                                  {insert_pdl(0);}
#line 1671 "y.tab.c"
    break;

  case 62: /* function_data: %empty  */
#line 160 "parser.y"
                  {insert_pdl(1);}
#line 1677 "y.tab.c"
    break;

  case 68: /* $@7: %empty  */
#line 175 "parser.y"
                                     { insert_parameters(); insert_type(); }
#line 1683 "y.tab.c"
    break;

  case 99: /* $@8: %empty  */
#line 230 "parser.y"
                             {strcpy(previous_operator,"=");}
#line 1689 "y.tab.c"
    break;

  case 101: /* $@9: %empty  */
#line 231 "parser.y"
                                   {strcpy(previous_operator,"+=");}
#line 1695 "y.tab.c"
    break;

  case 103: /* $@10: %empty  */
#line 232 "parser.y"
                                   {strcpy(previous_operator,"-=");}
#line 1701 "y.tab.c"
    break;

  case 105: /* $@11: %empty  */
#line 233 "parser.y"
                                   {strcpy(previous_operator,"*=");}
#line 1707 "y.tab.c"
    break;

  case 107: /* $@12: %empty  */
#line 234 "parser.y"
                                   {strcpy(previous_operator,"/=");}
#line 1713 "y.tab.c"
    break;

  case 109: /* $@13: %empty  */
#line 235 "parser.y"
                                   {strcpy(previous_operator,"%=");}
#line 1719 "y.tab.c"
    break;

  case 124: /* relational_operators: GREATER_EQUAL  */
#line 264 "parser.y"
                                       {strcpy(previous_operator,">=");}
#line 1725 "y.tab.c"
    break;

  case 125: /* relational_operators: LESSER_EQUAL  */
#line 265 "parser.y"
                                      {strcpy(previous_operator,"<=");}
#line 1731 "y.tab.c"
    break;

  case 126: /* relational_operators: GREATER  */
#line 266 "parser.y"
                                 {strcpy(previous_operator,">");}
#line 1737 "y.tab.c"
    break;

  case 127: /* relational_operators: LESSER  */
#line 267 "parser.y"
                                {strcpy(previous_operator,"<");}
#line 1743 "y.tab.c"
    break;

  case 128: /* relational_operators: EQUAL  */
#line 268 "parser.y"
                               {strcpy(previous_operator,"==");}
#line 1749 "y.tab.c"
    break;

  case 129: /* relational_operators: NOT_EQUAL  */
#line 269 "parser.y"
                                   {strcpy(previous_operator,"!=");}
#line 1755 "y.tab.c"
    break;

  case 145: /* $@14: %empty  */
#line 298 "parser.y"
                             {strcpy(previous_operator,"(");}
#line 1761 "y.tab.c"
    break;

  case 149: /* $@15: %empty  */
#line 302 "parser.y"
                                        {strcpy(previous_operator,"(");insert_class(1);}
#line 1767 "y.tab.c"
    break;

  case 156: /* constant: integer_constant  */
#line 315 "parser.y"
                                                { insert_value(); }
#line 1773 "y.tab.c"
    break;

  case 157: /* constant: string_constant  */
#line 316 "parser.y"
                                                { insert_value(); }
#line 1779 "y.tab.c"
    break;

  case 158: /* constant: float_constant  */
#line 317 "parser.y"
                                                { insert_value(); }
#line 1785 "y.tab.c"
    break;

  case 159: /* constant: character_constant  */
#line 318 "parser.y"
                                            { insert_value(); }
#line 1791 "y.tab.c"
    break;


#line 1795 "y.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 320 "parser.y"


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
	yyin = fopen("test2.c", "r");
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
