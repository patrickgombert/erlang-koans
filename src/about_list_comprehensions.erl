-module(about_list_comprehensions).
-compile(export_all).

representing_a_list() ->
  __ =:= [Item || Item <- [1, 2, 3]].

applying_a_function() ->
  __ =:= [Item * 2 || Item <- [1, 2, 3]].

applying_a_filter() ->
  __ =:= [Item || Item <- [1, 2, 3], Item rem 2 =:= 0].

