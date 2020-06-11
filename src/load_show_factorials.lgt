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
