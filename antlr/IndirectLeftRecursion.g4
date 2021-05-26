/*
    Неявная левая рекурсия не поддерживается, при её обнаружении ANTLR выдаёт соответствующую ошибку,
    указывая правила, участвующие в рекурсии.

    error(119): .../IndirectLeftRecursion.g4::: The following sets of rules are mutually left-recursive [s, u]
*/

grammar IndirectLeftRecursion;

s: e u t;
u: e s t;
e: 'e'*;
t: 't';