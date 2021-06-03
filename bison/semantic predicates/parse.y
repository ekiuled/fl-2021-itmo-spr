/*
    Семантические предикаты позволяют отвергать правила через произвольные пользовательские условия.

    Рассмотрим язык, состоящий из объявлений типа (typename <type>), приведений типа ((<type>) <id>), разыменовывания,
    умножения и скобок. Без контекста невозможно определить, что означает выражение (A)*B --- умножение A*B или
    приведение результата разыменовывания B к типу A. Но если парсер хранит все объявленные типы, он может правильно 
    определить, что такое A.

    Например, при разборе следующего ввода:

    (a) *b;
    typename a;
    (a) *b;
    (b) *b;

    будет выведено:

    multiplication
    typecast
    multiplication
*/

%{
    #include <iostream>
    #include <unordered_set>
    int yylex();
    int yyparse();
    void yyerror(std::string_view s) {
        std::cerr << s << std::endl;
    }
    int main() {
        return yyparse();
    } 

    std::unordered_set<std::string> types;
%}

%union {
    char const* str;
}

%token TYPENAME ID LBR RBR SEP MUL
%type<str> TYPENAME ID LBR RBR SEP MUL
%left MUL

%glr-parser

%%

prog:
  %empty
| prog stmt
;

stmt:
  expr SEP
| decl SEP
;

decl: TYPENAME ID       { types.insert($2); }
;

expr:
  LBR type RBR expr     { std::cout << "typecast" << std::endl; }
| expr MUL expr         { std::cout << "multiplication" << std::endl; }
| id
| dereference
| LBR expr RBR
;

dereference: MUL id;

id: ID                  %?{ !types.contains($1) }
;

type: ID                %?{ types.contains($1) }
;