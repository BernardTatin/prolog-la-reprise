%% ===============================
%% simple_calc.pl
%%
%% extension of the code in 
%%		https://blog.adrianistan.eu/prolog-dcg-gramaticas-clausula-definida
%% with the help of Google Translate from spanish to english
%%
%% ===============================

:- use_module(library(apply)).
:- use_module(library(porter_stem)).

%% 
program(node(O, E1, E2)) --> expr(E1), oper(O), expr(E2).
expr(node(O, E1, E2)) --> ['('], expr(E1), oper(O), expr(E2), [')'].
expr(node(number, N)) --> [N], {number(N)}.
oper(+) --> [+].
oper(*) --> [*].
oper(/) --> [/].
oper(-) --> [-].

isum(A, B, S) :- S is A + B.
imul(A, B, S) :- S is A * B.
isub(A, B, S) :- S is A - B.
idiv(A, B, S) :- S is A / B.

iexecute(Op, E1, E2, Out) :-
    execute(E1, OutE1),
    execute(E2, OutE2),
    apply(Op, [OutE1, OutE2, Out]).

show_out(N) :-
    integer(N),
    format('~w ~46t ~d~12|~n', ['>>', N]).

show_out(X) :-
    format('~w ~46t ~g~12|~n', ['>>', X]).

execute(node(number, Out), Out).
execute(node(+, E1, E2), Out) :- iexecute(isum, E1, E2, Out).
execute(node(-, E1, E2), Out) :- iexecute(isub, E1, E2, Out).
execute(node(*, E1, E2), Out) :- iexecute(imul, E1, E2, Out).
execute(node(/, E1, E2), Out) :- iexecute(idiv, E1, E2, Out).

execute(StrProgram) :-
    \+ is_list(StrProgram),
    %% see: https://www.swi-prolog.org/pldoc/doc_for?object=section(%27packages/nlp.html%27)
    %% tokenize_atom supress white spaces, whic make
    %% the grammar definition easier
    tokenize_atom(StrProgram, TokenList),
    execute(TokenList).

execute(Program) :-
    phrase(program(Tree), Program),
    execute(Tree, Out),
    show_out(Out).

tst_execute :-
    execute([4, *, '(', 6, /, 3.2, ')']),
    execute([4, *, '(', 6, /, 3, ')']),
    execute([4, *, '(', 6, -, 3, ')']),
    execute([4, *, '(', 6, +, 3, ')']),
    !.

str_test :-
    execute('4 * (6 / 3.2)'),
    execute('4 * (7 / 3)'),
    execute('4 * (6 / 3)'),
    execute("4 * (6 - 3)"),
    execute("4 * (6 + 3)"),
    !.
