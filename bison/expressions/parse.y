/*
    В Bison можно задавать приоритет и ассоциативность операторов (токенов). 
    Ассиотивность операторов определяется ключевыми словами: 
        - %left
        - %right
        - %nonassoc
        - %precedence --- задаёт только приоритет, не разрешая конфликты, связанные с ассоциативностью.
    Приоритет определяется порядком определения операторов: чем раньше определён, тем ниже приоритет.
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

%token INT PLUS MULT POW LBR RBR

%left PLUS MULT
%right POW

%%

expr:
  INT
| expr POW expr
| expr MULT expr
| expr PLUS expr
| LBR expr RBR
;

%%