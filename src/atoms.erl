-module(atoms).
-export([truth/0, truth_is_not_always_boolean/0, strings_are_not_atoms/0, however_atoms_might_look_like_a_string/0]).
-include("koans.hrl").

truth() ->
   ?ReplaceMe == true.

truth_is_not_always_boolean() ->
  is_atom(true) == ?ReplaceMe.

strings_are_not_atoms() ->
  is_atom("true") /= ?ReplaceMe.

however_atoms_might_look_like_a_string() ->
  is_atom('true') == ?ReplaceMe.

