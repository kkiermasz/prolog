fill([], _, 0).
fill([X|Xs], X, N) :- succ(N0, N), fill(Xs, X, N0).

canvas(W, H, S) :- fill(S, R, H), fill(R, ' ', W).