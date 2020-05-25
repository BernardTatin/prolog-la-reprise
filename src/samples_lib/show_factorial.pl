%% ===============================
%% show-factorial.pl
%% ===============================

:- module('show_factorial', [write_fact/1, write_all_facts/1]).

:- use_module(library(someio)).
:- use_module(library(somemaths)).

:- use_module(library(factorial)).


write_fact(N) :-
	fact(N, F),
	writeln([N, ' != ', F]).

write_all_facts(0) :-
	!,
	write_fact(0).
write_all_facts(N) :-
	write_fact(N),
	Nn is N - 1,
	write_all_facts(Nn).
