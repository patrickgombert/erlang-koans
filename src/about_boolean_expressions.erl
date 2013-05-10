-module(about_boolean_expressions).
-compile(export_all).

or_operator() ->
  __ =:= true or false.

and_operator() ->
  __ =:= true and false.

xor_operator() ->
  __ =:= true xor false.

not_operator() ->
  __ =:= not true.

being_strict() ->
  StrictlyDefined = (42 =:= 42.0),
  __ =:= StrictlyDefined.

being_not_so_strict() ->
  NotSoStrictlyDefined = (42 == 42.0),
  __ =:= NotSoStrictlyDefined.

special_words_evaluate_only_what_is_necessary() ->
  ShortCircuit = (true andalso false),
  __ =:= ShortCircuit.

this_applies_to_or_as_well() ->
  ShortCircuit = (false orelse true),
  __ =:= ShortCircuit.

make_de_morgan_proud() ->
  ((not true) orelse (__)) =:= (not (false andalso true)).

syntax_you_might_not_expect() ->
  __ =:= (1 =< 2) and (3 /= 4).

