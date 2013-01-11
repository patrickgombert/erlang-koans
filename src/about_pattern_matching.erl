-module(about_pattern_matching).
-compile(export_all).
-include("koans.hrl").

what_looks_like_assignment_might_not_be() ->
  Fruits = apple,
  Fruits = ?ReplaceMe.

assignment_with_a_tuple() ->
 {X, Y} = {banana, apple},
 (X == ?ReplaceMe) and (Y == apple).

sometimes_we_do_not_need_to_know_everything() ->
  Fruits = {apple, banana},
  case Fruits of
    {_, Item} ->
      ?ReplaceMe == Item
  end.

