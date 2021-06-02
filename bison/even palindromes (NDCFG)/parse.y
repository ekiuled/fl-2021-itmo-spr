/* 
    Bison поддерживает недетерминированные контекстно-свободные языки.
    Данная грамматика порождает shift-reduce конфликты, контпримеры к которым можно найти с опцией -Wcounterexamples.
    Но GLR-парсер, включаемый %glr-parser, распознаёт такую грамматику.
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

%token A B
%glr-parser

%%

s: | A s A | B s B;

%%