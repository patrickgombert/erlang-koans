-module(about_atoms).
-compile(export_all).
-include("../resources/koans.hrl").

truth() ->
  ?ReplaceMe =:= true.

truth_is_not_always_boolean() ->
  is_atom(true) =:= ?ReplaceMe.

strings_are_not_atoms() ->
  is_atom("true") /= ?ReplaceMe.

however_atoms_might_look_like_a_string() ->
  is_atom('true') =:= ?ReplaceMe.

