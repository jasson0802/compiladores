<main> ::= 
     int main parenizq parender bloquecodigo
<main> ::= 
     int main parenizq parametros* parender bloquecodigo
<parametros> ::= 
     tipo identificador
<parametros> ::=
     tipo identificador coma parametros
<digito> ::= 
     [0-9]
<non-zero> ::= 
     [1-9]*
<entero> ::= 
     [1-9][0-9]*
<float> ::=
     ( [-] ?  [ 0-9 ] + [.] [ 0-9 ] + ) //<-------NUEVO
<real> ::= 
     non-zero punto digito*
<true> ::= 
     'true' | 1
<false> ::= 
     'false' | 0
<booleano> ::= 
     true | false
<keyworReal> ::= 
     'float'  //<------------ eliminado el  | 'double' 
<keywordArreglo> ::=  //<-----------ARREGLO INALCANZABLE ?? ES que las producciones no estan completamente desarrolladas <NUNCA LLEGA>
     'array'
<keywordBooleano> := 
     'boolean'
<keywordEntero> := 
     'int'
<tipo> ::= 
     keywordReal | keywordBooleano| keywordArreglo | keywordInt
<literal> ::= 
     entero | string | booleano |char //<-------FALTA QUE CONSIDERE TODOS LOS CARACTERES ESPECIALES cuales?

//----------------CARACTERES ESPECIALES-----------------------
<disyuncion> ::= 
     '|'
<conjuncion> ::= 
     '&'
<caracter> ::= 
     ([a-z]|[A-Z])
<negacion> ::= 
     '!'
<comillaAbre> ::= 
     “
<comillaCierra> ::= 
     ”
<coma> ::= 
     ','
<puntoycoma> ::= 
     ';'
<abreCorchete> ::= 
     '['
<cierraCorchete> ::= 
     ']'
<llaveIzq> ::= 
     '{'
<llaveDer> ::= 
     '}'
<parenizq> ::= 
     '('
<parender> ::= 
     ')'
<numeral> ::=
     '#'
<condicionTernaria> ::=
     ':'
<ternario> ::=
     '?'

<keyword> ::= 
     'string'| 'int' | 'return' | 'break' | 'if' | 'else' | 'elif' | 'for'
<identificador> ::= 
     caracter(caracter|digito)*
<keywordFunction> ::= 
     function
<parametros_funcion> ::= 
     parenizq parametros parender
<parametros_funcion> ::= 
     parenizq parender
<funcion> ::= 
     keywordFunction identificador parametros_funcion bloquecodigo
<comentarioMul> ::= 
     division multiplicacion literal* multiplicacion division
<comentarioLin> ::= 
     division division literal*
<string> ::= 
     comillaAbre caracter* comillaCierra
<arregloestatico> ::= //<------------------------ARREGLO INALCANZABLE
     abrelista literal (coma literal)* cierraLista
<nulo> ::= 
     (null| ) //<---------------PORQUE NULO INALCANZABLE

//------------------OPERADORES------------------------
<suma> ::= 
     '+'
<resta> ::= 
     '-'
<multiplicacion> ::= 
     '*'
<division> ::= 
     '//'
<potencia> ::= 
     '**' 
<modulo> ::= 
     '~'
<mayor> ::= 
     '>'
<menor> ::= 
     '<'
<igual> ::= 
     '=='
<asigna> ::= 
     '='
<mayoroigual> ::= 
     '>='
<menoroigual> ::= 
     '<='
<diferente> ::= 
     !asigna
<divisionMod> ::=
     '/'

//------------------------------------------------------------
<operadorAritmetico> ::= 
     suma|resta|multiplicacion|division|modulo    //<----------------------NO DEBE UTILIZARSE  ¿ BORRAR ?

<operadorRelacional> ::= 
     mayor|menor|igual|mayoroigual|menoroigual|diferente
<operadorLogico> ::= 
     disyuncion | conjuncion
<asignacreacexpre> ::= 
     tipo id puntoycoma
<asignacreacexpre> ::= 
     tipo id asigna (expresion | literal | arregloestatico) puntoycoma  //<---------NUEVO  puntoycoma
<instruccion> ::= 
     (asignacreacexpre | instruccionReturn| instruccionIf | instruccionFor|instruccionElse|instruccionElif | instruccion | funcion)
<bloquecodigo> ::= 
     llaveIzq instruccion* llaveDer
//----------------------------------------KEYWORDS-----------------
<keywordIf> ::=  
     'if'
<instruccionIf> ::= 
     keywordIf parenizq (expRelacional|expLogica) parender bloquecodigo
<keywordReturn> ::= 
     'return'
<instruccionReturn> ::= 
     keywordReturn (expresion|literal); 
<keywordbreak> ::= 
     'break'
<instruccionBreak> ::= 
     keywordbreak puntoycoma
<keywordFor> ::= 
     'for'
<instruccionFor> ::= 
     keywordFor pareniz asignacreacexpre puntoycoma expresion parender bloquecodigo
<keywordElse> ::= 
     'else'
<instruccionElse> ::= 
     keywordElse bloquecodigo
<keywordElif> ::= 
     'elif'
<instruccionElif> ::= 
     keywordElif parenizq (expRelacional|expLogica) parender bloquecodigo
//----------------------------------------EXPRESSION----------------------
<expresion> ::= 
     expAritmetica | expRelacional | expLogica | ejecutaFuncion
<expAritmetica> ::= 
     (identificador|literal|ejecutaFuncion)operadorAritmetico(identificador|literal|ejecutaFuncion)
<expAritmetica> ::= 
     parenizq expAritmetica parender
//--------------------------------------
<expRelacional> ::= 
     (identificador|literal|expresion)operadorRelacional(identificador|literal|expresion)
<expRelacional> ::= 
     parenizq expRelacional parender

//----------------------------------------LOGICA---------------------------   
<expLogica> ::= 
     (identificador|literal|expresion)(operadorAritmetico | operadorLogico)(identificador|literal|expresion)
<expLogica> ::= 
     parenizq expLogica parender
<expLogica> ::= 
     negacion expLogica
<expLogica> ::= 
     booleano
//----------------------------------------------------FUNCIONES---
<ejecutaFuncion> ::= 
     identificador parenizq valoresFuncion  parender
<valoresFuncion> ::= 
     identificador|literal
<valoresFuncion> ::= 
     identificador coma valoresFuncion
//--------------------------------------------NUEVO------------------------
<unarios> ::=
     literal suma suma |
     literal resta resta |
     negacion booleano 

<impresion> ::=
     print | read

<exprImpresion> ::=
     impresion literal | entero

<exprArreglo> ::=
