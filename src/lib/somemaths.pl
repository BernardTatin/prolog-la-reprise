%% ===============================
%% somemaths.pl
%% ===============================

:- module(somemaths, [nat/1]).

nat(N):-
	integer(N),
	N > -1.
