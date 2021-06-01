/*
    Неявная левая рекурсия не поддерживается, при её обнаружении ANTLR выдаёт соответствующую ошибку,
    указывая правила, участвующие в рекурсии.

    error(119): .../IndirectLeftRecursion.g4::: The following sets of rules are mutually left-recursive [s, u]
*/

grammar IndirectLeftRecursion;

s: u T;
u: s T |;
T: 't';