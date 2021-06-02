%{
    #include "parse.tab.h"
%}

%option noyywrap

%%

a   { return A; }
b   { return B; }

%%