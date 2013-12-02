-module(about_pattern_matching).
-export([what_looks_like_assignment_might_not_be/0,
         assignment_with_a_tuple/0,
         branching_on_patterns/0,
         sometimes_we_do_not_need_to_know_everything/0,
         and_sometimes_we_dont_need_to_match_anything/0,
         we_can_find_patterns_in_arguments/0
        ]).

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

we_can_find_patterns_in_arguments() ->
    match_the_argument(__).

match_the_argument(foo) ->
    wrong;
match_the_argument(bar) ->
    right;
match_the_argument(_) ->
    wronger.

