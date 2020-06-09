%% ===============================
%% someio.pl
%% ===============================

:- module(someio, [writeln/1]).

%% the name Variable is not a good thing!
%% and no swipl messages!
writeln(SimpleVariable) :-
	\+ is_list(SimpleVariable),
    write(SimpleVariable),
    nl .

writeln([]) :- 
	nl .

writeln([Message | More]) :-
	write(Message),
	writeln(More).

