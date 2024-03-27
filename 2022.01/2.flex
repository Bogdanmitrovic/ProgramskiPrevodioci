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

[\t\n\r]+ {;}
"class" {return new Symbol(sym.CLASS);}
; {return new Symbol(sym.SEMICOLON);}
\{ {return new Symbol(sym.OPEN_BRACE);}
\} {return new Symbol(sym.CLOSED_BRACE);}
= {return new Symbol(sym.ASSIGN);}
[+-]?{cifra}+ {return new Symbol(sym.CONST_INT);}
[+-]?{cifra}+e[+-]{cifra}+ {return new Symbol(sym.CONST_REAL);}
\'[^\']\' {return new Symbol(sym.CONST_CHAR);}
({slovo}|_|$)({slovo}|{cifra}|_|$)* {return new Symbol(sym.ID);}
. {System.out.println("Nije prepoznat tekst");}