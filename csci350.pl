% Question. 1 - sum-up-numbers-simple

list-chars([], 0).
list-chars([X|Xs], N):-
    (   number(X)
    ->  list-chars(Xs, N)
    ;   list-chars(Xs, N0),
        succ(N0, N)
    ).
    
sum-up-numbers-simple([], 0).  % empty list

sum-up-numbers-simple([L | LRest], Result) :- 
	number(L),
	sum-up-numbers-simple(LRest, LRestResult),
	Result is L + LRestResult.

sum-up-numbers-simple([L | LRest], LRestResult) :-  % element is not a number case
	\+(number(L)),
	sum-up-numbers-simple(LRest, LRestResult).
	
sum-up-numbers-simple([L | LRest], 0) :-  % the list is all non-number elements case
        length([L | LRest], N),
	list-chars([L | LRest], M),
	M == N.

% Question 2 
my-flatten([],[]).

my-flatten(X,[X]) :-
        \+(is_list(X)).
	
my-flatten([X|Xs],Zs) :-
        my-flatten(X,Y),
        my-flatten(Xs,Ys),
        append(Y,Ys,Zs).
