/*
    GLR парсер при конфликтах он рассматривает все допустимые правила, включается директивой %glr-parser.
    В случае неоднозначности можно задавать приоритет правил через %dprec.
    Также можно задать функцию, объединяющую результаты всех рассмотренных веток через %merge.

    В этом примере есть reduce/reduce конфликт декларации и каста на примере T (x);. Он разрешается в пользу декларации,
    так как у неё задан больший приоритет %dprec 2.
*/

%{
    #include <iostream>
    int yylex();
    int yyparse();
    void yyerror(std::string_view s) {
        std::cerr << s << std::endl;
    }
    int main() {
        return yyparse();
    } 
%}

%union {
    char const* str;
}


%token TYPENAME ID LBR RBR SEP PLUS ASS
%type<str> TYPENAME ID LBR RBR SEP PLUS ASS

%right ASS
%left PLUS


%glr-parser

%%

prog:
  %empty
| prog stmt                         { std::cout << std::endl; }
;

stmt:
  expr SEP  %dprec 1
| decl      %dprec 2
;

expr:
  ID                                { std::cout << $1 << ' '; }
| TYPENAME LBR expr RBR             { std::cout << $1 << " <cast> "; }
| expr PLUS expr                    { std::cout << "+ "; }
| expr ASS expr                     { std::cout << "= "; }
;

decl:
  TYPENAME declarator SEP           { std::cout << $1 << " <declare> "; }
| TYPENAME declarator ASS expr SEP  { std::cout << $1 << " <init-declare> "; }
;

declarator:
  ID                                { std::cout << "\"" << $1 << "\" "; }
| LBR declarator RBR
;
