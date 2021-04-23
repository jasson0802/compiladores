/*Esta es la seccion del usuario, aqui podemos agregar codigo java,
 esto se va a pegar al inicio del archivo del scanner que jflex genera
*/
package analizadores;

import java_cup.runtime.Symbol;


%%

/*Aqui inicia la seccion de directivas de jflex, aqui se transfomaran las directivas en un scanner de jflex valido*/
/*Aqui se pueden agregar marcos o expresiones regulares que se pueden referenciar en la ultima seccion de reglas*/

/*En la variable string se van a guardar los elementos que se encuentren entre comillas*/
%{
    //C�digo de usuario
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
FLOAT="float"
FUNCTION="function"
%%


/*Seccion de reglas, aqui se especifica que hacer cuando se encuentra cada lexema*/

<YYINITIAL> "abstract"           { return symbol(sym.ABSTRACT); }
<YYINITIAL> "boolean"            { return symbol(sym.BOOLEAN); }

<YYINITIAL> {INT1}      { return new Symbol(sym.INT1);}
<YYINITIAL> {CHAR1}     { return new Symbol(sym.CHAR1);}
<YYINITIAL> {PUB}       { return new Symbol(sym.PUB);}
<YYINITIAL> {PRI}       { return new Symbol(sym.PRI);}
<YYINITIAL> {VOI}       { return new Symbol(sym.VOI);}
<YYINITIAL> {PRINT}     { return new Symbol(sym.PRINT);}
<YYINITIAL> {ELIF}     	{ return new Symbol(sym.ELIF);}
<YYINITIAL> {IF}     	{ return new Symbol(sym.IF);}
<YYINITIAL> {RETURN}    { return new Symbol(sym.RETURN);}
<YYINITIAL> {BREAK}     { return new Symbol(sym.BREAK);}
<YYINITIAL> {FOR}     	{ return new Symbol(sym.FOR);}
<YYINITIAL> {ELSE}     	{ return new Symbol(sym.ELSE);}
<YYINITIAL> {ELIF}     	{ return new Symbol(sym.ELIF);}
<YYINITIAL> {FLOAT}     { return new Symbol(sym.FLOAT);}
<YYINITIAL> {FUNCTION}  { return new Symbol(sym.FUNCTION);}


<YYINITIAL> {DISYUNCION}     	{ return new Symbol(sym.DISYUNCION);}
<YYINITIAL> {CONJUNCION}     	{ return new Symbol(sym.CONJUNCION);}
<YYINITIAL> {COMA}     			{ return new Symbol(sym.COMA);}
<YYINITIAL> {NEGACION}     		{ return new Symbol(sym.NEGACION);}
<YYINITIAL> {PUNTOYCOMA}     	{ return new Symbol(sym.PUNTOYCOMA);}
<YYINITIAL> {ABRECORCHETE}     	{ return new Symbol(sym.ABRECORCHETE);}
<YYINITIAL> {CIERRACORCHETE}    { return new Symbol(sym.CIERRACORCHETE);}
<YYINITIAL> {LLAVEIZQ}     		{ return new Symbol(sym.LLAVEIZQ);}
<YYINITIAL> {LLAVEDER}     		{ return new Symbol(sym.LLAVEDER);}
<YYINITIAL> {PARENIZQ}     		{ return new Symbol(sym.PARENIZQ);}
<YYINITIAL> {PARENDER}     		{ return new Symbol(sym.PARENDER);}
<YYINITIAL> {SUMA}     			{ return new Symbol(sym.SUMA);}
<YYINITIAL> {RESTA}     		{ return new Symbol(sym.RESTA);}
<YYINITIAL> {MULTIPLICACION}    { return new Symbol(sym.MULTIPLICACION);}
<YYINITIAL> {DIVISION}     		{ return new Symbol(sym.DIVISION);}
<YYINITIAL> {POTENCIA}     		{ return new Symbol(sym.POTENCIA);}
<YYINITIAL> {MODULO}     		{ return new Symbol(sym.MODULO);}
<YYINITIAL> {MAYOR}     		{ return new Symbol(sym.MAYOR);}
<YYINITIAL> {MENOR}     		{ return new Symbol(sym.MENOR);}
<YYINITIAL> {IGUAL}     		{ return new Symbol(sym.IGUAL);}
<YYINITIAL> {ASIGNA}     		{ return new Symbol(sym.ASIGNA);}
<YYINITIAL> {MAYOROIGUAL}     	{ return new Symbol(sym.MAYOROIGUAL);}
<YYINITIAL> {MENOROIGUAL}     	{ return new Symbol(sym.MENOROIGUAL);}
<YYINITIAL> {DIVMODULAR}        {return new Symbol(sym.DIVMODULAR);}
<YYINITIAL> {CONDTERNARIA}      {return new Symbol(sym.CONDTERNARIA);}
<YYINITIAL> {VALIDTERNARIO}     {return new Symbol(sym.VALIDTERNARIO);}
<YYINITIAL> {NUMERAL}           {return new Symbol(sym.NUMERAL);}

<YYINITIAL> {ENTERO}    		{ return new Symbol(sym.ENTERO);}
<YYINITIAL> {IDENTIFICADOR}     {return new Symbol(sym.ID);}
<YYINITIAL> {ESPACIO}     		{ /*Espacios en blanco, ignorados*/ }
<YYINITIAL> {ENTER}     		{ /*Saltos de linea, ignorados*/}
    
    
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
        String errLex = "Error l�xico : '"+yytext()+"' en la l�nea: "+(yyline+1)+" y columna: "+(yycolumn+1);
        System.out.println(errLex);
}