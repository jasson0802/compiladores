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
    //Código de usuario
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
	StringBuffer string = new StringBuffer();

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

DISYUNCION = "|"
CONJUNCION = "&"
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
VALIDTERNARIO ="?"
NUMERAL="#"

//Expresiones
DIGITOS = [0-9]
ENTERO = [0-9]+
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
ESPACIO   = [\ \r\t\f\t]
ENTER   = [\ \n]


FLOAT = ( [-] ?  [ 0-9 ] + [.] [ 0-9 ] + )
CARACTER = [a-z]|[A-Z]

 /* Comentarios */
 Comentario = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}
 
TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
// Comment can be the last line of the file, without line terminator.
EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*

IDENTIFICADOR = [:jletter:] [:jletterdigit:]*

DecIntegerLiteral = 0 | [1-9][0-9]*

//palabras reservadas

INT1     = "int"
CHAR1    = "char"
PUB      = "public"
PRI      = "private"
VOI      = "void"
PRINT    = "print"
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

%%


/*Seccion de reglas, aqui se especifica que hacer cuando se encuentra cada lexema*/

<YYINITIAL> "abstract"           { return symbol(sym.ABSTRACT); }
<YYINITIAL> "boolean"            { return symbol(sym.BOOLEAN); }

<YYINITIAL> {INT1}      { Util.WriteToken("Encontre un tipo ENTERO Linea: " + yyline + " columna " + yycolumn); return new Symbol(sym.INT1, yyline, yycolumn,"entero");}
<YYINITIAL> {CHAR1}     { Util.WriteToken("Encontre un tipo CHAR1 Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.CHAR1, yyline, yycolumn,"char");}
<YYINITIAL> {PUB}       { Util.WriteToken("Encontre un public Linea: " + yyline + " columna " + yycolumn); return new Symbol(sym.PUB, yyline, yycolumn,"public");}
<YYINITIAL> {PRI}       { Util.WriteToken("Encontre un private Linea: " + yyline + " columna " + yycolumn); return new Symbol(sym.PRI, yyline, yycolumn,"private");}
<YYINITIAL> {VOI}       { Util.WriteToken("Encontre un void Linea: " + yyline + " columna " + yycolumn +" Token ID: " + sym.VOI); return new Symbol(sym.VOI, yyline, yycolumn,"void");}
<YYINITIAL> {PRINT}     { Util.WriteToken("Encontre un print Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.PRINT, yyline, yycolumn,"print");}
<YYINITIAL> {ELIF}     	{ Util.WriteToken("Encontre un elif Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.ELIF, yyline, yycolumn,"elif");}
<YYINITIAL> {IF}     	{ Util.WriteToken("Encontre un if Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.IF, yyline, yycolumn,"if");}
<YYINITIAL> {RETURN}    { Util.WriteToken("Encontre un return Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.RETURN, yyline, yycolumn,"return");}
<YYINITIAL> {BREAK}     { Util.WriteToken("Encontre un break Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.BREAK, yyline, yycolumn,"break");}
<YYINITIAL> {FOR}     	{ Util.WriteToken("Encontre un for Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.FOR, yyline, yycolumn,"for");}
<YYINITIAL> {ELSE}     	{ Util.WriteToken("Encontre un else Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.ELSE, yyline, yycolumn,"else");}
<YYINITIAL> {ELIF}     	{ Util.WriteToken("Encontre un elif Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.ELIF, yyline, yycolumn,"elif");}

<YYINITIAL> {KEYWORDMAIN}      { Util.WriteToken("Encontre un Kmain Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.KEYWORDMAIN, yyline, yycolumn,"main");}
<YYINITIAL> {KEYWORDARRAY}   { Util.WriteToken("Encontre un Karray Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.KEYWORDARRAY, yyline, yycolumn,"array");}
<YYINITIAL> {KEYWORDFLOAT}    		    { Util.WriteToken("Encontre un KFLOAT Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.KEYWORDFLOAT, yyline, yycolumn,"float");}
<YYINITIAL> {KEYWORDFUNCTION}    		    { Util.WriteToken("Encontre un KFUNTION Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.KEYWORDFUNCTION, yyline, yycolumn,"function");}
<YYINITIAL> {KEYWORDSTRING}    		    { Util.WriteToken("Encontre un KSTRING Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.KEYWORDSTRING, yyline, yycolumn,"string");}
<YYINITIAL> {KEYWORDNULL}    		    { Util.WriteToken("Encontre un KNULL Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.KEYWORDNULL, yyline, yycolumn,"null");}



<YYINITIAL> {DISYUNCION}     	{ Util.WriteToken("Encontre disyuncion Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.DISYUNCION, yyline, yycolumn,"diyuncion");}
<YYINITIAL> {CONJUNCION}     	{ Util.WriteToken("Encontre conjuncion Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.CONJUNCION, yyline, yycolumn,"conjuncion");}
<YYINITIAL> {COMA}     			{ Util.WriteToken("Encontre coma Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.COMA, yyline, yycolumn,"coma");}
<YYINITIAL> {NEGACION}     		{ Util.WriteToken("Encontre negacion Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.NEGACION, yyline, yycolumn,"negacion");}
<YYINITIAL> {PUNTOYCOMA}     	{ Util.WriteToken("Encontre puntoycoma Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.PUNTOYCOMA, yyline, yycolumn,"puntoycoma");}
<YYINITIAL> {ABRECORCHETE}     	{ Util.WriteToken("Encontre un ABRECORCHETE Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.ABRECORCHETE, yyline, yycolumn,"abrecorchete");}
<YYINITIAL> {CIERRACORCHETE}    { Util.WriteToken("Encontre un CIERRACORCHETE Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.CIERRACORCHETE, yyline, yycolumn,"cierracorchete");}
<YYINITIAL> {LLAVEIZQ}     		{ Util.WriteToken("Encontre un LLAVEIZQ Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.LLAVEIZQ, yyline, yycolumn,"llaveizq");}
<YYINITIAL> {LLAVEDER}     		{ Util.WriteToken("Encontre un LLAVEDER Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.LLAVEDER, yyline, yycolumn,"llaveder");}
<YYINITIAL> {PARENIZQ}     		{ Util.WriteToken("Encontre un PARENIZQ Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.PARENIZQ, yyline, yycolumn,"parenizq");}
<YYINITIAL> {PARENDER}     		{ Util.WriteToken("Encontre un PARENDER Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.PARENDER, yyline, yycolumn,"parender");}
<YYINITIAL> {SUMA}     			{ Util.WriteToken("Encontre un SUMA Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.SUMA, yyline, yycolumn,"suma");}
<YYINITIAL> {RESTA}     		{ Util.WriteToken("Encontre un RESTA Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.RESTA, yyline, yycolumn,"resta");}
<YYINITIAL> {MULTIPLICACION}    { Util.WriteToken("Encontre un MULTIPLICACION Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.MULTIPLICACION, yyline, yycolumn,"multiplicacion");}
<YYINITIAL> {DIVISION}     		{ Util.WriteToken("Encontre un DIVISION Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.DIVISION, yyline, yycolumn,"division");}
<YYINITIAL> {POTENCIA}     		{ Util.WriteToken("Encontre un POTENCIA Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.POTENCIA, yyline, yycolumn,"potencia");}
<YYINITIAL> {MODULO}     		{ Util.WriteToken("Encontre un MODULO Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.MODULO, yyline, yycolumn,"modulo");}
<YYINITIAL> {MAYOR}     		{ Util.WriteToken("Encontre un MAYOR Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.MAYOR, yyline, yycolumn,"mayor");}
<YYINITIAL> {MENOR}     		{ Util.WriteToken("Encontre un MENOR Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.MENOR, yyline, yycolumn,"menor");}
<YYINITIAL> {IGUAL}     		{ Util.WriteToken("Encontre un IGUAL Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.IGUAL, yyline, yycolumn,"igual");}
<YYINITIAL> {ASIGNA}     		{ Util.WriteToken("Encontre un ASIGNA Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.ASIGNA, yyline, yycolumn,"asigna");}
<YYINITIAL> {MAYOROIGUAL}     	{ Util.WriteToken("Encontre un MAYOROIGUAL Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.MAYOROIGUAL, yyline, yycolumn,"mayoroigual");}
<YYINITIAL> {MENOROIGUAL}     	{ Util.WriteToken("Encontre un MENOROIGUAL Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.MENOROIGUAL, yyline, yycolumn,"menoroigual");}


<YYINITIAL> {DIVMODULAR}     	{ Util.WriteToken("Encontre un DIVMODULAR Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.DIVMODULAR, yyline, yycolumn,"divmodular");}
<YYINITIAL> {CONDTERNARIA}     	{ Util.WriteToken("Encontre un CONDTERNARIA Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.CONDTERNARIA, yyline, yycolumn,"condternaria");}
<YYINITIAL> {VALIDTERNARIO}     { Util.WriteToken("Encontre un VALIDTERNARIO Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.VALIDTERNARIO, yyline, yycolumn,"validternario");}
<YYINITIAL> {NUMERAL}     	    { Util.WriteToken("Encontre un NUMERAL Linea: " + yyline + " columna " + yycolumn);return new Symbol(sym.NUMERAL, yyline, yycolumn,"numeral");}

<YYINITIAL> {ENTERO}    		{ Util.WriteToken("Encontre un ENTERO  Linea: " + yyline + " columna " + yycolumn); return new Symbol(sym.ENTERO, yyline, yycolumn,"entero");}
<YYINITIAL> {IDENTIFICADOR}     { Util.WriteToken("Encontre un IDENTIFICADOR " + yytext()); return new Symbol(sym.IDENTIFICADOR, yyline, yycolumn,"identificador");}
<YYINITIAL> {ESPACIO}     		{ /*Espacios en blanco, ignorados*/ }
<YYINITIAL> {ENTER}     		{ /*Saltos de linea, ignorados*/}
<YYINITIAL> {FLOAT}    		{ Util.WriteToken("Encontre un FLOAT  Linea: " + yyline + " columna " + yycolumn); return new Symbol(sym.FLOAT, yyline, yycolumn,"float");}
<YYINITIAL> {CARACTER}    		{ Util.WriteToken("Encontre un CARACTER  Linea: " + yyline + " columna " + yycolumn); return new Symbol(sym.CARACTER, yyline, yycolumn,"caracter");}
    
 /*Esta definicion permite guardar cualquier cosa, cuando se inicia con comillas y se cierran*/
 /*<CADENA> {
      \"                             { yybegin(YYINITIAL); 
                                       return symbol(sym.STRING_LITERAL, 
                                       string.toString()); }
      [^\n\r\"\\]+                   { string.append( yytext() ); }
      \\t                            { string.append('\t'); }
      \\n                            { string.append('\n'); }

      \\r                            { string.append('\r'); }
      \\\"                           { string.append('\"'); }
      \\                             { string.append('\\'); }
 }*/
 

<CADENA> {
      \"                             { yybegin(YYINITIAL); 
                                       return symbol(sym.CADENA, 
                                       cadena.toString()); }
      [^\n\r\"\\]+                   { cadena += yytext(); }
      \\t                            { cadena += '\t'; }
      \\n                            { cadena += '\n'; }

      \\r                            { cadena += '\r'; }
      \\\"                           { cadena += '\"'; }
      \\                             { cadena += '\\'; }
}

/* Manejo de errores */
<YYINITIAL> . {
        String errLex = "Error léxico : '"+yytext()+"' en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1);
        Util.WriteToken(errLex);
}