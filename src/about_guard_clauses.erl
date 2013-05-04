-module(about_guard_clauses).
-export([truthfulness_is_necessary_for_guards/0, there_exists_a_shorthand_for_and/0, there_also_exists_a_shorthand_for_or/0]).
-include("../resources/koans.hrl").

truthfulness_is_necessary_for_guards() ->
  is_this_argument_truthy(?ReplaceMe).

is_this_argument_truthy(X) when X ->
  get_here;
is_this_argument_truthy(_) ->
  not_here.

there_exists_a_shorthand_for_and() ->
  and_shorthand(?ReplaceMe).

and_shorthand(X) when is_integer(X), X < 2 ->
  get_here;
and_shorthand(_) ->
  not_here.

there_also_exists_a_shorthand_for_or() ->
  or_shorthand(?ReplaceMe).

or_shorthand(X) when is_integer(X); is_float(X) ->
  get_here;
or_shorthand(_) ->
  not_here.

