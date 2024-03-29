class Htmllib {
    /* Costanti per i colori */
    public static final int C_BLUE   = 1;
    public static final int C_GREEN  = 2;
    public static final int C_CYAN   = 3;
    public static final int C_RED    = 4;
    public static final int C_WHITE  = 7;
    public static final int C_LBLUE  = 9;
    public static final int C_LGREEN = 10;
    public static final int C_LCYAN  = 11;
    public static final int C_LRED   = 12;


    /* Apre il tag <font> impostando come colore quello passato alla funzione
    tramite la variabile c */
    public static void colPrint(int c) {
        switch(c) {
            case C_BLUE: 	System.out.print("<FONT color=00007f>"); break;

            case C_GREEN: 	System.out.print("<FONT color=007f00>"); break;

            case C_CYAN: 	System.out.print("<FONT color=007f7f>"); break;

            case C_RED: 	System.out.print("<FONT color=7f0000>"); break;

            case C_WHITE: 	System.out.print("<FONT color=White>"); break;

            case C_LBLUE: 	System.out.print("<FONT color=0000ff>"); break;

            case C_LGREEN: 	System.out.print("<FONT color=00ff00>"); break;

            case C_LCYAN: 	System.out.print("<FONT color=00ffff>"); break;

            case C_LRED: 	System.out.print("<FONT color=ff0000>"); break;

            default: break;
        }
    }

    /* Stampa una stringa sostituendo i caratteri non rappresentabili in html
    con i rispettivi caratteri corretti*/
    public static void textPrint(String s) {
        for(int c=0; c < s.length(); c++) {
            switch(s.charAt(c)) {
                case '<': System.out.print("&lt;"); break;

                case '>': System.out.print("&gt;"); break;

                case '\n': System.out.print("<br>\n"); break;

                case '&': System.out.print("&amp;"); break;

                default: System.out.print(s.charAt(c)); break;
            }
        }
    }

    /** Chiude il tag <font>: stampa </font>  */
    public static void endtagPrint() {
        System.out.print("</FONT>");
    }
}
