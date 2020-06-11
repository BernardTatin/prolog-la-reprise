%% ===============================
%% externals.lgt
%% note:
%%		all dialiects available for prolog_dialect are:
%%			 b  cx  eclipse  gnu  ji  lean  qp  quintus  sicstus  swi  xsb  yap
%% ===============================

:- category(externals).

	:- info([
		version is 1:0:0,
		author is 'Bernard T.',
		date is 2020-6-5,
		comment is 'Definitions for native predicates'
	]).

    :- public(member/2).
        :- if(current_logtalk_flag(prolog_dialect, yap)).
            member(Element, List) :-
                lists:member(Element, List).
        :- else.
            member(Element, List) :-
                {member(Element, List)}.
        :- endif.
    :- public(reverse/2).
        :- if(current_logtalk_flag(prolog_dialect, yap)).
            reverse(InputList, OutputList) :-
                lists:reverse(InputList, OutputList).
        :- else.
            reverse(InputList, OutputList) :-
                {reverse(InputList, OutputList)}.
        :- endif.
	:- public(append/3).
        :- if(current_logtalk_flag(prolog_dialect, yap)).
            append(L1, L2, L3) :-
                lists:append(L1, L2, L3).
        :- else.
            append(L1, L2, L3) :-
                {append(L1, L2, L3)}.
        :- endif.

	:- public(is_space/1).
        :- if(current_logtalk_flag(prolog_dialect, swi)).
            is_space(Char) :-
                {is_space(Char)}.
        :- else.
            is_space(' ').
            is_space('\t').
            is_space('\n').
        :- endif.
	:- public(is_punct/1).
        :- if(current_logtalk_flag(prolog_dialect, swi)).
            is_punct(Char) :-
                {is_punct(Char)}.
        :- else.
            is_punct(C) :-
                ::member(C, ['.', ',', ';', ':', '!', '+', '-', '*', '/', '=']).
        :- endif.

	:- public(string_2_chars/2).
        :- if(current_logtalk_flag(prolog_dialect, swi)).
            string_2_chars(Atom, Chars) :-
                string_chars(Atom, Chars).
        :- else.
            string_2_chars(Atom, Chars) :-
                atom_chars(Atom, Chars).
        :- endif.
:- end_category.
