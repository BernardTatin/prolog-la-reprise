%% ===============================
%% simple_calc.pl
%%
%% extension of the code in 
%%		https://blog.adrianistan.eu/prolog-dcg-gramaticas-clausula-definida
%% with the help of Google Translate from spanish to english
%%
%% ===============================

:- use_module(library(apply)).

%% 
program(node(O, E1, E2)) --> expr(E1), oper(O), expr(E2).
expr(node(O, E1, E2)) --> ['('], expr(E1), oper(O), expr(E2), [')'].
expr(node(number, N)) --> [N], {number(N)}.
oper(+) --> [+].
oper(*) --> [*].
oper(/) --> [/].
oper(-) --> [-].

/*
execute(node(+, E1, E2), Out) :-
    execute(E1, OutE1),
    execute(E2, OutE2),
    Out is OutE1 + OutE2.
execute(node(*, E1, E2), Out) :-
    execute(E1, OutE1),
    execute(E2, OutE2),
    Out is OutE1 * OutE2.
execute(node(/, E1, E2), Out) :-
    execute(E1, OutE1),
    execute(E2, OutE2),
    Out is OutE1 / OutE2.
execute(node(-, E1, E2), Out) :-
    execute(E1, OutE1),
    execute(E2, OutE2),
    Out is OutE1 - OutE2.
*/
isum(A, B, S) :- S is A + B.
imul(A, B, S) :- S is A * B.
isub(A, B, S) :- S is A - B.
idiv(A, B, S) :- S is A / B.

iexecute(Op, E1, E2, Out) :-
    execute(E1, OutE1),
    execute(E2, OutE2),
    apply(Op, [OutE1, OutE2, Out]).

execute(node(number, Out), Out).
execute(node(+, E1, E2), Out) :- iexecute(isum, E1, E2, Out).
execute(node(-, E1, E2), Out) :- iexecute(isub, E1, E2, Out).
execute(node(*, E1, E2), Out) :- iexecute(imul, E1, E2, Out).
execute(node(/, E1, E2), Out) :- iexecute(idiv, E1, E2, Out).

execute(Program) :-
    phrase(program(Tree), Program),
    execute(Tree, Out),
    write('> '), format(Out), nl.

tst_execute :-
    execute([4, *, '(', 6, /, 3, ')']),
    execute([4, *, '(', 6, -, 3, ')']),
    execute([4, *, '(', 6, +, 3, ')']).