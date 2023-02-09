/*
Author: Luigi Di Paolo
Date: 9/2/2023
Summary:
Generates a 4 x 5 matrix containing the letters from a to t. We can then
query with is_north(P1, P2), is_south(P1, P2) etc to check how any point P1 is
positioned relatively to any point P2. Note how we only defined the north and
west rules for adjacent points and derived everything else with a set of rules.
*/

/* Fatcs */
north(a, f).
north(f, k).
north(k, p).
north(b, g).
north(g, l).
north(l, q).
north(c, h).
north(h, m).
north(m, r).
north(d, i).
north(i, n).
north(n, s).
north(e, j).
north(j, o).
north(o, t).

west(a, b).
west(b, c).
west(c, d).
west(d, e).
west(f, g).
west(g, h).
west(h, i).
west(i, j).
west(k, l).
west(l, m).
west(m, n).
west(n, o).
west(p, q).
west(q, r).
west(r, s).
west(s, t).


/* rules */

/* North */
is_north(P1, P2) :- north(P1, P2).
is_north(P1, P3) :-
    north(P1, P2),
    is_north(P2, P3).

/* South */
south(P1, P2) :- north(P2, P1).

is_south(P1, P2) :- south(P1, P2).
is_south(P1, P3) :-
    south(P1, P2),
    is_south(P2, P3).

/* East */
east(P1, P2) :- west(P2, P1).

is_east(P1, P2) :- east(P1, P2).
is_east(P1, P3) :-
    east(P1, P2),
    is_east(P2, P3).

/* West */
is_west(P1, P2) :- west(P1, P2).
is_west(P1, P3) :-
    west(P1, P2),
    is_west(P2, P3).

/* North-east */
is_north_east(P1, P2) :-
    is_west(P3, P1), is_north(P3, P2).

/* North-east */
is_north_west(P1, P2) :-
    is_south(P3, P1), is_west(P3, P2).

/* South-east */
is_south_east(P1, P2) :-
    is_north_west(P2, P1).

/* South-west */
is_south_west(P1, P2) :-
    is_north_east(P2, P1).
