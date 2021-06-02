build:
	flex lex.l 
	bison -d parse.y
	g++ -std=c++20 lex.yy.c parse.tab.c -o run