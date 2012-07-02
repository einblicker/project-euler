%problem9-use-clp
?- use_module(library('clp/bounds')).

limit(1000.0).

pytha(A, B) :- limit(N), B #= (N * N) / (2 * (A - N)) + N, A < B.
natural(X) :- Y is floor(X), Z is float(Y), X = Z.

solve( X, _, _) :- limit(N), X = N.
solve( X   , A, B) :- limit(N), X < N, pytha(X, B1),
                       natural(B1) -> (A = X, B = B1) ;
                       X1 is X + 1.0, solve(X1, A, B).

solve(A, B, C, P) :- solve(1.0, A, B), C is 1000.0 - A - B, P is A * B * C.

