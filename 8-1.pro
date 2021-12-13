split2(FileIn, FileOut1, FileOut2) :-
    open(FileIn, read, FIn),
    open(FileOut1, write, FOut1),
    open(FileOut2, write, FOut2),

    (copyChar(FIn, FOut1, FOut2);

    close(FIn);
    close(FOut1);
    close(FOut2)).

copyChar(FIn, FOut, FNext) :-
    \+ at_end_of_stream(FIn), !,
    get_char(FIn, C),
    put_char(FOut, C),
    copyChar(FIn, FNext, FOut).


join2(FileIn1, FileIn2, FileOut) :-
    open(FileIn1, read, FIn1),
    open(FileIn2, read, FIn2),
    open(FileOut, write, FOut),

    (copyChar2(FIn1, FIn2, FOut);

    close(FIn1);
    close(FIn2);
    close(FOut)).

copyChar2(FIn, FNext, FOut) :-
    \+ at_end_of_stream(FIn), !,
    get_char(FIn, C),
    put_char(FOut, C),
    copyChar2(FNext, FIn, FOut).
