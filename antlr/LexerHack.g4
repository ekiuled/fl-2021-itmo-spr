/*
    Семантический предикат позволяет выбирать правила с помощью условий, написанных на целевом языке.

    Предикаты могут встречаться как в парсере, так и в лексере. Однако в парсере предикат может стоять только на
    первом месте и не может обращаться к токенам правила, так как он проверяется до начала парсинга.
    В лексере же предикат может стоять на любом месте и зависеть от лексемы.

    В данном примере используется lexer hack --- контекст парсера используется лексером.
    Рассмотрим язык, состоящий из объвялений типа (typename <type>), приведений типа ((<type>) <id>), разыменовывания,
    умножения и скобок. Без контекста невозможно определить, что означает выражение (A)*B --- умножение A*B или
    приведение результата разыменовывания B к типу A. Но если лексер использует контест парсера, хранящий все
    объявленные типы, он может правильно определить, что такое A.

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

grammar LexerHack;

@header {
    import java.util.*;
}

@parser::members {
    static Set<String> types = new HashSet<String>();
}

parse locals []: (stat ';')+;
stat: decl | expr;
decl: 'typename' ID             { types.add($ID.text); };
expr: '(' TYPE ')' expr         { System.out.println("typecast"); }
    | expr '*' expr             { System.out.println("multiplication"); }
    | ID
    | dereference
    | '(' expr ')'
    ;
dereference: '*' ID;
TYPE: [a-z]+ { LexerHackParser.types.contains(getText()) }?;
ID: [a-z]+;
WS: [ \t\r\n] -> skip;
