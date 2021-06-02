%{
    #include "parse.tab.h"
    #include <iostream>
    int comment_count = 0;
%}

%option noyywrap stack

%x COMMENT

%%

[a-z]+      return ID;
\;          return SEP;
[:space:]   ;
"/*"        { yy_push_state(COMMENT); }

<COMMENT>{
    "/*"    { yy_push_state(COMMENT); }
    "*/"    { yy_pop_state(); }
    .|\n    ;
}

%%