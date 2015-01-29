import java.io.*;
import java.lang.*;

class Es3 {
    public static void main(String argv[]) {
        if (argv.length == 0) {
            System.out.println("Usage : java Yylex <inputfile>");
        }
        else {
            /* Header html */
            System.out.println("<HTML>");
            System.out.println("<BODY bgcolor = #FFFFFF>");

            for (int i = 0; i < argv.length; i++) {
                /* 1 - Dichiarare lo scanner */
                Yylex scanner = null;
                try {
                    /* Scrive il titolo e apre il tag <code> */
                    System.out.println("<H2>"+argv[0]+"</H2>");
                    System.out.println("<CODE>");
                    /* 2 - scanner = new Yylex() -> Creo un istanza dello scanner con il
                    costruttore Yylex()
                    3 - new java.io.FileReader(argv[i]) -> Al costruttore posso passare
                    un file, sul quale eseguire lo scanning*/
                    scanner = new Yylex( new java.io.FileReader(argv[i]) );
                    /* 4 - Scannerizzo il file, fino a quando non arrivo alla fine del file: in tal caso
                    la funzione yylex() restituisce Yylex.YYEOF
                    IMP: La funzione yylex restituisce un intero solo perchè nel file .flex si
                    è ultilizzata la direttiva %integer, altrimenti restituisce una classe
                    di tipo YyToken*/
                    while ( scanner.yylex() != Yylex.YYEOF );
                    /* Chiude il tag <code> */
                    System.out.println("</CODE>");
                }

                catch (java.io.FileNotFoundException e) {
                    System.out.println("File not found : \"" + argv[i] + "\"");
                }
                catch (java.io.IOException e) {
                    System.out.println("IO error scanning file \"" + argv[i] + "\"");
                    System.out.println(e);
                }
                catch (Exception e) {
                    System.out.println("Unexpected exception:");
                    e.printStackTrace();
                }
            }
            /* Footer Html */
            System.out.println("</BODY>");
            System.out.println("</HTML>");
        }
    }
}
