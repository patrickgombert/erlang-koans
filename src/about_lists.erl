-module(about_lists).
-compile(export_all).
-include("koans.hrl").

lists_are_not_homogenious() ->
  NotJustFruits = [apple, banana, ?ReplaceMe, mango],
  Element = lists:nth(3, NotJustFruits),
  (Element < 2) and (Element > 0).

we_can_add() ->
  [apple, banana] ++ ?ReplaceMe.

we_can_also_take_away() ->
  [apple, banana] -- ?ReplaceMe.

lists_have_heads() ->
  [Head | Tail] = [apple, banana, mango],
  Head == ?ReplaceMe.

lists_also_have_tails() ->
  [Head | Tail] = [apple, banana, mango],
  Tail == ?ReplaceMe.

lists_of_tuples_can_be_found_by_key() ->
  Meals = [{breakfast, eggs}, {lunch, pasta}, {dinner, burrito}],
  {lunch, _} = lists:keyfind(?ReplaceMe, 2, Meals).

