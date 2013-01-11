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

