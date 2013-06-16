-module(about_pattern_matching).
-compile(export_all).

what_looks_like_assignment_might_not_be() ->
  Fruits = apple,
  Fruits = __.

assignment_with_a_tuple() ->
 {X, Y} = {banana, apple},
 (X =:= __) and (Y =:= apple).

branching_on_patterns() ->
  Fruits = {banana, apple},
  case Fruits of
    {banana, Item} ->
      __ =:= Item
  end.

sometimes_we_do_not_need_to_know_everything() ->
  Fruits = {__, banana},
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
  __ =:= Answer.

