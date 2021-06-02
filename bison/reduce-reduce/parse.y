/*
    Неоднозначность грамматики может породить reduce-reduce конфликт. 
    Bison в таком случае выбирает первое подходящее правило, однако следует не полагаться на это, а изменить грамматику.
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

%token WORD REDIRECT

%%

sequence:
  %empty
| sequence words
| sequence redirects
;

words:
  %empty
| words word
;

redirects:
  %empty
| redirects redirect
;


word: WORD;

redirect: REDIRECT;

%%