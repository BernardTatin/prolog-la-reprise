%% ===============================
%% simple_sample.pl
%% from https://blog.adrianistan.eu/prolog-dcg-gramaticas-clausula-definida
%% with the help of Google Translate from spanish to english
%% ===============================

%% programX accepts only phrases with the only symbol 'x'
%% exemple:
/*
	?- phrase(programX, [x, x]).
	true.

	?- phrase(programX, [x, y]).
	false.
 */
programX --> [].
programX --> [x], programX.

%% 
program(node(O, E1, E2)) --> expr(E1), oper(O), expr(E2).
expr(node(O, E1, E2)) --> ['('], expr(E1), oper(O), expr(E2), [')'].
expr(node(number, N)) --> [N], {number(N)}.
oper(+) --> [+].
oper(*) --> [*].

execute(node(number, Out), Out).
execute(node(+, E1, E2), Out) :-
    execute(E1, OutE1),
    execute(E2, OutE2),
    Out is OutE1 + OutE2.
execute(node(*, E1, E2), Out) :-
    execute(E1, OutE1),
    execute(E2, OutE2),
    Out is OutE1 * OutE2.

execute(Program) :-
    phrase(program(Tree), Program),
    execute(Tree, Out),
    format(Out).