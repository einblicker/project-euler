%problem60.pro
select4(Ls, X) :- iter(4, Ls).

iter(0, Ls, X) :- .
iter(C, Ls, X) :- select(X, Ls, R),
	C1 is C - 1, iter(C1, X).