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

:- initialization(main, main).

:- include('lib/someio.lgt').
:- include('lib/somemaths.lgt').
:- include('lib/factorial.lgt').
:- include('show_factorials.lgt').

main :-
    show_factorials::writeln('---------------------------------------'),
    show_factorials::main(21),
    halt.
