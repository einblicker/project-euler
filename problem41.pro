%problem41
range(I, N, []) :- I > N.
range(I, N, [I|L1]) :-
	I =< N, I1 is I + 1,
	range(I1, N, L1).

selects([X], [X]).
selects( X,  Ls) :-
	select(A, X, X1),
	append([A], Ls1, Ls),
	selects(X1, Ls1).

list2num(Lis, Num) :- list2num(Lis, 0, Num).
list2num([], Num, Num).
list2num([H|R], Acc, Num) :-
	Num1 is Acc * 10 + H,
	list2num(R, Num1, Num).

prime(X) :- M is X mod 2, M =\= 0, prime(3, X).
prime(N, X) :-
	N < floor(sqrt(X)),
	M is X mod N,
	M =\= 0,
	N1 is N + 2,
	prime(N1, X).
prime(N, X) :-
	N >= floor(sqrt(X)).

pandigital(N, Num) :- range(1, N, L), selects(L, L1), list2num(L1, Num).

pand_and_prime(X) :- between(2,9,N), pandigital(N, X), prime(X), true.
solve :- findall(X, pand_and_prime(X), L), reverse(L, [H|_]), write(H), nl.

?- solve, halt.
