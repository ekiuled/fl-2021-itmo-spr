parser grammar NestedCommentsParser;
options { tokenVocab = NestedCommentsLexer; }

parse: (ID SEP)+ EOF;