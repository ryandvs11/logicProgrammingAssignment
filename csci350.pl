list-chars([], 0).
list-chars([X|Xs], N):-
    (   number(X)
    ->  list-chars(Xs, N)
    ;   list-chars(Xs, N0),
        succ(N0, N)
    ).
