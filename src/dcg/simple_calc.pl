%% ===============================
%% simple_calc.pl
%%
%% extension of the code in 
%%		https://blog.adrianistan.eu/prolog-dcg-gramaticas-clausula-definida
%% with the help of Google Translate from spanish to english
%%
%% ===============================

%% swipl needs it
/*
:- use_module(library(porter_stem)).
*/
/*
 grammar definition

 program --> exp op expr.
 expr --> number
    | ( expr op expr ).
 op --> + | - | * | /.

*/
program(node(O, E1, E2)) --> expr(E1), oper(O), expr(E2).
expr(node(O, E1, E2)) --> ['('], expr(E1), oper(O), expr(E2), [')'].
expr(node(number, N)) --> [N], {number(N)}.
oper(+) --> [+].
oper(*) --> [*].
oper(/) --> [/].
oper(-) --> [-].

/*
    helper definitions
*/
isum(A, B, S) :- S is A + B.
imul(A, B, S) :- S is A * B.
isub(A, B, S) :- S is A - B.
idiv(A, B, S) :- S is A / B.

iexecute(Op, E1, E2, Out) :-
    execute(E1, OutE1),
    execute(E2, OutE2),
    %% see https://www.swi-prolog.org/pldoc/doc_for?object=apply/2
    %% <quote>
    %%      New code should use call/[2..] if the length of List is fixed.
    %% </quote>
    call(Op, OutE1, OutE2, Out).

show_out(N) :-
    integer(N),
    format('~w ~` t ~d~12|~n', ['|>', N]).

show_out(X) :-
    format('~w ~` t ~f~19|~n', ['|>', X]).

/*
    executions
*/    

%% simple number
execute(node(number, Out), Out).
%% expression with an operator
execute(node(+, E1, E2), Out) :- iexecute(isum, E1, E2, Out).
execute(node(-, E1, E2), Out) :- iexecute(isub, E1, E2, Out).
execute(node(*, E1, E2), Out) :- iexecute(imul, E1, E2, Out).
execute(node(/, E1, E2), Out) :- iexecute(idiv, E1, E2, Out).
%% expression is a string
execute(StrProgram) :-
    \+ is_list(StrProgram),
    %% see: https://www.swi-prolog.org/pldoc/doc_for?object=section(%27packages/nlp.html%27)
    %% tokenize_atom supress white spaces, whic make
    %% the grammar definition easier
    tokenize_atom(StrProgram, TokenList),
    execute(TokenList).
%% expression is a list of symbol
execute(Program) :-
    phrase(program(Tree), Program),
    execute(Tree, Out),
    show_out(Out).

/*
    tests
 */
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
