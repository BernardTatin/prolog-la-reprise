%% ===============================
%% externals.lgt
%% ===============================

:- category(externals).

	:- info([
		version is 1:0:0,
		author is 'Bernard T.',
		date is 2020-6-5,
		comment is 'Definitions for native predicates'
	]).

    :- public(reverse/2).
	reverse(InputList, OutputList) :-
		{reverse(InputList, OutputList)}.
	:- public(append/3).
	append(L1, L2, L3) :-
		{append(L1, L2, L3)}.

	:- public(is_space/1).
	:- if(current_logtalk_flag(prolog_dialect, gnu)).
		is_space(' ').
		is_space('\t').
		is_space('\n').
	:- else.
		is_space(Char) :-
			{is_space(Char)}.
	:- endif.
	:- public(is_punct/1).
	:- if(current_logtalk_flag(prolog_dialect, gnu)).
		is_punct('.').
		is_punct(',').
		is_punct(';').
		is_punct(':').
		is_punct('!').
		is_punct('+').
		is_punct('-').
		is_punct('*').
		is_punct('/').
		is_punct('=').
	:- else.
		is_punct(Char) :-
			{is_punct(Char)}.
	:- endif.

	:- public(string_2_chars/2).
	:- if(current_logtalk_flag(prolog_dialect, gnu)).
		string_2_chars(Atom, Chars) :-
			atom_chars(Atom, Chars).
	:- else.
		string_2_chars(Atom, Chars) :-
			string_chars(Atom, Chars).
	:- endif.
:- end_category.
