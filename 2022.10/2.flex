import java_cup.runtime.*

%%

%class Lexer
%cup
%line
%column

%eofval{
    return new Symbol (sym.EOF);
%eofval}

slovo=[A-Za-z]
cifra=[0-9]

%%

[\t\n\r]+                           {;}
,                                   {return new Symbol(sym.COMMA);}
;                                   {return new Symbol(sym.SEMICOLON);}
=                                   {return new Symbol(sym.ASSIGN);}
"char"                              {return new Symbol(sym.TYPE_CHAR);}
"int"                               {return new Symbol(sym.TYPE_INT);}
"double"                            {return new Symbol(sym.TYPE_DOUBLE);}
({slovo}|$|_)({slovo}|{cifra}|$|_)* {return new Symbol(sym.ID, yytext());}
(+|-)?{cifra}+                      {return new Symbol(sym.CONST_INT, Integer.parseInt(yytext()));}
(+|-)?{cifra}+e(+|-)?{cifra}+       {return new Symbol(sym.CONST_DOUBLE, Double.parseDouble(yytext()))}
{slovo}+                            {return new Symbol(sym.CONST_CHAR, yytext());}
.                                   {System.out.println("GRESKA");}