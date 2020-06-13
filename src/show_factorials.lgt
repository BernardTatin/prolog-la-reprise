%% ===============================
%% show_factorials.lgt
%% ===============================

:- object(show_factorials,
	imports((someio, factorial))).

	:- public([main/1, write_fact/1]).
	    main(N) :-
	        write_all_facts(N).

        write_fact(N) :-
            ::fact(N, F),
            ::writeln([N, ' != ', F]).

    :- private([write_all_facts/1]).
        write_all_facts(0) :-
            write_fact(0),
            !.
        write_all_facts(N) :-
            write_fact(N),
            Nn is N - 1,
            write_all_facts(Nn).
:- end_object.
