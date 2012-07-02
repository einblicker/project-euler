%problem9
pytha(A, N, B) :- B is (N * N) / (2 * (A - N)) + N, A < B.
natural(X) :- Y is floor(X), Z is float(Y), X = Z.

solve(1000.0, _, _).
solve(X     , A, B) :- X < 1000.0, pytha(X, 1000.0, B1), natural(B1) -> (A = X, B = B1) ; X1 is X + 1.0, solve(X1, A, B).

solve(A, B, C, P) :- solve(1.0, A, B), C is 1000.0 - A - B, P is A * B * C.
