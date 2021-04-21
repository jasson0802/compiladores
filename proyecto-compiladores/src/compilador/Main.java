package compilador;

import java.io.BufferedReader;
import java.io.StringReader;
import analizadores.parser;
import analizadores.scanner;

public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            String texto="int miVar=10;";
            System.out.println("Inicia el analisis...\n");
            scanner scan = new scanner(new BufferedReader( new StringReader(texto)));
            //System.out.println(scan.yystate());
            parser parser = new analizadores.parser(scan);
            parser.parse();
            System.out.println("Finaliza el analisis...");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }   
}