-module(about_higher_order_functions).
-compile(export_all).
-include("../resources/koans.hrl").

map_a_list_to_a_new_list() ->
  ?ReplaceMe == lists:map(fun(Item) -> Item * 2 end, [1, 2, 3]).

fold_an_answer_from_the_left() ->
  ?ReplaceMe == lists:foldl(fun(Item, Accumulation) -> string:join([Accumulation, Item], " ") end, "hello", ["erlang", "koans"]).

or_from_the_right() ->
  ?ReplaceMe == lists:foldr(fun(Item, Accumulation) -> string:join([Accumulation, Item], " ") end, "hello", ["erlang", "koans"]).

