/*Esta es la seccion del usuario, aqui podemos agregar codigo java,
 esto se va a pegar al inicio del archivo del scanner que jflex genera
*/
package analizadores;

import java_cup.runtime.*;


%%

/*Aqui inicia la seccion de directivas de jflex, aqui se transfomaran las directivas en un scanner de jflex valido*/
/*Aqui se pueden agregar marcos o expresiones regulares que se pueden referenciar en la ultima seccion de reglas*/

/*En la variable string se van a guardar los elementos que se encuentren entre comillas*/
%{
    //Código de usuario
    String string= "";
%}


/*Aqui se definen las caracteristicas del scanner*/
%standalone
%cup
%class scanner
%public
%line
%column
%full
%state STRING
%ignorecase
%scanerror LexicalException
%unicode

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
%%


/*Seccion de reglas, aqui se especifica que hacer cuando se encuentra cada lexema*/

<YYINITIAL> "abstract"           { return symbol(sym.ABSTRACT); }
<YYINITIAL> "boolean"            { return symbol(sym.BOOLEAN); }

<YYINITIAL> {INT1}      { return new Symbol(sym.INT1, yyline, yycolumn,"entero");}
<YYINITIAL> {CHAR1}     { return new Symbol(sym.CHAR1, yyline, yycolumn,"caracter");}
<YYINITIAL> {PUB}       { return new Symbol(sym.PUB, yyline, yycolumn,"publico");}
<YYINITIAL> {PRI}       { return new Symbol(sym.PRI, yyline, yycolumn,"privado");}
<YYINITIAL> {VOI}       { return new Symbol(sym.VOI, yyline, yycolumn,yytext());}
<YYINITIAL> {PRINT}     { return new Symbol(sym.PRINT, yyline, yycolumn,yytext());}
<YYINITIAL> {ELIF}     { return new Symbol(sym.ELIF, yyline, yycolumn,yytext());}
<YYINITIAL> {IF}     { return new Symbol(sym.IF, yyline, yycolumn,yytext());}
<YYINITIAL> {RETURN}     { return new Symbol(sym.RETURN, yyline, yycolumn,yytext());}
<YYINITIAL> {BREAK}     { return new Symbol(sym.BREAK, yyline, yycolumn,yytext());}
<YYINITIAL> {FOR}     { return new Symbol(sym.FOR, yyline, yycolumn,yytext());}
<YYINITIAL> {ELSE}     { return new Symbol(sym.ELSE, yyline, yycolumn,yytext());}
<YYINITIAL> {ELIF}     { return new Symbol(sym.ELIF, yyline, yycolumn,yytext());}


<YYINITIAL> {DISYUNCION}     { return new Symbol(sym.DISYUNCION, yyline, yycolumn,yytext());}
<YYINITIAL> {CONJUNCION}     { return new Symbol(sym.CONJUNCION, yyline, yycolumn,yytext());}
<YYINITIAL> {COMA}     { return new Symbol(sym.COMA, yyline, yycolumn,yytext());}
<YYINITIAL> {NEGACION}     { return new Symbol(sym.NEGACION, yyline, yycolumn,yytext());}
<YYINITIAL> {PUNTOYCOMA}     { return new Symbol(sym.PUNTOYCOMA, yyline, yycolumn,yytext());}
<YYINITIAL> {ABRECORCHETE}     { return new Symbol(sym.ABRECORCHETE, yyline, yycolumn,yytext());}
<YYINITIAL> {CIERRACORCHETE}     { return new Symbol(sym.CIERRACORCHETE, yyline, yycolumn,yytext());}
<YYINITIAL> {LLAVEIZQ}     { return new Symbol(sym.LLAVEIZQ, yyline, yycolumn,yytext());}
<YYINITIAL> {LLAVEDER}     { return new Symbol(sym.LLAVEDER, yyline, yycolumn,yytext());}
<YYINITIAL> {PARENIZQ}     { return new Symbol(sym.PARENIZQ, yyline, yycolumn,yytext());}
<YYINITIAL> {PARENDER}     { return new Symbol(sym.PARENDER, yyline, yycolumn,yytext());}
<YYINITIAL> {SUMA}     { return new Symbol(sym.SUMA, yyline, yycolumn,yytext());}
<YYINITIAL> {RESTA}     { return new Symbol(sym.RESTA, yyline, yycolumn,yytext());}
<YYINITIAL> {MULTIPLICACION}     { return new Symbol(sym.MULTIPLICACION, yyline, yycolumn,yytext());}
<YYINITIAL> {DIVISION}     { return new Symbol(sym.DIVISION, yyline, yycolumn,yytext());}
<YYINITIAL> {POTENCIA}     { return new Symbol(sym.POTENCIA, yyline, yycolumn,yytext());}
<YYINITIAL> {MODULO}     { return new Symbol(sym.MODULO, yyline, yycolumn,yytext());}
<YYINITIAL> {MAYOR}     { return new Symbol(sym.MAYOR, yyline, yycolumn,yytext());}
<YYINITIAL> {MENOR}     { return new Symbol(sym.MENOR, yyline, yycolumn,yytext());}
<YYINITIAL> {IGUAL}     { return new Symbol(sym.IGUAL, yyline, yycolumn,yytext());}
<YYINITIAL> {ASIGNA}     { return new Symbol(sym.ASIGNA, yyline, yycolumn,yytext());}
<YYINITIAL> {MAYOROIGUAL}     { return new Symbol(sym.MAYOROIGUAL, yyline, yycolumn,yytext());}
<YYINITIAL> {MENOROIGUAL}     { return new Symbol(sym.MENOROIGUAL, yyline, yycolumn,yytext());}

<YYINITIAL> {ENTERO}    { return new Symbol(sym.ENTERO, yyline, yycolumn,yytext());}
<YYINITIAL> {IDENTIFICADOR}        {return new Symbol(sym.ID, yyline, yycolumn,yytext());}
<YYINITIAL> [\"]        { yybegin(CADENA); String+="\""; }
<YYINITIAL> {ESPACIO}     { /*Espacios en blanco, ignorados*/ }
<YYINITIAL> {ENTER}     { /*Saltos de linea, ignorados*/}
    
    
 /*Esta definicion permite guardar cualquier cosa, cuando se inicia con comillas y se cierran*/
 <STRING> {
      \"                             { yybegin(YYINITIAL); 
                                       return symbol(sym.STRING_LITERAL, 
                                       string.toString()); }
      [^\n\r\"\\]+                   { string.append( yytext() ); }
      \\t                            { string.append('\t'); }
      \\n                            { string.append('\n'); }

      \\r                            { string.append('\r'); }
      \\\"                           { string.append('\"'); }
      \\                             { string.append('\\'); }
 }

/* Manejo de errores */
<YYINITIAL> . {
        String errLex = "Error léxico : '"+yytext()+"' en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1);
        System.out.println(errLex);
}