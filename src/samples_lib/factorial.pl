%% ===============================
%% factorial.pl
%% ===============================

:- module(factorial, [fact/2]).
set_local_search_path(LocalDir) :-
	working_directory(CWD, CWD),
	atomics_to_string([CWD, '/', LocalDir], ExpandedLocalDir),
	file_search_path(somelib, ExpandedLocalDir).
set_local_search_path('lib').
:- use_module(library(somemaths)).

fact(0, 1) :- 
	!.
fact(1, 1) :- 
	!.
fact(N, F) :-
	nat(N),
	fact_aux(N, 1, F).

fact_aux(1, Acc, Acc) :-
	!.
fact_aux(N, Acc, Res) :-
	nat(N),
	NewAcc is N * Acc,
	NewN is N - 1,
	fact_aux(NewN, NewAcc, Res).
