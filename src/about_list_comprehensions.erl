-module(about_list_comprehensions).
-export([representing_a_list/0,
         mapping_a_function/0,
         applying_a_filter/0
        ]).

representing_a_list() ->
    __ =:= [Item || Item <- [1, 2, 3]].

mapping_a_function() ->
    __ =:= [Item * 2 || Item <- [1, 2, 3]].

applying_a_filter() ->
    __ =:= [Item || Item <- [1, 2, 3], Item rem 2 =:= 0].

