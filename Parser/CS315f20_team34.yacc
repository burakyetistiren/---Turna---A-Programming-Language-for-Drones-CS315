%token COMMENT FUNC CALL GET_INCL GET_ALTITUDE GET_TEMP GET_SPEED GET_ACCELERATION SET_INCL SET_ALTITUDE SET_TEMP SET_SPEED SET_ACCELERATION TURN_ON_CAM TURN_OFF_CAM TAKE_PICT GET_CURRENT_TIME_STAMP CONNECT_WIFI TAKE_OFF LAND FLY_UP_WITH_DISTANCE FLY_DOWN_WITH_DISTANCE FLY_LEFT_WITH_DISTANCE FLY_RIGHT_WITH_DISTANCE FLY_FORWARD_WITH_DISTANCE FLY_BACK_WITH_DISTANCE ROTATE_CW_WITH_ANGLE ROTATE_CCW_WITH_ANGLE FLIP_FORWARD FLIP_BACKWARD FLIP_LEFT FLIP_RIGHT HOVER_FOR_SECONDS YAW_RIGHT_WITH_DEGREES YAW_LEFT_WITH_DEGREES HOVER SCAN_INT SCAN_STR SCAN_FLOAT SCAN_BOOL SCAN_CHAR PRINT PRINT_NL SEMICOLON COMMA ASSIGN_OP INCREMENT_OP DECREMENT_OP EQUAL_OP NOT_EQUAL_OP LESS_THAN_OP LESS_THAN_OR_EQUAL_OP GREATER_THAN_OP GREATER_THAN_OR_EQUAL_OP NOT AND OR CONST TYPE_BOOL TYPE_CHAR TYPE_INT TYPE_FLOAT TYPE_STRING VOID TRUE FALSE WHILE FOR START END IF ELSE RETURN INTEGER FLOAT IDENTIFIER CHAR STRING LP RP PLUS MINUS MULTIPLICATION DIVISION MODULO RBRACE
%%

program: statements

statements: statement SEMICOLON statements | return_statement SEMICOLON statements | COMMENT statements | conditional_statement statements | loop_statement statements | function_declaration statements | empty;

statement: const_declaration | variable_declaration | assignment_statement | function_call | empty;
 
loop_statement: while_statement | for_statement; 

conditional_statement: IF LP expression RP START statements END
| IF LP expression RP START statements END ELSE START statements END;

return_statement: RETURN expression; 

while_statement: WHILE LP expression RP START statements END;                                             

for_statement: FOR LP statement SEMICOLON expression SEMICOLON assignment_statement RP START statements END;

argument: expression;

expression_list: expression COMMA expression_list | expression;

arguments: expression_list | empty;

type: TYPE_BOOL | TYPE_CHAR | TYPE_INT | TYPE_FLOAT | TYPE_STRING;

assignment_statement: IDENTIFIER ASSIGN_OP expression | IDENTIFIER INCREMENT_OP | IDENTIFIER DECREMENT_OP;

const_declaration: CONST type declaration_list;

variable_declaration: type declaration_list;

declaration_list: IDENTIFIER ASSIGN_OP expression COMMA declaration_list | IDENTIFIER COMMA declaration_list | IDENTIFIER ASSIGN_OP expression | IDENTIFIER; 

expression: STRING | or_expression; 

or_expression: or_expression OR and_expression | and_expression;

and_expression: and_expression AND relational_expression | relational_expression;

relational_expression: relational_expression relational_operator arithmetic_expression | arithmetic_expression;

arithmetic_expression: arithmetic_expression PLUS term | arithmetic_expression MINUS term | term;

term: term MULTIPLICATION factor | term DIVISION factor | term MODULO factor | factor | NOT factor;

factor: LP or_expression RP | function_call | IDENTIFIER | INTEGER | FLOAT | TRUE | FALSE | CHAR;

relational_operator: EQUAL_OP | NOT_EQUAL_OP | LESS_THAN_OP | LESS_THAN_OR_EQUAL_OP | GREATER_THAN_OP | GREATER_THAN_OR_EQUAL_OP;

function_call: custom_function_call | primitive_function_call;

custom_function_call: IDENTIFIER LP arguments RP; 

primitive_function_call: drone_function_call | print_function_call | scan_function_call; 

drone_function_call: GET_INCL LP RP | GET_ALTITUDE LP RP | GET_SPEED LP RP | GET_TEMP LP RP | GET_ACCELERATION LP RP | SET_ALTITUDE LP argument RP | SET_SPEED LP argument RP | SET_ACCELERATION LP argument RP | SET_INCL LP argument RP | TURN_ON_CAM LP RP | TURN_OFF_CAM LP RP | TAKE_PICT LP RP | GET_CURRENT_TIME_STAMP LP RP | CONNECT_WIFI LP argument COMMA argument RP | TAKE_OFF LP RP | LAND LP RP | FLY_UP_WITH_DISTANCE LP argument RP | FLY_DOWN_WITH_DISTANCE LP argument RP | FLY_RIGHT_WITH_DISTANCE LP argument RP | FLY_FORWARD_WITH_DISTANCE LP argument RP | FLY_BACK_WITH_DISTANCE LP argument RP | ROTATE_CW_WITH_ANGLE LP argument RP | ROTATE_CCW_WITH_ANGLE LP argument RP | FLIP_FORWARD LP RP | FLIP_BACKWARD LP RP | FLIP_LEFT LP RP | FLIP_RIGHT LP RP | HOVER_FOR_SECONDS LP argument RP | YAW_LEFT_WITH_DEGREES LP argument RP | YAW_RIGHT_WITH_DEGREES LP argument RP;

scan_function_call: SCAN_INT LP RP | SCAN_STR LP RP | SCAN_FLOAT LP RP | SCAN_BOOL LP RP | SCAN_CHAR LP RP;

print_function_call: PRINT LP argument RP | PRINT_NL LP RP | PRINT_NL LP argument RP;

parameter_list: type IDENTIFIER COMMA parameter_list | type IDENTIFIER

parameters: parameter_list | empty;

function_type: VOID | type;

function_declaration: FUNC function_type IDENTIFIER LP parameters RP START statements END; 

empty: ;
%%
#include "lex.yy.c"
main() { 

if(yyparse() == 0) 
    printf("Your program is syntactically correct.\n");
	
return 0;
 
} 
int yyerror( char *s ) { 
fprintf(stderr,"There is a syntax error at line %d\n", yylineno); 
}