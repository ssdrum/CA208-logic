/* FACTS */
/* name, father, mother */

parents(david, george, noreen).
parents(jennifer, george, noreen).
parents(georgejr, george, noreen).
parents(scott, george, noreen).
parents(joanne, george, noreen).
parents(jessica, david, edel).
parents(clara, david, edel).
parents(michael, david, edel).
parents(laura, georgejr, susan).
parents(anna, scott, siobhan).


/* Relationships */

father(X, Y) :- parents(Y, X, _).
male(X) :- father(X, _).

mother(X, Y) :- parents(Y, _, X).
female(X) :- mother(X, _).

grandfather(X, Y) :- father(X, Z), father(Z, Y).
grandfather(X, Y) :- father(X, Z), mother(Z, Y).

grandmother(X, Y) :- mother(X, Z), mother(Z, Y).
grandmother(X, Y) :- mother(X, Z), father(Z, Y).

brother(X, Y) :- male(X), father(Z, X), father(Z, Y).

sister(X, Y) :- female(X), father(Z, X), father(Z, Y).

uncle(X, Y) :- brother(X, Z), parents(Y, Z, _). 
uncle(X, Y) :- brother(X, Z), parents(Y, _, Z). 

antie(X, Y) :- sister(X, Z), parents(Y, Z, _).
antie(X, Y) :- sister(X, Z), parents(Y, _, Z).

cousin(A, B) :- parents(A, C, _), brother(C, D), father(D, B).
cousin(A, B) :- parents(A, C, _), brother(C, D), mother(D, B).
cousin(A, B) :- parents(A, _, C), sister(C, D), father(D, B).
cousin(A, B) :- parents(A, _, C), sister(C, D), mother(D, B).
