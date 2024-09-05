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
	void insert_value();
	void insert_dimensions();
	void insert_parameters();
	extern int flag=0;
	int insert_flag = 0;

	extern char current_identifier[20];
	extern char current_type[20];
	extern char current_value[20];
    extern char current_function[20];
	extern char previous_operator[20];


#line 93 "y.tab.c"

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
    IF = 258,                      /* IF  */
    INT = 259,                     /* INT  */
    CHAR = 260,                    /* CHAR  */
    FLOAT = 261,                   /* FLOAT  */
    DOUBLE = 262,                  /* DOUBLE  */
    LONG = 263,                    /* LONG  */
    SHORT = 264,                   /* SHORT  */
    SIGNED = 265,                  /* SIGNED  */
    UNSIGNED = 266,                /* UNSIGNED  */
    STRUCT = 267,                  /* STRUCT  */
    RETURN = 268,                  /* RETURN  */
    MAIN = 269,                    /* MAIN  */
    VOID = 270,                    /* VOID  */
    WHILE = 271,                   /* WHILE  */
    FOR = 272,                     /* FOR  */
    DO = 273,                      /* DO  */
    BREAK = 274,                   /* BREAK  */
    CONTINUE = 275,                /* CONTINUE  */
    GOTO = 276,                    /* GOTO  */
    ENDIF = 277,                   /* ENDIF  */
    SWITCH = 278,                  /* SWITCH  */
    CASE = 279,                    /* CASE  */
    DEFAULT = 280,                 /* DEFAULT  */
    identifier = 281,              /* identifier  */
    integer_constant = 282,        /* integer_constant  */
    string_constant = 283,         /* string_constant  */
    float_constant = 284,          /* float_constant  */
    character_constant = 285,      /* character_constant  */
    ELSE = 286,                    /* ELSE  */
    MOD_EQUAL = 287,               /* MOD_EQUAL  */
    MULTIPLY_EQUAL = 288,          /* MULTIPLY_EQUAL  */
    DIVIDE_EQUAL = 289,            /* DIVIDE_EQUAL  */
    ADD_EQUAL = 290,               /* ADD_EQUAL  */
    SUBTRACT_EQUAL = 291,          /* SUBTRACT_EQUAL  */
    OR_OR = 292,                   /* OR_OR  */
    AND_AND = 293,                 /* AND_AND  */
    EQUAL = 294,                   /* EQUAL  */
    NOT_EQUAL = 295,               /* NOT_EQUAL  */
    LESS_EQUAL = 296,              /* LESS_EQUAL  */
    LESS = 297,                    /* LESS  */
    GREAT_EQUAL = 298,             /* GREAT_EQUAL  */
    GREAT = 299,                   /* GREAT  */
    SIZEOF = 300,                  /* SIZEOF  */
    NOT = 301,                     /* NOT  */
    INCREMENT = 302,               /* INCREMENT  */
    DECREMENT = 303                /* DECREMENT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define IF 258
#define INT 259
#define CHAR 260
#define FLOAT 261
#define DOUBLE 262
#define LONG 263
#define SHORT 264
#define SIGNED 265
#define UNSIGNED 266
#define STRUCT 267
#define RETURN 268
#define MAIN 269
#define VOID 270
#define WHILE 271
#define FOR 272
#define DO 273
#define BREAK 274
#define CONTINUE 275
#define GOTO 276
#define ENDIF 277
#define SWITCH 278
#define CASE 279
#define DEFAULT 280
#define identifier 281
#define integer_constant 282
#define string_constant 283
#define float_constant 284
#define character_constant 285
#define ELSE 286
#define MOD_EQUAL 287
#define MULTIPLY_EQUAL 288
#define DIVIDE_EQUAL 289
#define ADD_EQUAL 290
#define SUBTRACT_EQUAL 291
#define OR_OR 292
#define AND_AND 293
#define EQUAL 294
#define NOT_EQUAL 295
#define LESS_EQUAL 296
#define LESS 297
#define GREAT_EQUAL 298
#define GREAT 299
#define SIZEOF 300
#define NOT 301
#define INCREMENT 302
#define DECREMENT 303

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
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
  YYSYMBOL_IF = 3,                         /* IF  */
  YYSYMBOL_INT = 4,                        /* INT  */
  YYSYMBOL_CHAR = 5,                       /* CHAR  */
  YYSYMBOL_FLOAT = 6,                      /* FLOAT  */
  YYSYMBOL_DOUBLE = 7,                     /* DOUBLE  */
  YYSYMBOL_LONG = 8,                       /* LONG  */
  YYSYMBOL_SHORT = 9,                      /* SHORT  */
  YYSYMBOL_SIGNED = 10,                    /* SIGNED  */
  YYSYMBOL_UNSIGNED = 11,                  /* UNSIGNED  */
  YYSYMBOL_STRUCT = 12,                    /* STRUCT  */
  YYSYMBOL_RETURN = 13,                    /* RETURN  */
  YYSYMBOL_MAIN = 14,                      /* MAIN  */
  YYSYMBOL_VOID = 15,                      /* VOID  */
  YYSYMBOL_WHILE = 16,                     /* WHILE  */
  YYSYMBOL_FOR = 17,                       /* FOR  */
  YYSYMBOL_DO = 18,                        /* DO  */
  YYSYMBOL_BREAK = 19,                     /* BREAK  */
  YYSYMBOL_CONTINUE = 20,                  /* CONTINUE  */
  YYSYMBOL_GOTO = 21,                      /* GOTO  */
  YYSYMBOL_ENDIF = 22,                     /* ENDIF  */
  YYSYMBOL_SWITCH = 23,                    /* SWITCH  */
  YYSYMBOL_CASE = 24,                      /* CASE  */
  YYSYMBOL_DEFAULT = 25,                   /* DEFAULT  */
  YYSYMBOL_identifier = 26,                /* identifier  */
  YYSYMBOL_integer_constant = 27,          /* integer_constant  */
  YYSYMBOL_string_constant = 28,           /* string_constant  */
  YYSYMBOL_float_constant = 29,            /* float_constant  */
  YYSYMBOL_character_constant = 30,        /* character_constant  */
  YYSYMBOL_ELSE = 31,                      /* ELSE  */
  YYSYMBOL_MOD_EQUAL = 32,                 /* MOD_EQUAL  */
  YYSYMBOL_MULTIPLY_EQUAL = 33,            /* MULTIPLY_EQUAL  */
  YYSYMBOL_DIVIDE_EQUAL = 34,              /* DIVIDE_EQUAL  */
  YYSYMBOL_ADD_EQUAL = 35,                 /* ADD_EQUAL  */
  YYSYMBOL_SUBTRACT_EQUAL = 36,            /* SUBTRACT_EQUAL  */
  YYSYMBOL_37_ = 37,                       /* '='  */
  YYSYMBOL_OR_OR = 38,                     /* OR_OR  */
  YYSYMBOL_AND_AND = 39,                   /* AND_AND  */
  YYSYMBOL_40_ = 40,                       /* '^'  */
  YYSYMBOL_EQUAL = 41,                     /* EQUAL  */
  YYSYMBOL_NOT_EQUAL = 42,                 /* NOT_EQUAL  */
  YYSYMBOL_LESS_EQUAL = 43,                /* LESS_EQUAL  */
  YYSYMBOL_LESS = 44,                      /* LESS  */
  YYSYMBOL_GREAT_EQUAL = 45,               /* GREAT_EQUAL  */
  YYSYMBOL_GREAT = 46,                     /* GREAT  */
  YYSYMBOL_47_ = 47,                       /* '+'  */
  YYSYMBOL_48_ = 48,                       /* '-'  */
  YYSYMBOL_49_ = 49,                       /* '*'  */
  YYSYMBOL_50_ = 50,                       /* '/'  */
  YYSYMBOL_51_ = 51,                       /* '%'  */
  YYSYMBOL_SIZEOF = 52,                    /* SIZEOF  */
  YYSYMBOL_NOT = 53,                       /* NOT  */
  YYSYMBOL_INCREMENT = 54,                 /* INCREMENT  */
  YYSYMBOL_DECREMENT = 55,                 /* DECREMENT  */
  YYSYMBOL_56_ = 56,                       /* '{'  */
  YYSYMBOL_57_ = 57,                       /* '}'  */
  YYSYMBOL_58_ = 58,                       /* ';'  */
  YYSYMBOL_59_ = 59,                       /* ','  */
  YYSYMBOL_60_ = 60,                       /* '['  */
  YYSYMBOL_61_ = 61,                       /* ']'  */
  YYSYMBOL_62_ = 62,                       /* '('  */
  YYSYMBOL_63_ = 63,                       /* ')'  */
  YYSYMBOL_64_ = 64,                       /* '.'  */
  YYSYMBOL_YYACCEPT = 65,                  /* $accept  */
  YYSYMBOL_begin_parse = 66,               /* begin_parse  */
  YYSYMBOL_declarations = 67,              /* declarations  */
  YYSYMBOL_declaration = 68,               /* declaration  */
  YYSYMBOL_structure_dec = 69,             /* structure_dec  */
  YYSYMBOL_70_1 = 70,                      /* $@1  */
  YYSYMBOL_structure_content = 71,         /* structure_content  */
  YYSYMBOL_variable_dec = 72,              /* variable_dec  */
  YYSYMBOL_structure_initialize = 73,      /* structure_initialize  */
  YYSYMBOL_variables = 74,                 /* variables  */
  YYSYMBOL_multiple_variables = 75,        /* multiple_variables  */
  YYSYMBOL_identifier_name = 76,           /* identifier_name  */
  YYSYMBOL_77_2 = 77,                      /* $@2  */
  YYSYMBOL_extended_identifier = 78,       /* extended_identifier  */
  YYSYMBOL_79_3 = 79,                      /* $@3  */
  YYSYMBOL_array_identifier = 80,          /* array_identifier  */
  YYSYMBOL_array_dims = 81,                /* array_dims  */
  YYSYMBOL_82_4 = 82,                      /* $@4  */
  YYSYMBOL_initilization = 83,             /* initilization  */
  YYSYMBOL_string_initilization = 84,      /* string_initilization  */
  YYSYMBOL_85_5 = 85,                      /* $@5  */
  YYSYMBOL_array_initialization = 86,      /* array_initialization  */
  YYSYMBOL_87_6 = 87,                      /* $@6  */
  YYSYMBOL_array_values = 88,              /* array_values  */
  YYSYMBOL_multiple_array_values = 89,     /* multiple_array_values  */
  YYSYMBOL_datatype = 90,                  /* datatype  */
  YYSYMBOL_unsigned_grammar = 91,          /* unsigned_grammar  */
  YYSYMBOL_signed_grammar = 92,            /* signed_grammar  */
  YYSYMBOL_long_grammar = 93,              /* long_grammar  */
  YYSYMBOL_short_grammar = 94,             /* short_grammar  */
  YYSYMBOL_function_dec = 95,              /* function_dec  */
  YYSYMBOL_function_datatype = 96,         /* function_datatype  */
  YYSYMBOL_function_parameters = 97,       /* function_parameters  */
  YYSYMBOL_parameters = 98,                /* parameters  */
  YYSYMBOL_all_parameter_identifiers = 99, /* all_parameter_identifiers  */
  YYSYMBOL_multiple_parameters = 100,      /* multiple_parameters  */
  YYSYMBOL_parameter_identifier = 101,     /* parameter_identifier  */
  YYSYMBOL_102_7 = 102,                    /* $@7  */
  YYSYMBOL_extended_parameter = 103,       /* extended_parameter  */
  YYSYMBOL_statement = 104,                /* statement  */
  YYSYMBOL_multiple_statement = 105,       /* multiple_statement  */
  YYSYMBOL_statments = 106,                /* statments  */
  YYSYMBOL_expression_statment = 107,      /* expression_statment  */
  YYSYMBOL_conditional_statements = 108,   /* conditional_statements  */
  YYSYMBOL_extended_conditional_statements = 109, /* extended_conditional_statements  */
  YYSYMBOL_iterative_statements = 110,     /* iterative_statements  */
  YYSYMBOL_for_initialization = 111,       /* for_initialization  */
  YYSYMBOL_return_statement = 112,         /* return_statement  */
  YYSYMBOL_return_suffix = 113,            /* return_suffix  */
  YYSYMBOL_break_statement = 114,          /* break_statement  */
  YYSYMBOL_expression = 115,               /* expression  */
  YYSYMBOL_expressions = 116,              /* expressions  */
  YYSYMBOL_117_8 = 117,                    /* $@8  */
  YYSYMBOL_118_9 = 118,                    /* $@9  */
  YYSYMBOL_119_10 = 119,                   /* $@10  */
  YYSYMBOL_120_11 = 120,                   /* $@11  */
  YYSYMBOL_121_12 = 121,                   /* $@12  */
  YYSYMBOL_122_13 = 122,                   /* $@13  */
  YYSYMBOL_simple_expression = 123,        /* simple_expression  */
  YYSYMBOL_simple_expression_breakup = 124, /* simple_expression_breakup  */
  YYSYMBOL_and_expression = 125,           /* and_expression  */
  YYSYMBOL_and_expression_breakup = 126,   /* and_expression_breakup  */
  YYSYMBOL_unary_relation_expression = 127, /* unary_relation_expression  */
  YYSYMBOL_regular_expression = 128,       /* regular_expression  */
  YYSYMBOL_regular_expression_breakup = 129, /* regular_expression_breakup  */
  YYSYMBOL_relational_operators = 130,     /* relational_operators  */
  YYSYMBOL_sum_expression = 131,           /* sum_expression  */
  YYSYMBOL_sum_operators = 132,            /* sum_operators  */
  YYSYMBOL_term = 133,                     /* term  */
  YYSYMBOL_multiply_operators = 134,       /* multiply_operators  */
  YYSYMBOL_factor = 135,                   /* factor  */
  YYSYMBOL_iden = 136,                     /* iden  */
  YYSYMBOL_extended_iden = 137,            /* extended_iden  */
  YYSYMBOL_func = 138,                     /* func  */
  YYSYMBOL_139_14 = 139,                   /* $@14  */
  YYSYMBOL_func_call = 140,                /* func_call  */
  YYSYMBOL_141_15 = 141,                   /* $@15  */
  YYSYMBOL_arguments = 142,                /* arguments  */
  YYSYMBOL_arguments_list = 143,           /* arguments_list  */
  YYSYMBOL_extended_arguments = 144,       /* extended_arguments  */
  YYSYMBOL_constant = 145                  /* constant  */
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
#define YYLAST   249

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  65
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  81
/* YYNRULES -- Number of rules.  */
#define YYNRULES  158
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  241

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   303


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
       2,     2,     2,     2,     2,     2,     2,    51,     2,     2,
      62,    63,    49,    47,    59,    48,    64,    50,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    58,
       2,    37,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    60,     2,    61,    40,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    56,     2,    57,     2,     2,     2,     2,
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
      35,    36,    38,    39,    41,    42,    43,    44,    45,    46,
      52,    53,    54,    55
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    59,    59,    62,    63,    67,    68,    69,    72,    72,
      74,    74,    77,    78,    81,    84,    87,    88,    91,    91,
      93,    93,    93,    96,    97,   100,   100,   101,   104,   105,
     106,   109,   109,   112,   112,   115,   118,   119,   123,   123,
     123,   123,   124,   125,   126,   127,   128,   131,   131,   131,
     131,   134,   134,   134,   134,   137,   137,   140,   140,   143,
     146,   149,   152,   152,   155,   158,   159,   162,   162,   165,
     166,   169,   169,   170,   170,   171,   171,   172,   175,   178,
     179,   182,   183,   186,   189,   190,   193,   194,   195,   198,
     199,   200,   203,   206,   207,   210,   213,   214,   217,   217,
     218,   218,   219,   219,   220,   220,   221,   221,   222,   222,
     223,   224,   227,   230,   230,   233,   236,   237,   240,   241,
     244,   247,   248,   251,   252,   253,   254,   255,   256,   259,
     260,   263,   264,   267,   268,   271,   271,   271,   274,   274,
     277,   278,   281,   282,   285,   285,   286,   286,   289,   289,
     292,   292,   295,   298,   299,   302,   303,   304,   305
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
  "\"end of file\"", "error", "\"invalid token\"", "IF", "INT", "CHAR",
  "FLOAT", "DOUBLE", "LONG", "SHORT", "SIGNED", "UNSIGNED", "STRUCT",
  "RETURN", "MAIN", "VOID", "WHILE", "FOR", "DO", "BREAK", "CONTINUE",
  "GOTO", "ENDIF", "SWITCH", "CASE", "DEFAULT", "identifier",
  "integer_constant", "string_constant", "float_constant",
  "character_constant", "ELSE", "MOD_EQUAL", "MULTIPLY_EQUAL",
  "DIVIDE_EQUAL", "ADD_EQUAL", "SUBTRACT_EQUAL", "'='", "OR_OR", "AND_AND",
  "'^'", "EQUAL", "NOT_EQUAL", "LESS_EQUAL", "LESS", "GREAT_EQUAL",
  "GREAT", "'+'", "'-'", "'*'", "'/'", "'%'", "SIZEOF", "NOT", "INCREMENT",
  "DECREMENT", "'{'", "'}'", "';'", "','", "'['", "']'", "'('", "')'",
  "'.'", "$accept", "begin_parse", "declarations", "declaration",
  "structure_dec", "$@1", "structure_content", "variable_dec",
  "structure_initialize", "variables", "multiple_variables",
  "identifier_name", "$@2", "extended_identifier", "$@3",
  "array_identifier", "array_dims", "$@4", "initilization",
  "string_initilization", "$@5", "array_initialization", "$@6",
  "array_values", "multiple_array_values", "datatype", "unsigned_grammar",
  "signed_grammar", "long_grammar", "short_grammar", "function_dec",
  "function_datatype", "function_parameters", "parameters",
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

