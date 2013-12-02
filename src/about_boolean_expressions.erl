-module(about_boolean_expressions).
-export([or_operator/0,
         and_operator/0,
         xor_operator/0,
         not_operator/0,
         being_strict/0,
         being_not_so_strict/0,
         special_operators_evaluate_only_what_is_necessary/0,
         this_applies_to_or_as_well/0,
         make_de_morgan_proud/0,
         syntax_you_might_not_expect/0
        ]).

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

special_operators_evaluate_only_what_is_necessary() ->
    ShortCircuit = (true andalso false),
    __ =:= ShortCircuit.

this_applies_to_or_as_well() ->
    ShortCircuit = (false orelse true),
    __ =:= ShortCircuit.

make_de_morgan_proud() ->
    ((not true) orelse (__)) =:= (not (false andalso true)).

syntax_you_might_not_expect() ->
    __ =:= (1 =< 2) and (3 /= 4).

