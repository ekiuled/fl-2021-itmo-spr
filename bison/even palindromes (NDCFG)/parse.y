/* 
    Bison не поддерживает недетерминированные контекстно-свободные языки.
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

%%

s: | A s A | B s B;

%%