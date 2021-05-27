/*
    Многострочные комментарии с контролем правильной вложенности скобок можно реализовать с использованием lexer modes.
    Также комментарии можно прятать в отдельный канал.
*/

lexer grammar NestedCommentsLexer;

channels { COMMENTS_CHANNEL }

ID: [a-z]+;
SEP: ';';
WS: [ \t\r\n] -> skip;
LBR: '/*' -> pushMode(COMMENT), channel(COMMENTS_CHANNEL);

mode COMMENT;
C_LBR: '/*' -> pushMode(COMMENT), channel(COMMENTS_CHANNEL);
C_RBR: '*/' -> popMode, channel(COMMENTS_CHANNEL);
OTHER: .+? -> channel(COMMENTS_CHANNEL);
