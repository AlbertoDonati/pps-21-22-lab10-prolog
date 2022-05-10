% ----------- Part 1 -----------
search(X, [X | _]).
search(X, [_ | Xs]) :- search(X, Xs).


search2(X, [X, X | _]).
search2(X, [_ | Xs]) :- search2(X, Xs). 

% Tests
% search2(a,[b,c,a,a,d,e,a,a,g,h]). --> Yes Yes No
% search2(a,[b,c,a,a,a,d,e]). --> Yes Yes No
% search2(X,[b,c,a,a,d,d,e]). --> a d 
% search2(a,L). --> a a

% ex 1.3
search_two(X, [X, _, X | _]).
search_two(X, [_ | Xs]) :- search_two(X, Xs).

% ex 1.4
search_anytwo(X, [X | Xs]) :- search(X, Xs).
search_anytwo(X, [_ | Xs]) :- search_anytwo(X, Xs).

% ----------- Part 2 -----------

% ex 2.1
size ([] ,0).
size ([_ | Xs], N) :- size(Xs,N2), N is N2 + 1.

% ex 2.2 
size_peano([], zero).
size_peano([_ | Xs], s(N)) :- size_peano(Xs, N).

% ex 2.3
sum([], 0).
sum([X | Xs], R) :- sum(Xs, N), R is N + X.

% ex 2.5 Quasi funzionante
max(List, Max) :- max(List, Max, TempMax).
max([X], X, X). %caso base
max([X | Xs], X , _) :- max(Xs, Max, TempMax), X >= TempMax.
max([X | Xs], TempMax , _) :- max(Xs, Max, TempMax), X < TempMax.

% ex 2.6



% ----------- Part 3 -----------

% ex 3.1 

same([], []).
same([X | Xs], [X | Ys]) :- same(Xs, Ys).

% ex 3.2 

all_bigger([X], [Y]) :- X > Y.
all_bigger([X | Xs], [Y | Ys]) :- all_bigger(Xs, Ys), X > Y.

% ex 3.3

sublist([], _).
sublist([X | Xs], L) :- sublist(Xs, L), search(X, L).








