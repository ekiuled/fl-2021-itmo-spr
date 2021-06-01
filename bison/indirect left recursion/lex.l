%{
    #include "parse.tab.h"
%}

%option noyywrap

%%

[a-z]+      { return ID; }
\+          { return PLUS; }
\(          { return LBR; }
\)          { return RBR; }
[:space:]   ;

%%