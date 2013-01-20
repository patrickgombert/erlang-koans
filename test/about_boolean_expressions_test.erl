-module(about_boolean_expressions_test).
-include_lib("eunit/include/eunit.hrl").

or_operator_test() ->
  ?assert(about_boolean_expressions:or_operator()).

and_operator_test() ->
  ?assert(about_boolean_expressions:and_operator()).

