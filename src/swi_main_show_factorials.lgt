%% ===============================
%% swi_main_show_factorials.lgt
%% ===============================
%% compilation:
/*
swipl --goal=main --stand_alone=true \
    -o show_factorials.exe \
    -c $LOGTALKHOME/adapters/swi.pl \
        $LOGTALKHOME/paths/paths.pl \
        $LOGTALKHOME/integration/logtalk_comp_swi.pl \
        $LOGTALKHOME/adapters/swihooks.pl \
        swi_main_show_factorials.lgt

 run:
     ./show_factorials.exe
*/
%% ===============================

:- initialization(main, main).

:- include('lib/someio.lgt').
:- include('lib/somemaths.lgt').
:- include('lib/factorial.lgt').
:- include('show_factorials.lgt').

dohelp(ProgName) :-
    show_factorials::writeln([ProgName, ' [-h|--help]: this text']),
    show_factorials::writeln([ProgName, ' N1 N2 ...: show factorials of N1, N2, ...']),
    halt.

on_args(_, []) :-
    !.
onargs(ProgName, ['-h' | _]) :-
    dohelp(ProgName).
onargs(ProgName, ['--help' | _]) :-
    dohelp(ProgName).

onargs(_, [Atom | Rest]) :-
    atom_chars(Atom, L),
    number_chars(N, L),
    !,
    show_factorials::nat(N),
    show_factorials::write_fact(N),
    onargs(_, Rest).
onargs(_, [N | Rest]) :-
    % \+show_factorials::nat(N),
    show_factorials::writeln([N, ' is not an integer!']),
    onargs(_, Rest).

test_args([ProgName]) :-
    dohelp(ProgName).
test_args([ProgName |ListOfArgs]) :-
    onargs(ProgName, ListOfArgs).

main(Argv) :-
    show_factorials::writeln('---------------------------------------'),
    test_args(Argv),
    halt.
