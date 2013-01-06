-module(pattern_matching).
-export([what_looks_like_assignment_might_not_be/0, assignment_with_a_tuple/0, sometimes_we_do_not_need_to_know_everything/0]).
-include("koans.hrl").

what_looks_like_assignment_might_not_be() ->
  Fruits = apple,
  Fruits = ?ReplaceMe.

assignment_with_a_tuple() ->
 {X, Y} = {apple, banana},
 (X == ?ReplaceMe) and (Y == ?ReplaceMe).

sometimes_we_do_not_need_to_know_everything() ->
  Fruits = {apple, banana},
  case Fruits of
    {_, Item} ->
      ?ReplaceMe == Item
  end.

