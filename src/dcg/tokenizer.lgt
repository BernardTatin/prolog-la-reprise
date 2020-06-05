%% ===============================
%% tokenizer.lgt
%% ===============================


:- object(tokenizer).
	:- private(on_end_of_word/3).
	:- private(on_space/4).
	:- private(cut_chars/4).
	:- public(tokenize/2).

	/* string_chars(String, ListOfChars) :- 
		{string_chars(String, ListOfChars)}. */
	reverse(InputList, OutputList) :-
		{reverse(InputList, OutputList)}.
	append(L1, L2, L3) :-
		{append(L1, L2, L3)}.

	is_space(Char) :-
		{is_space(Char)}.
	is_punct(Char) :-
		{is_punct(Char)}.
/*
    on_end_of_word(+Word, +Accumulator, -NewAccumulator)
 */

	on_end_of_word([], Accumulator, Accumulator).
	on_end_of_word(Word, Accumulator, NewAccumulator) :-
		reverse(Word, RWord),
		string_chars(Str, RWord),
		append(Accumulator, [Str], NewAccumulator).

	/*
		on_space(+Chars, +Word, +Accumulator, -Result)
	*/

	on_space(Chars, [], Accumulator, Result) :-
		cut_chars(Chars, [], Accumulator, Result).
	on_space(Chars, Word, Accumulator, Result) :-
		on_end_of_word(Word, Accumulator, NewAccumulator),
		cut_chars(Chars, [], NewAccumulator, Result).

	/*
		cut_chars(+Chars, +Word, +Accumulator, -Result)
	*/

	cut_chars([], [], Accumulator, Accumulator).
	cut_chars([], Word, Accumulator, Result) :-
		on_end_of_word(Word, Accumulator, Result).

	cut_chars([W | Rest], Word, Accumulator, Result) :-
		is_space(W),
		on_space(Rest, Word, Accumulator, Result).
	cut_chars([W | Rest], Word, Accumulator, Result) :-
		is_punct(W),
		on_end_of_word(Word, Accumulator, NewAccumulator0),
		on_end_of_word([W], NewAccumulator0, NewAccumulator1),
		cut_chars(Rest, [], NewAccumulator1, Result).
		
	cut_chars([W | Rest], Word, Accumulator, Result) :-
		cut_chars(Rest, [W | Word], Accumulator, Result).

	/*
		tokenize(+String, -ListOfTokens)
	*/

	tokenize(String, ListOfTokens) :-
		% String to a list of atoms
		string_chars(String, Chars),
		cut_chars(Chars, [], [], ListOfTokens),
		% this cut is really useful !
		% we only have one solution (or unknown error)
		!.

:- end_object.