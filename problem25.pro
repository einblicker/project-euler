%problem25.
fib(A, X) :- fib_iter(1, 1, A, X).

fib_iter(_, B, 1, B).
fib_iter(A, B, C, X) :-
	C > 1, A1 is A + B , C1 is C - 1, fib_iter(A1, A, C1, X).

number_len(Number, Len) :- number_chars(Number, Lis), length(Lis, Len).

solve(Y) :- 
	fib(1, X), plus_loop(1, 100, X, Y).

plus_loop(X, C, L, Y) :-
	L < 1000,
	fib(X, Z), number_len(Z, Len),
	X1 is X + C, plus_loop(X1, C, Len, Y).
plus_loop(X, C, L, Y) :-
	L > 1000,
	fib(X, Z), number_len(Z, Len),
	X1 is X - 1, plus_loop(X1, C, Len, Y).
plus_loop(X, _, 1000, Y) :- minus_loop(X, 1000, Y).

minus_loop(X, 999, Y) :- Y is X + 2.
minus_loop(X, 1000, Y) :-
	fib(X, Z), number_len(Z, Len),
	X1 is X - 1, minus_loop(X1, Len, Y).

?- solve(X), write(X), nl, halt.
