build:
	flex lex.l 
	bison -d -Wcounterexamples parse.y
	g++ -std=c++20 lex.yy.c parse.tab.c -o run