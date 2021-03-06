/*Esta es la seccion del usuario, aqui podemos agregar codigo java,
 esto se va a pegar al inicio del archivo del scanner que jflex genera
*/
package analizadores;

import java_cup.runtime.Symbol;
import analizadores.Util;


%%

/*Aqui inicia la seccion de directivas de jflex, aqui se transfomaran las directivas en un scanner de jflex valido*/
/*Aqui se pueden agregar marcos o expresiones regulares que se pueden referenciar en la ultima seccion de reglas*/

/*En la variable string se van a guardar los elementos que se encuentren entre comillas*/
%{
    String cadena= "";
%}


/*Aqui se definen las caracteristicas del scanner*/
%standalone
%cup
%class scanner
%public
%line
%column
%full
%state CADENA
%ignorecase
%unicode

%{
	//StringBuffer string = new StringBuffer();

	private Symbol symbol(int type) {
		return new Symbol(type);
	}
	
	private Symbol symbol(int type, Object value) {
		return new Symbol(type, value);
	}
%}

/*Macros o Expresiones regulares que luego pueden referenciarse en las reglas*/
/*Identificador = Expresion regular*/

//simbolos

DISYUNCION = "||"
CONJUNCION = "&&"
COMA = ","
NEGACION = "!"
PUNTOYCOMA = ";"
ABRECORCHETE = "["
CIERRACORCHETE = "]"
LLAVEIZQ = "{"
LLAVEDER = "}"
PARENIZQ = "("
PARENDER = ")"
SUMA = "+"
RESTA = "-"
MULTIPLICACION = "*"
DIVISION = "//"
POTENCIA = "**" 
MODULO = "~"
MAYOR = ">"
MENOR = "<"
IGUAL = "=="
ASIGNA = "="
MAYOROIGUAL = ">="
MENOROIGUAL = "<="

DIVMODULAR="/"
CONDTERNARIA = ":"
SIGNOPREGUNTA ="?"
NUMERAL="#"

//Expresiones
DIGITOS = [0-9]
ENTERO = [0-9]+
SALTOLINEA = \r|\n|\r\n
ESPACIO   = [\ \r\t\f\t]
ENTER   = [\ \n]

FLOAT = ( [-] ?  [ 0-9 ] + [.] [ 0-9 ] + )
CARACTER = [a-z][A-Z]

CARACTERCOMENTARIO = [^\r\n]

/* Comentarios */
COMENTARIO = {COMENTARIOMULTILINEA} | {COMENTARIOLINEA}
 
COMENTARIOMULTILINEA   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
COMENTARIOLINEA     = "#" {CARACTERCOMENTARIO}* {SALTOLINEA}?

IDENTIFICADOR = [:jletter:] [:jletterdigit:]*

DecIntegerLiteral = 0 | [1-9][0-9]*

//palabras reservadas

KEYWORDINT     = "int"
CHAR1    = "char"
PRINT    = "print"
READ	 = "read"
ELIF = "elif"
IF = "if"
RETURN = "return"
BREAK = "break"
FOR = "for"
ELSE = "else"
ELIF = "elif"

KEYWORDFLOAT = "float"
KEYWORDFUNCTION = "function"
KEYWORDMAIN = "main"
KEYWORDARRAY = "array"
KEYWORDSTRING = "string"
KEYWORDNULL="null"
KEYWORDBOOLEAN="boolean"
KEYWORDREAL="real"

TRUE = "true"
FALSE = "false"
KEYWORDNOT="not"


%%


/*Seccion de reglas, aqui se especifica que hacer cuando se encuentra cada lexema*/

<YYINITIAL> {KEYWORDINT} { Util.WriteToken("Encontre un tipo ENTERO Linea: " + (yyline + 1) + " columna " + (yycolumn+1) + " Este es el ID del token: " + sym.KEYWORDINT); return new Symbol(sym.KEYWORDINT, yyline, yycolumn,"entero");}