#define YYPACT_NINF (-109)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-34)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     184,  -109,  -109,  -109,  -109,     4,    23,    15,    35,     9,
    -109,    47,  -109,   184,  -109,  -109,  -109,    22,  -109,   226,
    -109,  -109,  -109,  -109,  -109,     4,    23,  -109,  -109,     4,
      23,  -109,    30,  -109,  -109,    -2,     3,    13,    48,  -109,
      10,  -109,  -109,  -109,  -109,  -109,    29,  -109,  -109,   -20,
    -109,    30,  -109,  -109,  -109,    28,   155,   214,  -109,   -11,
    -109,  -109,  -109,    31,   226,  -109,    32,    63,   -16,    34,
      40,   155,    45,    42,  -109,  -109,  -109,  -109,     2,   155,
    -109,  -109,  -109,    30,  -109,  -109,  -109,  -109,  -109,  -109,
    -109,    50,  -109,    54,    66,  -109,   201,    18,  -109,   143,
    -109,  -109,  -109,    36,   214,     2,  -109,    69,  -109,    64,
    -109,  -109,     2,    30,  -109,  -109,    57,     2,    71,   110,
    -109,  -109,  -109,   -39,   155,    70,     2,  -109,     2,  -109,
       2,  -109,  -109,  -109,  -109,  -109,  -109,  -109,  -109,  -109,
    -109,    84,    84,  -109,  -109,  -109,    84,  -109,  -109,  -109,
    -109,  -109,  -109,  -109,  -109,     2,   102,  -109,  -109,    72,
    -109,  -109,    73,  -109,  -109,  -109,    68,  -109,    74,  -109,
    -109,     2,    77,    78,     2,  -109,  -109,    79,    54,    66,
     -14,    18,  -109,     2,     2,     2,     2,     2,     2,    75,
    -109,  -109,    95,   113,   155,   155,    85,  -109,     2,    86,
      81,  -109,  -109,  -109,  -109,  -109,  -109,  -109,  -109,  -109,
    -109,  -109,    91,  -109,  -109,  -109,  -109,   117,  -109,     2,
      87,     2,  -109,  -109,    93,   155,  -109,    88,    97,    86,
     126,  -109,  -109,  -109,  -109,    98,    99,   126,  -109,  -109,
    -109
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       4,    38,    39,    40,    41,    56,    58,    54,    50,     0,
      46,     0,     2,     4,     7,     5,    13,     0,     6,    63,
      55,    42,    57,    43,    51,    56,    58,    45,    47,    56,
      58,    44,     8,     1,     3,    18,     0,    17,     0,    59,
       0,    52,    53,    48,    49,    18,     0,    14,    60,    24,
      12,     0,    15,    67,    62,    66,     0,    11,    21,     0,
      19,    20,    16,    70,    63,    64,     0,     0,     0,     0,
       0,     0,     0,   140,   155,   156,   157,   158,     0,    80,
      82,   144,    77,     0,    61,    72,    71,    73,    74,    75,
      76,     0,    97,   114,   117,   119,   122,   130,   134,   139,
     138,   146,   147,     0,    11,     0,    25,     0,    23,     0,
      68,    65,     0,     0,    93,    92,     0,     0,     0,     0,
      95,   148,   118,   139,    80,     0,     0,    81,     0,   112,
       0,   115,   127,   128,   124,   126,   123,   125,   131,   132,
     120,     0,     0,   135,   136,   137,     0,   108,   104,   106,
     100,   102,    98,   110,   111,     0,     0,    96,   141,     0,
      10,    22,     0,    31,    27,    69,     0,    94,     0,    91,
      89,     0,     0,     0,   151,    79,    78,     0,   114,   117,
     121,   129,   133,     0,     0,     0,     0,     0,     0,     0,
     143,     9,    30,     0,     0,     0,     0,    90,     0,   154,
       0,   150,   145,   113,   116,   109,   105,   107,   101,   103,
      99,   142,    31,    26,    28,    29,    32,    85,    86,     0,
       0,     0,   152,   149,     0,     0,    83,     0,     0,   154,
       0,    84,    87,    88,   153,    37,     0,     0,    35,    34,
      36
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -109,  -109,   173,  -109,  -109,  -109,    83,     5,  -109,   -29,
    -109,  -109,  -109,  -109,  -109,  -109,  -109,  -109,  -109,     8,
    -109,  -109,  -109,   -36,  -109,     7,  -109,  -109,    20,    27,
    -109,  -109,  -109,   138,  -109,  -109,  -109,  -109,  -109,   -56,
    -109,    80,  -109,  -109,  -109,  -109,  -109,  -109,  -109,  -109,
     -67,  -109,  -109,  -109,  -109,  -109,  -109,  -109,  -108,    37,
      82,    26,   -72,  -109,  -109,  -109,    65,  -109,    67,  -109,
      92,   -76,  -109,  -109,  -109,  -109,  -109,  -109,  -109,   -17,
    -109
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,    11,    12,    13,    14,    46,   103,    82,    16,    36,
      52,    37,    49,    60,   105,    61,   108,   162,   213,   164,
     193,   215,   224,   236,   238,    83,    31,    27,    21,    23,
      18,    19,    39,    40,    54,    65,    55,    63,   110,   124,
      85,   125,    86,    87,   226,    88,   171,    89,   115,    90,
      91,   157,   188,   186,   187,   184,   185,   183,    92,   129,
      93,   131,    94,    95,   140,   141,    96,   142,    97,   146,
      98,    99,   158,   100,   126,   101,   174,   200,   201,   222,
     102
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      84,   116,   123,    47,   166,    15,   122,    17,    20,   168,
      73,    74,    75,    76,    77,   119,   106,    58,    15,    24,
      17,   155,    62,    25,    26,   156,    38,    22,    73,    74,
      75,    76,    77,   138,   139,    32,   123,    78,   161,    28,
      59,   123,   114,    29,    30,    41,    81,    33,    35,    43,
     107,   172,   123,    42,   123,    78,    45,    44,   179,   177,
      48,    50,   104,   196,    81,   123,   123,   143,   144,   145,
     123,    38,    51,    56,    53,     1,     2,     3,     4,     5,
       6,     7,     8,    67,    47,    57,    10,    64,   189,   113,
     220,   109,   128,   159,   112,   123,   117,    73,    74,    75,
      76,    77,   118,   120,   121,   130,   163,   199,   127,   104,
      73,    74,    75,    76,    77,   167,   205,   206,   207,   208,
     209,   210,   123,   170,    78,   165,   173,   176,   190,   169,
     191,   194,   212,    81,   192,   197,   211,   195,   217,   218,
     198,   216,   202,   219,   223,   221,    81,   -33,   225,   230,
     228,   232,   227,   235,   229,   233,   239,   237,    66,     1,
       2,     3,     4,     5,     6,     7,     8,    67,    68,   231,
      10,    69,    70,    71,    72,   147,   148,   149,   150,   151,
     152,    73,    74,    75,    76,    77,    34,   160,     1,     2,
       3,     4,     5,     6,     7,     8,     9,   153,   154,    10,
     214,   240,   111,   155,   175,   204,   180,   156,    78,   181,
     178,    79,   234,    80,     0,   203,     0,    81,     1,     2,
       3,     4,     5,     6,     7,     8,    67,     0,     0,    10,
       1,     2,     3,     4,     5,     6,     7,     8,   182,     0,
       0,    10,   132,   133,   134,   135,   136,   137,   138,   139
};

