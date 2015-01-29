/* Esercitazione 2 - Esercizio 1
Scanner per il linguaggio C */

import java_cup.runtime.*;

%%

%class Lexer
%unicode
%standalone


nl = \r|\n|\r\n
ws = [ \t]
id = [A-Za-z_][A-Za-z0-9_]*
integer =  ([1-9][0-9]*|0)
double = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?

%%

"("     {System.out.print("TO ");}
")"     {System.out.print("TC ");}
"{"     {System.out.print("GO ");}
"}"     {System.out.print("GC ");}
"="     {System.out.print("UG ");}
"+"     {System.out.print("PIU ");}
"-"     {System.out.print("MEN ");}
"*"     {System.out.print("PER ");}
"/"     {System.out.print("DIV ");}
"<"     {System.out.print("MIN ");}
">"     {System.out.print("MAG ");}
"<="    {System.out.print("MIN_UG ");}
"=<"    {System.out.print("UG_MIN ");}
">="    {System.out.print("MAG_UG ");}
"=>"    {System.out.print("UG_MAG ");}
"&"     {System.out.print("AND ");}
"|"     {System.out.print("OR ");}
"!"     {System.out.print("NOT ");}

"["     {System.out.print("QO ");}
"]"     {System.out.print("TO ");}

"int"    {System.out.print("INT_TYPE ");}
"double" {System.out.print("DOUBLE_TYPE ");}

print   {System.out.print("PRINT ");}
if      {System.out.print("IF ");}
while   {System.out.print("WHILE ");}
else    {System.out.print("ELSE ");}
;       {System.out.print("PV ");}
,       {System.out.print("VIR ");}

{id}      {System.out.print("ID:"+yytext()+" ");}
{integer} {System.out.print("INT:"+yytext()+" ");}
{double}  {System.out.print("DOUBLE:"+yytext()+" ");}

// Questa espressione regolare rappresenta un token che inizia
// con il simbolo "/*", contiene al suo interno qualsiasi carattere
// eccetto il sibolo "*/" ed è conclusa dal simbolo "*/". E' una 
// forma compatta per definire un commento */

"/*" ~ "*/"     {;}

{ws}|{nl}       {;}

. {System.err.println("SCANNER ERROR: "+yytext());}
