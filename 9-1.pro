:- use_module(library(clpfd)).

super([T, E, S, J, U, P, R]) :-
    Vars = [T, E, S, J, U, P, R],
    Vars ins 0..9,
    T #\= 0, J #\= 0, S #\= 0,
    all_different(Vars),
    T*1000 + E*100 + S*10 + T + 
    J*1000 + E*100 + S*10 + T 
    #= 
    S*10000 + U*1000 + P*100 + E*10 + R,
    labeling([], Vars).

miasto([D, O, M, I, A, S, T]) :-
    Vars = [D, O, M, I, A, S, T],
    Vars ins 0..9,
    D #\= 0, M #\= 0,
    (D*100 + O*10 + M) * 
    (D*100 + O*10 + M)
    #= 
    M*100000 + I*10000 + A*1000 + S*100 + T*10 + O,
    labeling([], Vars).

xy([X, Y]) :-
    Vars = [X, Y],
    Vars ins 0..9,
    X #\= 0, Y #\= 0,
    all_different(Vars),
    X + 
    Y*1000 + Y*100 + Y*10 + Y +
    Y*1000 + Y*100 + Y*10 + Y +
    Y*1000 + Y*100 + Y*10 + Y +
    Y*1000 + Y*100 + Y*10 + Y
    #= 
    X*10000 + Y*1000 + Y*100 + Y*10 + Y,
    labeling([], Vars).


am([A, C, D, L, G, M, T, W]) :-
    Vars = [A, C, D, L, G, M, T, W],
    Vars ins 0..9,
    A #\= 0,
    C #\= 0,
    M #\= 0,
    D #\= 0,
    G #\= 0,
    all_different(Vars),
    (10 * A + M) - (10 * C + W) #= (10 * C + A),
    (M) + (10 * D + T) #= (10 * D + L),
    (10 * A + M) // (G) #= (10 * M + D),
    (10 * A + M) * (M) #= (10 * A + M),
    (10 * C + W) - (10 * D + T) #= (G),
    (10 * C + A) - (10 * D + L) #= (10 * M + D),
    labeling([], Vars).

diag([A, B, C, D, E, F, G, H, I, J, K, L]) :-
    Vars = [A, B, C, D, E, F, G, H, I, J, K, L],
    Vars ins 1..12,
    A + B + D + E #= 26,
    C + D + F + G #= 26,
    E + F + H + I #= 26,
    G + H + J + K #= 26,
    I + J + L + A #= 26,
    K + L + B + C #= 26,
    A + C + E + G + I + K #= 26,
    A #= 1,
    B #< L,
    labeling([], Vars).
