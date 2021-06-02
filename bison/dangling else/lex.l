%{
    #include "parse.tab.h"
%}

%option noyywrap

%%

if      return IF;
else    return ELSE;
then    return THEN;
id      return ID;

%%