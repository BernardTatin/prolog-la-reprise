%% ===============================
%% somemaths.pl
%% ===============================

:- category(somemaths).

    :- public(positive/1).
        positive(Number) :-
            Number >= 0.

    :- public(nexgative/1).
        negative(Number) :-
            Number =< 0.

    :- public(nat/1).
        nat(N):-
            integer(N),
            positive(N).

:- end_category.
