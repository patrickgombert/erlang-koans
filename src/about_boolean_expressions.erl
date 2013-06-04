-module(about_boolean_expressions).
-compile(export_all).
-include("../resources/koans.hrl").

or_operator() ->
  ?ReplaceMe =:= true or false.

and_operator() ->
  ?ReplaceMe =:= true and false.

xor_operator() ->
  ?ReplaceMe =:= true xor false.

not_operator() ->
  ?ReplaceMe =:= not true.

being_strict() ->
  StrictlyDefined = (42 =:= 42.0),
  ?ReplaceMe =:= StrictlyDefined.

being_not_so_strict() ->
  NotSoStrictlyDefined = (42 == 42.0),
  ?ReplaceMe =:= NotSoStrictlyDefined.

special_words_evaluate_only_what_is_necessary() ->
  ShortCircuit = (true andalso false),
  ?ReplaceMe =:= ShortCircuit.

this_applies_to_or_as_well() ->
  ShortCircuit = (false orelse true),
  ?ReplaceMe =:= ShortCircuit.

make_de_morgan_proud() ->
  ((not true) orelse (?ReplaceMe)) =:= (not (false andalso true)).

syntax_you_might_not_expect() ->
  ?ReplaceMe =:= (1 =< 2) and (3 /= 4).

