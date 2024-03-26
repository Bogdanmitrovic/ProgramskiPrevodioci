import java_cup.runtime.*;

%%

%class Lexer
%cup
%line
%column

%eofval{
    return new Symbol(sym.EOF);
%eofval}

cifra=[0-9]
slovo=[A-Za-z]

%%

\[ {return new Symbol(sym.OPEN_BRACKET);}
\] {return new Symbol(sym.CLOSE_BRACKET);}
\. {return new Symbol(sym.DOT);}
[\t\n\r]+ {;}
{slovo}[{slovo}|{cifra}|_]* {return new Symbol(sym.ID,yytext());}
[+-]?{cifra}+.{cifra}+ {return new Symbol(sym.CONST_REAL, Double.parseDouble(yytext()));}
[+-]?{cifra}+e[+-]?{cifra}+ {return new Symbol(sym.CONST_REAL, Double.parseDouble(yytext()));}
[+-]?{cifra}+ {return new Symbol(sym.CONST_INT, Integer.parseInt(yytext()));}
\"[^\"]\" {return new Symbol(sym.CONST_STRING, yytext().substring(1,yytext().length()-2));}