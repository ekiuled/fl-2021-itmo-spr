build:
	flex lex.l 
	bison -d -Wcounterexamples parse.y
	g++ lex.yy.c parse.tab.c -o run