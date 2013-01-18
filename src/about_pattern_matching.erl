-module(about_pattern_matching).
-compile(export_all).
-include("../resources/koans.hrl").

what_looks_like_assignment_might_not_be() ->
  Fruits = apple,
  Fruits = ?ReplaceMe.

assignment_with_a_tuple() ->
 {X, Y} = {banana, apple},
 (X == ?ReplaceMe) and (Y == apple).

branching_on_patterns() ->
  Fruits = {banana, apple},
  case Fruits of
    {banana, Item} ->
      ?ReplaceMe == Item
  end.

sometimes_we_do_not_need_to_know_everything() ->
  Fruits = {?ReplaceMe, banana},
  case Fruits of
    {apple, _} ->
      get_here
  end.

and_sometimes_we_dont_need_to_match_anything() ->
  case {banana, apple} of
    {pear, _} ->
      Answer = pear;
    _ ->
      Answer = anything
  end,
  ?ReplaceMe == Answer.

