%% ===============================
%% show_factorials.lgt
%% ===============================

:- initialization((
    logtalk_load_context(directory, Directory),
    atom_concat(Directory, lib, LibPath),
	logtalk_load(basic_types(loader)),
	atom_concat(LibPath, '/someio', SomeIO),
	logtalk_load(SomeIO),
	atom_concat(LibPath, '/somemaths', SomeMaths),
	logtalk_load(SomeMaths),
	atom_concat(LibPath, '/factorial', Factorial),
	logtalk_load(Factorial)
)).

:- object(show_factorials,
	imports((someio, factorial))).

	:- public(main/1).
	    main(N) :-
	        write_all_facts(N).

    :- private([write_fact/1, write_all_facts/1]).
        write_fact(N) :-
            ::fact(N, F),
            ::writeln([N, ' != ', F]).

        write_all_facts(0) :-
            write_fact(0),
            !.
        write_all_facts(N) :-
            write_fact(N),
            Nn is N - 1,
            write_all_facts(Nn).
:- end_object.
