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

% 2.4
% average ( List , Average )
% it uses average ( List , Count , Sum , Average )
average([H|T], A) :- average([H|T], 0, 0, A). % in this way solve the problem of 0/0 in an empty list
average([], C, S, A) :- A is S/C.
average([X|Xs], C, S, A) :- 
	C2 is C + 1,
	S2 is S + X,
	average(Xs, C2, S2, A).

% ex 2.5 
max([X | Xs], Max) :- max([X | Xs], Max, X).
max([], Temp, Temp).
max([X | Xs], Max, Temp) :- Temp > X, max(Xs, Max, Temp).
max([X | Xs], Max, Temp) :- X >= Temp, max(Xs, Max, X).

% 2.6
% max_min( List , Max , Min )
% Max is the biggest element in List
% Min is the smallest element in List
% Suppose the list has at least one element
% Version with temps, below version without
max_min([H|T], Max, Min) :- max_min([H|T], Max, Min, H, H).
max_min([], TMax, TMin, TMax, TMin).
max_min([H|T], Max, Min, TMax, TMin) :- TMax > H, TMin =< H, max_min(T, Max, Min, TMax, TMin).
max_min([H|T], Max, Min, TMax, TMin) :- TMax > H, H < TMin, max_min(T, Max, Min, TMax, H).
max_min([H|T], Max, Min, TMax, TMin) :- H >= TMax, max_min(T, Max, Min, H, TMin).
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

% ----------- Part 4 -----------

ex 4.1
seq(0 ,[]) .
seq(N ,[0| T ]) :- N2 is N - 1, seq ( N2 ,T ).

% ex 4.2
seqR(0, [0]).
seqR(N, [N | T]) :- X is N - 1, seqR(X, T).

% ex 4.3

seqR2(0, [0]).
seqR2(N, L) :- N >=0, last2(P, N, L), N2 is N-1, seqR2(N2, P).

last2([], N, [N]).
last2([X | Xs], N, [X | Ys]) :- last2(Xs, N, Ys).

% ----------- Part 5 -----------

% Assume l is a List[Int]

% l.last

last([X], X).
last([X | Xs], N) :- last(Xs, N).

% l map (_ + 1)

map([X], [Y]) :- Y is X + 1.
map([X | Xs], [Y | Ys]) :- map(Xs, Ys), Y is X + 1.

% l filter (_ > 0)

filter([X], [X]) :- X > 0.
filter([X], []) :- X =< 0.
filter([X | Xs], [X | Ys]) :- filter(Xs, Ys), X > 0.
filter([X | Xs], Ys) :- filter(Xs, Ys), X =< 0.

% l.zip(l2)

zip([X], [Y], [[X, Y]]).
zip([X | Xs], [Y | Ys], [[X, Y] | Zs]) :- zip(Xs, Ys, Zs).
