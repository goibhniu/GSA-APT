all: gsa-apt

gsa-apt: y.tab.o lex.yy.o
	gcc lex.yy.o y.tab.o -ly -lfl -o gsa-apt

lex.yy.o: lex.yy.c
	gcc -c lex.yy.c -o lex.yy.o
	
ytab.o: y.tab.c
	gcc -c y.tab.c -o y.tab.o

y.tab.c:
	byacc -d -l gsa-apt.y

lex.yy.c: gsa-apt.l
	flex gsa-apt.l

clean:
	rm -rf *o gsa-apt lex.yy.x y.tab.c y.tab.h
