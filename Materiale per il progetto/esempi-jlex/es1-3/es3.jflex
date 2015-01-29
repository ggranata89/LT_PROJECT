/* Esercitazione 1 - Esercizio 3 */

%%

%state COMMENT
/* Fa in modo che la funzione yylex restituisca un intero: utile quando
jflex non viene utilizzato assieme a cup o in modalita' %standalone*/
%integer
%unicode

terminatoreLinea     = \r|\n|\r\n

keyword              = (if|then|else|while|switch|case|do|break|for|return|void|int|float|double|char|long|unsigned|signed)
const                = [0-9]+ 
direttiva            = "#"(include|define).*{terminatoreLinea} 

stringa              = \"([^\n\r\"]+|\\\")*\" 

identificatore       = [A-Za-z_][A-Za-z0-9_]* 
operatore            = ("+"|"-"|"/"|"*"|"<"|">"|"=="|">="|"<="|"=") 

%%

<YYINITIAL> {
  {keyword} {
    Htmllib.colPrint(Htmllib.C_LBLUE); 
    Htmllib.textPrint(yytext());  
    Htmllib.endtagPrint();
  } 
  {const} {
    Htmllib.colPrint(Htmllib.C_LRED); 
    Htmllib.textPrint(yytext()); 
    Htmllib.endtagPrint();
  } 
  {direttiva} {
    Htmllib.colPrint(Htmllib.C_LGREEN); 
    Htmllib.textPrint(yytext());
    Htmllib.endtagPrint();
  } 
  {operatore} {
    Htmllib.colPrint(Htmllib.C_BLUE); 
    Htmllib.textPrint(yytext()); 
    Htmllib.endtagPrint();
  } 
  {stringa} {
    Htmllib.colPrint(Htmllib.C_RED); 
    Htmllib.textPrint(yytext()); 
    Htmllib.endtagPrint();
  } 
  {identificatore} {
    Htmllib.colPrint(Htmllib.C_GREEN); 
    Htmllib.textPrint(yytext()); 
    Htmllib.endtagPrint();
  } 
  "/*" {
    yybegin(COMMENT); 
    Htmllib.colPrint(Htmllib.C_CYAN); 
    Htmllib.textPrint(yytext()); 
  }  
  \n {
    Htmllib.textPrint(yytext());
  }

/* Il punto serve per stampare in uscita anche i caratteri non riconosciuti dalle espressioni
regolari definite prima. Tali caratteri non subiranno nessuna formattazione.
Ad esempio: void funzione(int c)
Le parentesi tonde non sono riconosciute da nessuna delle espressioni regolari,
saranno percio' riscritte normalmente in nero
*/

. {
    Htmllib.textPrint(yytext());
}
  
}  
 
<COMMENT> {
  [^*]*      { Htmllib.textPrint(yytext()); }
  "*"+[^*/]* { Htmllib.textPrint(yytext()); }
  "*"+"/"    {
    Htmllib.textPrint(yytext()); 
    Htmllib.endtagPrint(); 
    yybegin(YYINITIAL);
  } 
}
