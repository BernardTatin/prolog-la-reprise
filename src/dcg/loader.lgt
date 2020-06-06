%% ===============================
%% loader.lgt
%% ===============================

:- initialization((
	logtalk_load(basic_types(loader)),
	logtalk_load(externals),
	logtalk_load(tokenizer)
)). 