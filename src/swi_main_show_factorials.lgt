%% ===============================
%% swi_main_show_factorials.lgt
%% compilation:
%% swipl --goal=main --stand_alone=true -o show_factorials.exe \
%%     -c /usr/share/logtalk/adapters/swi.pl \
%%        /usr/share/logtalk/paths/paths.pl \
%%        /usr/share/logtalk/integration/logtalk_comp_swi.pl \
%%        /usr/share/logtalk/adapters/swihooks.pl \
%%        swi_main_show_factorials.lgt
%% run:
%%     ./show_factorials.exe
%% ===============================

%% :- initialization(main, main).

:- include('lib/someio.lgt').
:- include('lib/somemaths.lgt').
:- include('lib/factorial.lgt').
:- include('show_factorials.lgt').

dohelp :-
    show_factorials::writeln('show_factorial [-h|--help]: this text'),
    show_factorials::writeln('show_factorials N1 N2 ...: show factorials of N1, N2, ...'),
    halt.

on_args([]) :-
    !.
onargs(['-h' | _]) :-
    dohelp.
onargs(['--help' | _]) :-
    dohelp.

onargs([Atom | Rest]) :-
    atom_chars(Atom, L),
    number_chars(N, L),
    !,
    show_factorials::nat(N),
    show_factorials::write_fact(N),
    onargs(Rest).
onargs([N | Rest]) :-
    % \+show_factorials::nat(N),
    show_factorials::writeln([N, ' is not an integer!']),
    onargs(Rest).

test_args([Progname]) :-
    dohelp.
test_args([ProgName |ListOfArgs]) :-
    onargs(ListOfArgs).

main(Argv) :-
    show_factorials::writeln('---------------------------------------'),
    test_args(Argv),
    halt.
