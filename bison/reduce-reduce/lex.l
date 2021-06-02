%{
    #include "parse.tab.h"
%}

%option noyywrap

%%

[a-z]+          return WORD;
[><][0-9a-z]+   return REDIRECT;

%%