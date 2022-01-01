fill([], _, 0).
fill([X|Xs], X, N) :- succ(N0, N), fill(Xs, X, N0).

canvas(W, H, S) :- fill(S, R, H), fill(R, ' ', W).

point([L|Cs], 0, Y, Z, [R|Cs]) :- point_col(L, Y, Z, R).
point([C|Ls], X, Y, Z, [C|Rs]) :- 
    succ(X1, X),
    point(Ls, X1, Y, Z, Rs).

point_col([_|Cs], 0, Z, [Z|Cs]).
point_col([C|Ls], Y, Z, [C|Rs]) :-
    succ(Y1, Y),
    point_col(Ls, Y1, Z, Rs).

