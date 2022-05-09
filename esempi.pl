% codifica di peano per i numeri naturali 
% s(zero) s(s(zero)), ... zero/0 s/1
% FP: sum(5,4) --> 9 ???
% LP: sum(5,4,9) scrivo un predicato ternario che mette in relazione i primi due argomenti con il terzo
% e.g. sum( s(zero), s(s(zero)), s(s(s(zero))) ) 
sum(zero, N, N). %caso base
sum(s(N), M, s(R)) :- sum(N, M, R). %caso ricorsivo


% f: I1, ..., In -> Boolean diventa p(I1, ..., In) che risponde si o no
% Esempio realizzare un predicato binario greater che dice se il primo numero è maggiore del secondo
% greater(s(s(zero), s(zero)) Yes
% greater(s(s(zero), s(s(zero))) No

greater(s(_), zero). %caso base
greater(s(N), s(M)) :- greater(N, M).

% Come modello una funzione che ha più output?
% f: I1, ..., In -> O1, O2 diventa p(I1, ..., In, O1, O2)
% e.g funzione prevnext(5) --> 4,6
% prevnext(5,4,6)
% prevnext( s(zero), zero, s(s(zero)) )

%query di test: prevnext( s(s(zero)), P, N)
prevnext(s(N), N, s(s(N))).

% Se voglio avere in output un'iterazione di valori?
% f: I1, I2, ..., In -> Iterable[O]
% e.g. interval(zero, s(s(zero)), N). --> in fp aka range(0, 2)

interval(N, _, N).     %questo greater serve per non andare avanti all'infinito
interval(N1, N2, E) :- greater(N2, N1), interval(s(N1), N2, E).


% LISTE
% predicato element(E, L) che mi dice se E è un elemento di L
% N.B. in fp ci verrebbe da mettere come caso base se la lista è vuota rispondo no ma qui scriviamo predicati
% quindi scrivo solo i casi positivi
% query di prova: element(10, cons(30, cons(10, nil))) oppure element(10, cons(10, cons(20, nil)))

% caso base positivo --> è vero che, in una lista che comincia con E, E è un suo elemento
element(E, cons(E, _)). 
element(E, cons(_, L)) :- element(E, L).

% Sintassi ad hoc per le liste in prolog

% Lista con n elementi [E1, E2, ..., En]
% Lista vuota []
% [H | T] lista con una Head e una Tail
% [_ | T] lista in cui non mi interessa delle testa ma voglio la coda
% [E1, _ | _] lista che unifica con una lista che ha almeno 2 elementi e di cui voglio sapere il primo