<YYINITIAL> {CHAR1}     { Util.WriteToken("Encontre un tipo CHAR1 Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.CHAR1);
                        return new Symbol(sym.CHAR1, yyline, yycolumn,"char");}
<YYINITIAL> {PRINT}     { Util.WriteToken("Encontre un print Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.PRINT);
                        return new Symbol(sym.PRINT, yyline, yycolumn,"print");}
<YYINITIAL> {READ}     	{ Util.WriteToken("Encontre un read Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.READ);
                        return new Symbol(sym.READ, yyline, yycolumn,"read");}
<YYINITIAL> {ELIF}     	{ Util.WriteToken("Encontre un elif Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.ELIF);
                        return new Symbol(sym.ELIF, yyline, yycolumn,"elif");}
<YYINITIAL> {IF}     	{ Util.WriteToken("Encontre un if Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.IF);
                        return new Symbol(sym.IF, yyline, yycolumn,"if");}
<YYINITIAL> {RETURN}    { Util.WriteToken("Encontre un return Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.RETURN);
                        return new Symbol(sym.RETURN, yyline, yycolumn,"return");}
<YYINITIAL> {BREAK}     { Util.WriteToken("Encontre un break Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.BREAK);
                        return new Symbol(sym.BREAK, yyline, yycolumn,"break");}
<YYINITIAL> {FOR}     	{ Util.WriteToken("Encontre un for Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.FOR);
                        return new Symbol(sym.FOR, yyline, yycolumn,"for");}
<YYINITIAL> {ELSE}     	{ Util.WriteToken("Encontre un else Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.ELSE);
                        return new Symbol(sym.ELSE, yyline, yycolumn,"else");}
<YYINITIAL> {ELIF}     	{ Util.WriteToken("Encontre un elif Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.ELIF);
                        return new Symbol(sym.ELIF, yyline, yycolumn,"elif");}

<YYINITIAL> {KEYWORDMAIN}       { Util.WriteToken("Encontre un Kmain Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.KEYWORDMAIN);
                                return new Symbol(sym.KEYWORDMAIN, yyline, yycolumn,"main");}
<YYINITIAL> {KEYWORDARRAY}      { Util.WriteToken("Encontre un Karray Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.KEYWORDARRAY);
                                return new Symbol(sym.KEYWORDARRAY, yyline, yycolumn,"array");}
<YYINITIAL> {KEYWORDFLOAT}    	{ Util.WriteToken("Encontre un KFLOAT Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.KEYWORDFLOAT);
                                return new Symbol(sym.KEYWORDFLOAT, yyline, yycolumn,"keywordfloat");}
<YYINITIAL> {KEYWORDFUNCTION}   { Util.WriteToken("Encontre un KFUNTION Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.KEYWORDFUNCTION);
                                return new Symbol(sym.KEYWORDFUNCTION, yyline, yycolumn,"function");}
<YYINITIAL> {KEYWORDSTRING}    	{ Util.WriteToken("Encontre un KSTRING Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.KEYWORDSTRING);
                                return new Symbol(sym.KEYWORDSTRING, yyline, yycolumn,"string");}
<YYINITIAL> {KEYWORDNULL}    	{ Util.WriteToken("Encontre un KNULL Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.KEYWORDNULL);
                                return new Symbol(sym.KEYWORDNULL, yyline, yycolumn,"null");}
<YYINITIAL> {KEYWORDBOOLEAN}    { Util.WriteToken("Encontre un KBOOLEAN Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.KEYWORDBOOLEAN);
                                return new Symbol(sym.KEYWORDBOOLEAN, yyline, yycolumn,"boolean");}
<YYINITIAL> {KEYWORDREAL}    	{ Util.WriteToken("Encontre un KREAL Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.KEYWORDREAL);
                                return new Symbol(sym.KEYWORDREAL, yyline, yycolumn,"real");}

<YYINITIAL> {DISYUNCION}     	{ Util.WriteToken("Encontre disyuncion Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.DISYUNCION);
                                return new Symbol(sym.DISYUNCION, yyline, yycolumn,"diyuncion");}
<YYINITIAL> {CONJUNCION}     	{ Util.WriteToken("Encontre conjuncion Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.CONJUNCION);
                                return new Symbol(sym.CONJUNCION, yyline, yycolumn,"conjuncion");}
<YYINITIAL> {COMA}     		{ Util.WriteToken("Encontre coma Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.COMA);
                                return new Symbol(sym.COMA, yyline, yycolumn,"coma");}
<YYINITIAL> {NEGACION}     	{ Util.WriteToken("Encontre negacion Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.NEGACION);
                                return new Symbol(sym.NEGACION, yyline, yycolumn,"negacion");}
<YYINITIAL> {PUNTOYCOMA}     	{ Util.WriteToken("Encontre puntoycoma Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.PUNTOYCOMA);
                                return new Symbol(sym.PUNTOYCOMA, yyline, yycolumn,"puntoycoma");}
<YYINITIAL> {ABRECORCHETE}     	{ Util.WriteToken("Encontre un ABRECORCHETE Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.ABRECORCHETE);
                                return new Symbol(sym.ABRECORCHETE, yyline, yycolumn,"abrecorchete");}
<YYINITIAL> {CIERRACORCHETE}    { Util.WriteToken("Encontre un CIERRACORCHETE Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.CIERRACORCHETE);
                                return new Symbol(sym.CIERRACORCHETE, yyline, yycolumn,"cierracorchete");}
<YYINITIAL> {LLAVEIZQ}     	{ Util.WriteToken("Encontre un LLAVEIZQ Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.LLAVEIZQ);
                                return new Symbol(sym.LLAVEIZQ, yyline, yycolumn,"llaveizq");}
<YYINITIAL> {LLAVEDER}     	{ Util.WriteToken("Encontre un LLAVEDER Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.LLAVEDER);
                                return new Symbol(sym.LLAVEDER, yyline, yycolumn,"llaveder");}
<YYINITIAL> {PARENIZQ}     	{ Util.WriteToken("Encontre un PARENIZQ Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.PARENIZQ);
                                return new Symbol(sym.PARENIZQ, yyline, yycolumn,"parenizq");}
<YYINITIAL> {PARENDER}     	{ Util.WriteToken("Encontre un PARENDER Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.PARENDER);
                                return new Symbol(sym.PARENDER, yyline, yycolumn,"parender");}
<YYINITIAL> {SUMA}     		{ Util.WriteToken("Encontre un SUMA Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.SUMA);
                                return new Symbol(sym.SUMA, yyline, yycolumn,"suma");}
<YYINITIAL> {RESTA}     	{ Util.WriteToken("Encontre un RESTA Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.RESTA);
                                return new Symbol(sym.RESTA, yyline, yycolumn,"resta");}
<YYINITIAL> {MULTIPLICACION}    { Util.WriteToken("Encontre un MULTIPLICACION Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.MULTIPLICACION);
                                return new Symbol(sym.MULTIPLICACION, yyline, yycolumn,"multiplicacion");}
<YYINITIAL> {DIVISION}     	{ Util.WriteToken("Encontre un DIVISION Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.DIVISION);
                                return new Symbol(sym.DIVISION, yyline, yycolumn,"division");}
<YYINITIAL> {POTENCIA}     	{ Util.WriteToken("Encontre un POTENCIA Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.POTENCIA);
                                return new Symbol(sym.POTENCIA, yyline, yycolumn,"potencia");}
<YYINITIAL> {MODULO}     	{ Util.WriteToken("Encontre un MODULO Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.MODULO);
                                return new Symbol(sym.MODULO, yyline, yycolumn,"modulo");}
<YYINITIAL> {MAYOR}     	{ Util.WriteToken("Encontre un MAYOR Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.MAYOR);
                                return new Symbol(sym.MAYOR, yyline, yycolumn,"mayor");}
<YYINITIAL> {MENOR}     	{ Util.WriteToken("Encontre un MENOR Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.MENOR);
                                return new Symbol(sym.MENOR, yyline, yycolumn,"menor");}
<YYINITIAL> {IGUAL}     	{ Util.WriteToken("Encontre un IGUAL Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.IGUAL);
                                return new Symbol(sym.IGUAL, yyline, yycolumn,"igual");}
<YYINITIAL> {ASIGNA}     	{ Util.WriteToken("Encontre un ASIGNA Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.ASIGNA);
                                return new Symbol(sym.ASIGNA, yyline, yycolumn,"asigna");}
<YYINITIAL> {MAYOROIGUAL}     	{ Util.WriteToken("Encontre un MAYOROIGUAL Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.MAYOROIGUAL);
                                return new Symbol(sym.MAYOROIGUAL, yyline, yycolumn,"mayoroigual");}
<YYINITIAL> {MENOROIGUAL}     	{ Util.WriteToken("Encontre un MENOROIGUAL Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.MENOROIGUAL);
                                return new Symbol(sym.MENOROIGUAL, yyline, yycolumn,"menoroigual");}

<YYINITIAL> {DIVMODULAR}     	{ Util.WriteToken("Encontre un DIVMODULAR Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.DIVMODULAR);
                                return new Symbol(sym.DIVMODULAR, yyline, yycolumn,"divmodular");}
<YYINITIAL> {CONDTERNARIA}     	{ Util.WriteToken("Encontre un CONDTERNARIA Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.CONDTERNARIA);
                                return new Symbol(sym.CONDTERNARIA, yyline, yycolumn,"condternaria");}
<YYINITIAL> {SIGNOPREGUNTA}     { Util.WriteToken("Encontre un SIGNOPREGUNTA Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.SIGNOPREGUNTA);
                                return new Symbol(sym.SIGNOPREGUNTA, yyline, yycolumn,"signopregunta");}
<YYINITIAL> {NUMERAL}     	{ Util.WriteToken("Encontre un NUMERAL Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.NUMERAL);
                                return new Symbol(sym.NUMERAL, yyline, yycolumn,"numeral");}

<YYINITIAL> {TRUE}     	        { Util.WriteToken("Encontre un TRUE Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.TRUE);
                                return new Symbol(sym.TRUE, yyline, yycolumn,"true");}
<YYINITIAL> {FALSE}     	{ Util.WriteToken("Encontre un FALSE Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.FALSE);
                                return new Symbol(sym.FALSE, yyline, yycolumn,"false");}

<YYINITIAL> {ENTERO}    	{ Util.WriteToken("Encontre un ENTERO  Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.ENTERO); 
                                return new Symbol(sym.ENTERO, yyline, yycolumn,"entero");}
<YYINITIAL> {IDENTIFICADOR}     { Util.WriteToken("Encontre un IDENTIFICADOR " + yytext()); 
                                return new Symbol(sym.IDENTIFICADOR, yyline, yycolumn,"identificador");}
<YYINITIAL> {ESPACIO}     	{ /*Espacios en blanco, ignorados*/ }
<YYINITIAL> {ENTER}     	{ /*Saltos de linea, ignorados*/}
<YYINITIAL> {COMENTARIO}     	{ /*COMENTARIOS IGNORADOS*/}

<YYINITIAL> {FLOAT}    		{ Util.WriteToken("Encontre un FLOAT  Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.FLOAT); 
                                return new Symbol(sym.FLOAT, yyline, yycolumn,"float");}
<YYINITIAL> {CARACTER}    	{ Util.WriteToken("Encontre un CARACTER  Linea: " + (yyline + 1) + " columna " + (yycolumn+1)+ " Este es el ID del token: " + sym.CARACTER); 
                                return new Symbol(sym.CARACTER, yyline, yycolumn,"caracter");}

<YYINITIAL> [\"]        { yybegin(CADENA); cadena+="\""; }
 
 /*Esta definicion permite guardar cualquier cosa, cuando se inicia con comillas y se cierran*/
 

<CADENA> {
        [\"] { String stringAcumulador=cadena+"\""; cadena=""; yybegin(YYINITIAL);  return new Symbol(sym.CADENA, yyline, yycolumn, stringAcumulador); }
        [\n] {String stringAcumulador=cadena; cadena="";  
                System.out.println("Se esperaba cierre de cadena (\")."); 
                yybegin(YYINITIAL);
            }
        [^\"] { cadena+=yytext();}
}

/* Manejo de errores */
<YYINITIAL> . {
        String errLex = "----> Error lexico! : '"+yytext()+"' en la linea: "+(yyline+1)+" y columna: "+(yycolumn+1);
        Util.WriteToken(errLex);
}