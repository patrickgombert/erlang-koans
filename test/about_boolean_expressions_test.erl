-module(about_boolean_expressions_test).
-include_lib("eunit/include/eunit.hrl").

or_operator_test() ->
    ?assert(about_boolean_expressions:or_operator()).

and_operator_test() ->
    ?assert(about_boolean_expressions:and_operator()).

xor_operator_test() ->
    ?assert(about_boolean_expressions:xor_operator()).

not_operator_test() ->
    ?assert(about_boolean_expressions:not_operator()).

being_strict_test() ->
    ?assert(about_boolean_expressions:being_strict()).

being_not_so_strict_test() ->
    ?assert(about_boolean_expressions:being_not_so_strict()).

special_operators_evaluate_only_what_is_necessary_test() ->
    ?assert(about_boolean_expressions:special_operators_evaluate_only_what_is_necessary()).

this_applies_to_or_as_well_test() ->
    ?assert(about_boolean_expressions:this_applies_to_or_as_well()).

make_de_morgan_proud_test() ->
    ?assert(about_boolean_expressions:make_de_morgan_proud()).

syntax_you_might_not_expect_test() ->
    ?assert(about_boolean_expressions:syntax_you_might_not_expect()).

