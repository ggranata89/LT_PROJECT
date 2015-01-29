/* Esercitazione 1 - Esercizio 1 */

%%

/* %standalone -> Viene creata in automatico da JFlex il metodo main, che si aspetta
come argomenti la lista di file su cui applicare lo scanner*/
%standalone

%class Lexer
%unicode

nl     = \n|\r|\r\n

letter = [^\n\r\\/:*?\"<> |0-9]
digit  = [0-9]
id     = ({letter}|{digit})+ 

%%


^({letter}:)?(\\)?({id}\\)*{id}("."{id})?$ {
  System.out.println("Path Valido: " + yytext());  
}

^.*$ {
  System.out.println("Path Errato: " + yytext());
}

//Quando trovo un carattere di a capo non faccio nulla per
//evitare che venga stampato in uscita
{nl}  		{;}
