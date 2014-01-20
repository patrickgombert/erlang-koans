-module(about_lists).
-export([lists_are_not_homogenious/0,
         we_can_add/0,
         we_can_also_take_away/0,
         lists_define_delete/0,
         just_how_many_are_deleted/0,
         lists_have_heads/0,
         lists_also_have_tails/0,
         constructing_with_cons/0,
         length_is_as_simple_as_it_seems/0,
         lists_of_tuples_can_be_found_by_key/0
        ]).

lists_are_not_homogenious() ->
    NotJustFruits = [apple, banana, __, mango],
    Element = lists:nth(3, NotJustFruits),
    (Element < 2) and (Element > 0).

we_can_add() ->
    [apple, banana] ++ __.

we_can_also_take_away() ->
    [apple, banana] -- [__].

lists_define_delete() ->
    lists:delete(__, [apple, banana]).

just_how_many_are_deleted() ->
    __ =:= lists:delete(apple, [apple, banana, apple]).

lists_have_heads() ->
    [Head | Tail] = [apple, banana, mango],
    __ =:= Head.

lists_also_have_tails() ->
    [Head | Tail] = [apple, banana, mango],
    __ =:= Tail.

constructing_with_cons() ->
    __ =:= [apple | [banana | [mango | [pear | []]]]].

length_is_as_simple_as_it_seems() ->
    __ =:= length([1, 2, 3]).

lists_of_tuples_can_be_found_by_key() ->
    Meals = [{breakfast, eggs}, {lunch, pasta}, {dinner, burrito}],
    {lunch, _} = lists:keyfind(__, 2, Meals).

