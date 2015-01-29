/* Scanner Mini C */

import java_cup.runtime.*;

%%

%class Scanner
%unicode
%standalone
%line
%column

new_line = \n 
white_space = [ \t]
integer = ([1-9][0-9]*|0)
double = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?
comment = "/*" ~ "*/"
id = [A-Za-z_][A-Za-z0-9_]*


%%
"(" 				{System.out.print("TONDA_APERTA ");}
")"				{System.out.print("TONDA_CHIUSA ");}
"{"				{System.out.print("GRAFFA_APERTA ");}
"}"				{System.out.print("GRAFFA_CHIUSA ");}
"["				{System.out.print("QUADRA_APERTA ");}
"]"				{System.out.print("QUADRA_CHIUSA ");}

"extern" 			{System.out.print("EXTERN ");}

"bool"				{System.out.print("BOOL ");}
"int"				{System.out.print("INT ");}
"float"				{System.out.print("FLOAT ");}
"string"			{System.out.print("STRING ");}
"void"				{System.out.print("VOID ");}

"!"				{System.out.print("PUNTO_ESCLAMATIVO ");}
"+"				{System.out.print("OPERATORE_SOMMA ");}
"-"				{System.out.print("OPERATORE_SOTTRAZIONE ");}
"*"				{System.out.print("OPERATORE_MOLTIPLICAZIONE ");}
"/"				{System.out.print("OPERATORE_DIVISIONE ");}
"%"				{System.out.print("OPERATORE_MODULO ");}
"&&"				{System.out.print("AND ");}
"||"				{System.out.print("OR ");}
"="				{System.out.print("OPERATORE_UGUALE ");}
"=="				{System.out.print("OPERATORE_UGUAGLIANZA ");}
"!="				{System.out.print("OPERATORE_DISUGUAGLIANZA ");}
"<="				{System.out.print("OPERATORE_MINORE_UGUALE ");}
"<"				{System.out.print("OPERATORE_MINORE ");}
">"				{System.out.print("OPERATORE_MAGGIORE ");}
">="				{System.out.print("OPERATORE_MAGGIORE_UGUALE ");}

"print"				{System.out.print("PRINT ");}
"if"				{System.out.print("IF ");}
"else"				{System.out.print("ELSE ");}
"while"				{System.out.print("WHILE ");}
"return"			{System.out.print("RETURN ");}
";"				{System.out.print("PUNTO_VIRGOLA ");}
","				{System.out.print("VIRGOLA ");}

{id}				{System.out.print("ID:"+yytext()+" ");}
{integer}			{System.out.print("INTEGER:"+yytext()+" ");}
{double}			{System.out.print("DOUBLE:"+yytext()+" ");}

{comment}			{;}
{white_space}|{new_line} 	{;}
.				{System.out.println("\u001B[31m"+"SCANNER ERROR: "+yytext()+" Row:"+yyline+ " Column:"+yycolumn+"\u001B[0m");}

