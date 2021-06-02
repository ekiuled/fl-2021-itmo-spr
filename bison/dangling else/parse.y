/*
    Danglind else неоднозначность порождает shift-reduce конфликт.
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

%token IF ELSE THEN ID

/* 
    Одно из решений конфликта --- задать ассоциативность токенов.

    %right THEN ELSE
*/

/* 
    Другое решение --- задать приоритет токенов, например, дать ELSE больший приоритет.

    %precedence THEN
    %precedence ELSE
*/

%%

stmt:
  expr
| if_stmt
;

if_stmt:
  IF expr THEN stmt
| IF expr THEN stmt ELSE stmt
;

expr:
  ID
;

%%