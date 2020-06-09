%% ===============================
%% somemaths.pl
%% ===============================

:- module(somemaths, [nat/1]).

positive(Number) :-
    Number >= 0.

negative(Number) :-
    Number =< 0.

nat(N):-
	integer(N),
	positive(N).
