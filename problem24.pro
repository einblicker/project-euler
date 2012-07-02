%problem24
:- dynamic(count/1).

count(0).

countup :- count(X),
	X1 is X + 1,
	retract(count(X)),
	assert(count(X1)).

range(I, N, []) :- I > N.
range(I, N, [I|L1]) :-
        I =< N, I1 is I+1,
        range(I1, N, L1).

selects([X], [X]).
selects( X,  Ls) :- select(A, X, X1),
	append([A], Ls1, Ls),
	selects(X1, Ls1).

solve(L) :- range(0, 9, X), selects(X, L), countup, count(Z),
 	Z = 1000000 -> true ; fail.

?- solve(X), write(X), nl, halt.
