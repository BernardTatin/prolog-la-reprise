%% ===============================
%% load.pl
%% ===============================


set_local_search_path(LocalDir) :-
	working_directory(CWD, CWD),
	write('CWD: '), write(CWD), write(' | '),
	atomics_to_string([CWD, LocalDir], ExpandedLocalDir),
	write('ExpandedLocalDir: '), write(ExpandedLocalDir), nl,
	assertz(library_directory(ExpandedLocalDir)).

local_libs :-
	write('Adding lib...'),
	nl,
	set_local_search_path('lib'),
	write('Adding samples_lib...'),
	nl,
	set_local_search_path('samples_lib'),
	write('OK').