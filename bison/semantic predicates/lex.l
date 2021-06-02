%{
    #include "parse.tab.h"
%}

%option noyywrap

%%

typename    { yylval.str = strdup(yytext); return TYPENAME; }
[a-z]+      { yylval.str = strdup(yytext); return ID; }
\;          { yylval.str = strdup(yytext); return SEP; }
\*          { yylval.str = strdup(yytext); return MUL; }
\(          { yylval.str = strdup(yytext); return LBR; }
\)          { yylval.str = strdup(yytext); return RBR; }
[:space:]   ;

%%