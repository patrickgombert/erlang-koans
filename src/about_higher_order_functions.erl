-module(about_higher_order_functions).
-export([map_a_list_to_a_new_list/0, fold_an_answer_from_the_left/0, or_from_the_right/0, filter_the_appropriate_values/0, merging_two_dicts/0, function_passed_to_a_function/0]).
-include("../resources/koans.hrl").

map_a_list_to_a_new_list() ->
  ?ReplaceMe =:= lists:map(fun(Item) -> Item * 2 end, [1, 2, 3]).

fold_an_answer_from_the_left() ->
  ?ReplaceMe =:= lists:foldl(fun(Item, Accumulation) ->
                               string:join([Accumulation, Item], " ")
                             end, "hello", ["erlang", "koans"]).

or_from_the_right() ->
  ?ReplaceMe =:= lists:foldr(fun(Item, Accumulation) ->
                               string:join([Accumulation, Item], " ")
                             end, "hello", ["erlang", "koans"]).

filter_the_appropriate_values() ->
  ?ReplaceMe =:= lists:filter(fun(Item) -> Item rem 2 =:= 0 end, [2, 3, 4]).

merging_two_dicts() ->
  Dict1 = dict:store(key, first_value, dict:new()),
  Dict2 = dict:store(key, second_value, dict:new()),
  NewDict = dict:merge(fun(Key, Value1, Value2) -> [Value1, Value2] end, Dict1, Dict2),
  dict:store(key, ?ReplaceMe, dict:new()) =:= NewDict.

function_passed_to_a_function() ->
  YourListReversalFunction = ?ReplaceMe,
  mango =:= first_of_applied_function(YourListReversalFunction).

first_of_applied_function(YourFunction) when is_function(YourFunction) ->
  lists:nth(1, YourFunction([apple, banana, mango]));
first_of_applied_function(_) ->
  not_a_mango.

