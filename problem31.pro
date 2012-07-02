%problem31
solve(LR) :- getList(X), loop(0, X, [], LR).

getList(X) :- X = [1, 2, 5, 10, 20, 50, 100].

loop(200, _, L, LR) :- LR = L.
loop(Total, A, L, _) :-
	Total < 200,
	member(X, A),
	Total1 is X + Total,
	append(L, [X], L1),
	write(L1), format('~a~n', [Total]), nl,
	loop(Total1, A, L1, _).
