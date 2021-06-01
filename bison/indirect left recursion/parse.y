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

%token ID PLUS LBR RBR

%%

expr:
  term
| term PLUS term
;

term:
  ID
| LBR expr RBR
;

%%