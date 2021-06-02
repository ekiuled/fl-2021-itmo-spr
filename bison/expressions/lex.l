%{
    #include "parse.tab.h"
%}

%option noyywrap

%%

[0-9]+      return INT;
\+          return PLUS;
\*          return MULT;
\^          return POW;
\(          return LBR;
\)          return RBR;
[:space:]   ;

%%