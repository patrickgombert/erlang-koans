-module(about_atoms_test).
-include_lib("eunit/include/eunit.hrl").

truth_test() ->
  ?assert(about_atoms:truth()).

truth_is_not_always_boolean_test() ->
  ?assert(about_atoms:truth_is_not_always_boolean()).

strings_are_not_atoms_test() ->
  ?assert(about_atoms:strings_are_not_atoms()).

however_atoms_might_look_like_a_string_test() ->
  ?assert(about_atoms:however_atoms_might_look_like_a_string()).

