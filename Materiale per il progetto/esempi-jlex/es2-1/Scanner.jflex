/* Scanner Mini C */

import java_cup.runtime.*;

%%

%class Scanner
%unicode
%standalone

nl = \n
id = [A-Za-z_]{A-Za-z0-9_]*
integer =  ([1-9][0-9]*|0)
double = (([0-9]+\.[0-9]*) | ([0-9]*\.[0-9]+)) (e|E('+'|'-')?[0-9]+)?

%%
"(" 		{System.out.print("TONDA_APERTA");}
")"		{System.out.print("TONDA_CHIUSA");}
"{"		{System.out.print("GRAFFA_APERTA");}
"}"		{System.out.print("GRAFFA_CHIUSA");}
"["		{System.out.print("QUADRA_APERTA");}
"]"		{System.out.print("QUADRA_CHIUSA");}
"extern" 	{System.out.print("EXTERN");}
"bool"		{System.out.print("BOOL");}
"int"		{System.out.print("INT");}
"float"		{System.out.print("FLOAT");}
"string"	{System.out.print("STRING");}
"void"		{System.out.print("VOID");}