static const yytype_int16 yycheck[] =
{
      56,    68,    78,    32,   112,     0,    78,     0,     4,   117,
      26,    27,    28,    29,    30,    71,    27,    37,    13,     4,
      13,    60,    51,     8,     9,    64,    19,     4,    26,    27,
      28,    29,    30,    47,    48,    26,   112,    53,   105,     4,
      60,   117,    58,     8,     9,    25,    62,     0,    26,    29,
      61,   118,   128,    26,   130,    53,    26,    30,   130,   126,
      62,    58,    57,   171,    62,   141,   142,    49,    50,    51,
     146,    64,    59,    63,    26,     4,     5,     6,     7,     8,
       9,    10,    11,    12,   113,    56,    15,    59,   155,    26,
     198,    60,    38,    57,    62,   171,    62,    26,    27,    28,
      29,    30,    62,    58,    62,    39,    37,   174,    58,   104,
      26,    27,    28,    29,    30,    58,   183,   184,   185,   186,
     187,   188,   198,   118,    53,    61,    16,    57,    26,    58,
      58,    63,    37,    62,    61,    58,    61,    63,   194,   195,
      62,    28,    63,    58,    63,    59,    62,    56,    31,    56,
      63,    63,   219,    27,   221,    58,    57,    59,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,   225,
      15,    16,    17,    18,    19,    32,    33,    34,    35,    36,
      37,    26,    27,    28,    29,    30,    13,   104,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    54,    55,    15,
     192,   237,    64,    60,   124,   179,   141,    64,    53,   142,
     128,    56,   229,    58,    -1,   178,    -1,    62,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    -1,    -1,    15,
       4,     5,     6,     7,     8,     9,    10,    11,   146,    -1,
      -1,    15,    41,    42,    43,    44,    45,    46,    47,    48
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      15,    66,    67,    68,    69,    72,    73,    90,    95,    96,
       4,    93,     4,    94,     4,     8,     9,    92,     4,     8,
       9,    91,    26,     0,    67,    26,    74,    76,    90,    97,
      98,    93,    94,    93,    94,    26,    70,    74,    62,    77,
      58,    59,    75,    26,    99,   101,    63,    56,    37,    60,
      78,    80,    74,   102,    59,   100,     3,    12,    13,    16,
      17,    18,    19,    26,    27,    28,    29,    30,    53,    56,
      58,    62,    72,    90,   104,   105,   107,   108,   110,   112,
     114,   115,   123,   125,   127,   128,   131,   133,   135,   136,
     138,   140,   145,    71,    72,    79,    27,    61,    81,    60,
     103,    98,    62,    26,    58,   113,   115,    62,    62,   104,
      58,    62,   127,   136,   104,   106,   139,    58,    38,   124,
      39,   126,    41,    42,    43,    44,    45,    46,    47,    48,
     129,   130,   132,    49,    50,    51,   134,    32,    33,    34,
      35,    36,    37,    54,    55,    60,    64,   116,   137,    57,
      71,   115,    82,    37,    84,    61,   123,    58,   123,    58,
      72,   111,   115,    16,   141,   106,    57,   115,   125,   127,
     131,   133,   135,   122,   120,   121,   118,   119,   117,   115,
      26,    58,    61,    85,    63,    63,   123,    58,    62,   115,
     142,   143,    63,   124,   126,   115,   115,   115,   115,   115,
     115,    61,    37,    83,    84,    86,    28,   104,   104,    58,
     123,    59,   144,    63,    87,    31,   109,   115,    63,   115,
      56,   104,    63,    58,   144,    27,    88,    59,    89,    57,
      88
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_uint8 yyr1[] =
{
       0,    65,    66,    67,    67,    68,    68,    68,    70,    69,
      71,    71,    72,    72,    73,    74,    75,    75,    77,    76,
      78,    79,    78,    80,    80,    82,    81,    81,    83,    83,
      83,    85,    84,    87,    86,    88,    89,    89,    90,    90,
      90,    90,    90,    90,    90,    90,    90,    91,    91,    91,
      91,    92,    92,    92,    92,    93,    93,    94,    94,    95,
      96,    97,    98,    98,    99,   100,   100,   102,   101,   103,
     103,   104,   104,   104,   104,   104,   104,   104,   105,   106,
     106,   107,   107,   108,   109,   109,   110,   110,   110,   111,
     111,   111,   112,   113,   113,   114,   115,   115,   117,   116,
     118,   116,   119,   116,   120,   116,   121,   116,   122,   116,
     116,   116,   123,   124,   124,   125,   126,   126,   127,   127,
     128,   129,   129,   130,   130,   130,   130,   130,   130,   131,
     131,   132,   132,   133,   133,   134,   134,   134,   135,   135,
     136,   136,   137,   137,   139,   138,   138,   138,   141,   140,
     142,   142,   143,   144,   144,   145,   145,   145,   145
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     0,     1,     1,     1,     0,     7,
       2,     0,     3,     1,     3,     2,     2,     0,     0,     3,
       1,     0,     3,     2,     0,     0,     4,     2,     1,     1,
       0,     0,     3,     0,     5,     2,     2,     0,     1,     1,
       1,     1,     2,     2,     2,     2,     1,     1,     2,     2,
       0,     1,     2,     2,     0,     1,     0,     1,     0,     2,
       3,     3,     2,     0,     2,     2,     0,     0,     3,     2,
       0,     1,     1,     1,     1,     1,     1,     1,     3,     2,
       0,     2,     1,     6,     2,     0,     5,     7,     7,     1,
       2,     1,     2,     1,     2,     2,     2,     1,     0,     3,
       0,     3,     0,     3,     0,     3,     0,     3,     0,     3,
       1,     1,     2,     3,     0,     2,     3,     0,     2,     1,
       2,     2,     0,     1,     1,     1,     1,     1,     1,     3,
       1,     1,     1,     3,     1,     1,     1,     1,     1,     1,
       1,     2,     3,     2,     0,     4,     1,     1,     0,     5,
       1,     0,     2,     3,     0,     1,     1,     1,     1
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
#line 72 "parser.y"
                                            { insert_type(); }
#line 1563 "y.tab.c"
    break;

  case 18: /* $@2: %empty  */
#line 91 "parser.y"
                                     { insert_type(); }
#line 1569 "y.tab.c"
    break;

  case 21: /* $@3: %empty  */
#line 93 "parser.y"
                                            {strcpy(previous_operator,"=");}
#line 1575 "y.tab.c"
    break;

  case 25: /* $@4: %empty  */
#line 100 "parser.y"
                                           {insert_dimensions();}
#line 1581 "y.tab.c"
    break;

  case 31: /* $@5: %empty  */
#line 109 "parser.y"
                             {strcpy(previous_operator,"=");}
#line 1587 "y.tab.c"
    break;

  case 32: /* string_initilization: '=' $@5 string_constant  */
#line 109 "parser.y"
                                                                              { insert_value(); }
#line 1593 "y.tab.c"
    break;

  case 33: /* $@6: %empty  */
#line 112 "parser.y"
                             {strcpy(previous_operator,"=");}
#line 1599 "y.tab.c"
    break;

  case 60: /* function_datatype: datatype identifier '('  */
#line 146 "parser.y"
                                                   {strcpy(current_function,current_identifier); insert_type();}
#line 1605 "y.tab.c"
    break;

  case 67: /* $@7: %empty  */
#line 162 "parser.y"
                                     { insert_parameters(); insert_type(); }
#line 1611 "y.tab.c"
    break;

  case 98: /* $@8: %empty  */
#line 217 "parser.y"
                             {strcpy(previous_operator,"=");}
#line 1617 "y.tab.c"
    break;

  case 100: /* $@9: %empty  */
#line 218 "parser.y"
                                   {strcpy(previous_operator,"+=");}
#line 1623 "y.tab.c"
    break;

  case 102: /* $@10: %empty  */
#line 219 "parser.y"
                                        {strcpy(previous_operator,"-=");}
#line 1629 "y.tab.c"
    break;

  case 104: /* $@11: %empty  */
#line 220 "parser.y"
                                        {strcpy(previous_operator,"*=");}
#line 1635 "y.tab.c"
    break;

  case 106: /* $@12: %empty  */
#line 221 "parser.y"
                                      {strcpy(previous_operator,"/=");}
#line 1641 "y.tab.c"
    break;

  case 108: /* $@13: %empty  */
#line 222 "parser.y"
                                   {strcpy(previous_operator,"%=");}
#line 1647 "y.tab.c"
    break;

  case 123: /* relational_operators: GREAT_EQUAL  */
#line 251 "parser.y"
                                     {strcpy(previous_operator,">=");}
#line 1653 "y.tab.c"
    break;

  case 124: /* relational_operators: LESS_EQUAL  */
#line 252 "parser.y"
                                    {strcpy(previous_operator,"<=");}
#line 1659 "y.tab.c"
    break;

  case 125: /* relational_operators: GREAT  */
#line 253 "parser.y"
                               {strcpy(previous_operator,">");}
#line 1665 "y.tab.c"
    break;

  case 126: /* relational_operators: LESS  */
#line 254 "parser.y"
                              {strcpy(previous_operator,"<");}
#line 1671 "y.tab.c"
    break;

  case 127: /* relational_operators: EQUAL  */
#line 255 "parser.y"
                               {strcpy(previous_operator,"==");}
#line 1677 "y.tab.c"
    break;

  case 128: /* relational_operators: NOT_EQUAL  */
#line 256 "parser.y"
                                   {strcpy(previous_operator,"!=");}
#line 1683 "y.tab.c"
    break;

  case 144: /* $@14: %empty  */
#line 285 "parser.y"
                             {strcpy(previous_operator,"(");}
#line 1689 "y.tab.c"
    break;

  case 148: /* $@15: %empty  */
#line 289 "parser.y"
                                        {strcpy(previous_operator,"(");}
#line 1695 "y.tab.c"
    break;

  case 155: /* constant: integer_constant  */
#line 302 "parser.y"
                                                { insert_value(); }
#line 1701 "y.tab.c"
    break;

  case 156: /* constant: string_constant  */
#line 303 "parser.y"
                                                { insert_value(); }
#line 1707 "y.tab.c"
    break;

  case 157: /* constant: float_constant  */
#line 304 "parser.y"
                                                { insert_value(); }
#line 1713 "y.tab.c"
    break;

  case 158: /* constant: character_constant  */
#line 305 "parser.y"
                                            { insert_value(); }
#line 1719 "y.tab.c"
    break;


#line 1723 "y.tab.c"

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

#line 307 "parser.y"


extern FILE *yyin;
extern int yylineno;
extern char *yytext;
void insert_SymbolTable_type(char *,char *);
void insert_SymbolTable_value(char *, char *);
void insert_ConstantTable(char *, char *);
void insert_SymbolTable_arraydim(char *, char *);
void insert_SymbolTable_funcparam(char *, char *);
void printSymbolTable();
void printConstantTable();


int main()
{
	yyin = fopen("test15.c", "r");
	yyparse();

	if(flag == 0)
	{
		printf("VALID PARSE\n");
		printf("%30s SYMBOL TABLE \n", " ");
		printf("%30s %s\n", " ", "------------");
		printSymbolTable();

		printf("\n\n%30s CONSTANT TABLE \n", " ");
		printf("%30s %s\n", " ", "--------------");
		printConstantTable();
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

void insert_parameters()
{
    insert_SymbolTable_funcparam(current_function, current_identifier);
}

int yywrap()
{
	return 1;
}
