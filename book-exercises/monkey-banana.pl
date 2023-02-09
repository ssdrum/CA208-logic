# this program won't work because of the ordering of the clauses. If we start
# with state(atdoor, onbox, atdoor, hasnot) the monkey will keep climbing and
# unclimbing the box in an infinite loop.
move(state(middle,onbox,middle,hasnot),
   grasp,
   state(middle,onbox,middle,has)).

move(state(P,onfloor,P,H),
   climb,
   state(P,onbox,P,H)).

move(state(P1,onfloor,P1,H),
   push(P1,P2),
   state(P2,onfloor,P2,H)).

move(state(P1,onfloor,B,H),
   walk(P1,P2),
   state(P2,onfloor,B,H)).

move(state(P,onbox,P,H),
   unclimb,
   state(P,onfloor,P,H)).

canget(state(_,_,_,has)).

canget(State1) :-
   move(State1, Move ,State2),
   canget(State2).
