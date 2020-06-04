%% ===============================
%% tokenizer.pl
%% ===============================

:- module(tokenizer, [tokenize/2]).

/*
    tokenize(+String, -ListOfTokens)
 */

on_end_of_word(Chars, [], Accumulator, Result) :-
    cut_chars(Chars, [], Accumulator, Result).
on_end_of_word(Chars, Word, Accumulator, Result) :-
    reverse(Word, RWord),
    string_chars(Str, RWord),
    append(Accumulator, [Str], NewAccumulator),
    cut_chars(Chars, [], NewAccumulator, Result).

cut_chars([], [], Accumulator, Accumulator) :- !.
cut_chars([], Word, Accumulator, Result) :-
    reverse(Word, RWord),
    string_chars(Str, RWord),
    append(Accumulator, [Str], Result),
    !.

cut_chars([W | Rest], Word, Accumulator, Result) :-
    is_space(W),
    on_end_of_word(Rest, Word, Accumulator, Result).
cut_chars([W | Rest], Word, Accumulator, Result) :-
    cut_chars(Rest, [W | Word], Accumulator, Result).

tokenize(String, ListOfTokens) :-
    % String to a list of atoms
    string_chars(String, Chars),
    cut_chars(Chars, [], [], ListOfTokens),
    !.