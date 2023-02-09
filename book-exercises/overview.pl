/* FACTS */

parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

female(pam).
female(liz).
female(ann).
male(bob).
male(tom).
male(jim).


/* RULES AND INVERSE RELATIONS */

/* The following expression is equal to:
    for all X and Y:
        Y is an offspring of X if
        X is a parent of Y
*/
offspring(Y, X) :-
    parent(X, Y).

/* The following expression is equal to:
    for all X and Y:
        X is a mother of Y if
        Y is an offspring of X and
        X is a female
*/
mother(X, Y) :-
    parent(X, Y),
    female(X).


/* RECURSIVE RULES */

/*
 for  all X and Z,
     X is a predecessor of Z if
     there is a Y s.t
         1) X is a parent of Y AND
         2) Y is a predecessor of Z
 The following expression works for predecessors of any distance, and, it's
 an elegant solution to the problem.
 */
predecessor(X, Z) :-
    parent(X, Z).

predecessor(X, Z) :-
    parent(X, Y),
    predecessor( Y, Z).
