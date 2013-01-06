-module(atoms_test).
-include_lib("eunit/include/eunit.hrl").

truth_test() ->
  ?assert(atoms:truth()).

truth_is_not_always_boolean_test() ->
  ?assert(atoms:truth_is_not_always_boolean()).

strings_are_not_atoms_test() ->
  ?assert(atoms:string_not_an_atom()).

differnent_atom_syntax_test() ->
  ?assert(atoms:however_atom_might_look_like_a_string()).

