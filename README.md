# Сравнение возможностей инструментов синтаксического анализа

## Инструменты синтаксического анализа
* ANTLR4
* Bison

## Примеры
### ANTLR4
* [Явная левая рекурсия](antlr/DirectLeftRecursion.g4)
* [Неявная левая рекурсия](antlr/IndirectLeftRecursion.g4)
* [Неоднозначная грамматика (dangling else)](antlr/DanglingElse.g4)
* [Недетерминированная контекстно-свободная грамматика](antlr/NDCFG.g4)
* [Арифметические выражения](antlr/Expressions.g4)
* Вложенные комментарии (lexer modes): [лексер](antlr/NestedCommentsLexer.g4), [парсер](antlr/NestedCommentsParser.g4)
* [Семантические предикаты](antlr/SemanticPredicates.g4), [контекстно-зависимая лексика](antlr/LexerHack.g4)

### Bison
* [Неявная левая рекурсия](bison/indirect%20left%20recursion)
* [Неоднозначная грамматика](bison/reduce-reduce), [dangling else](bison/dangling%20else)
* [GLR](bison/GLR)
* [Недетерминированная контекстно-свободная грамматика](bison/even%20palindromes%20(NDCFG))
* [Арифметические выражения](bison/expressions)
* [Вложенные комментарии (flex start conditions)](bison/nested%20comments)
* [Семантические предикаты (контекстно-зависимая лексика)](bison/semantic%20predicates)

## [Презентация](presentation.pdf)