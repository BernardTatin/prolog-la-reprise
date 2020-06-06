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
	is_space(Char) :-
		{is_space(Char)}.
	:- public(is_punct/1).
	is_punct(Char) :-
		{is_punct(Char)}.

:- end_category.
