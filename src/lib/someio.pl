%% ===============================
%% someio.pl
%% ===============================

:- module(someio, [writeln/1]).

%% the name Variable is not a good thing!
%% and no swipl messages!
writeln(SimpleVariable) :-
	\+ is_list(SimpleVariable),
	writeln([SimpleVariable]).
	

writeln([]) :- 
	nl, true.

writeln([Message | More]) :-
	write(Message),
	writeln(More).

