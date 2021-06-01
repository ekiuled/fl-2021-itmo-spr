%{
    #include "parse.tab.h"
%}

%option noyywrap

%%

t   { return T; }

%%