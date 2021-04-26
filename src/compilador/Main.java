package compilador;

import java.io.BufferedReader;
import java.io.File;
import java.io.StringReader;
import java.nio.charset.StandardCharsets;

import analizadores.parser;
import analizadores.scanner;
import java_cup.runtime.DefaultSymbolFactory;
import java_cup.runtime.SymbolFactory;
import analizadores.Util;

public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
        	String entrada = Util.readFile("entrada.txt", StandardCharsets.UTF_8);           
            Util.setPrintWriterPath("salida.txt");
        	System.out.println("Analisis lexico y sintactico\n");
            scanner scan = new scanner(new BufferedReader( new StringReader(entrada)));
            parser parser = new analizadores.parser(scan);
            parser.parse();
            System.out.println("Finaliza analisis lexico y sintactico");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }   
}