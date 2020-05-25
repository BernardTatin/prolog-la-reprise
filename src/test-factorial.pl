%% ===============================
%% test-factorial.pl
%% ===============================


:- use_module(library(someio)).

:- use_module(library(show_factorial)).

:- initialization(main, main).

main :-
	writeln('-------------------------------'),
	write_fact(0),
	write_fact(1),
	write_fact(20),
	writeln('-------------------------------'),
	write_all_facts(20),
	halt.