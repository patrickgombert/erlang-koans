-module(about_list_comprehensions).
-compile(export_all).
-include("../resources/koans.hrl").

representing_a_list() ->
  ?ReplaceMe =:= [Item || Item <- [1, 2, 3]].

applying_a_function() ->
  ?ReplaceMe =:= [Item * 2 || Item <- [1, 2, 3]].

applying_a_filter() ->
  ?ReplaceMe =:= [Item || Item <- [1, 2, 3], Item rem 2 =:= 0].

