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
    
line(S1, X, Y, X, Y, Z, S2) :-
    point(S1, X, Y, Z, S2).
line(S1, X1, Y, X2, Y, Z, S2) :-
    point(S1, X2, Y, Z, S3),
	succ(X3, X2),
    line(S3, X1, Y, X3, Y, Z, S2).
line(S1, X, Y1, X, Y2, Z, S2) :-
    point(S1, X, Y2, Z, S3),
    succ(Y3, Y2),
    line(S3, X, Y1, X, Y3, Z, S2).

rect(S1, X1, Y, X2, Y, Z, S2) :-
    line(S1, X1, Y, X2, Y, Z, S2).    
rect(S1, X1, Y1, X2, Y2, Z, S2) :-
    line(S1, X1, Y2, X2, Y2, Z, S3),
    succ(Y3, Y2),
    rect(S3, X1, Y1, X2, Y3, Z, S2).