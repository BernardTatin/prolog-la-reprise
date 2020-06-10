%% ===============================
%% someio.pl
%% ===============================

:- category(someio).

    :- public(writeln/1).
    writeln(SimpleVariable) :-
        \+ is_list(SimpleVariable),
        write(SimpleVariable),
        nl .

    writeln([]) :-
        nl .

    writeln([Message | More]) :-
        write(Message),
        writeln(More).

:- end_category.
