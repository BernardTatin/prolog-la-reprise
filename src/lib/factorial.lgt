%% ===============================
%% factorial.pl
%% ===============================

:- category(factorial,
        extends(somemaths)).

    :- public(fact/2).
        fact(0, 1) :-
            !.
        fact(1, 1) :-
            !.
        fact(N, F) :-
            ::nat(N),
            fact_aux(N, 1, F).

    :- private(fact_aux/3).
        fact_aux(1, Acc, Acc) :-
            !.
        fact_aux(N, Acc, Res) :-
            ::nat(N),
            NewAcc is N * Acc,
            NewN is N - 1,
            fact_aux(NewN, NewAcc, Res).
:- end_category.
