-module(about_lists_test).
-include_lib("eunit/include/eunit.hrl").

lists_are_not_homogenious_test() ->
  ?assert(about_lists:lists_are_not_homogenious()).

we_can_add_test() ->
  ?assertEqual([apple, banana, mango, orange], about_lists:we_can_add()).

we_can_also_take_away_test() ->
  ?assertEqual([banana], about_lists:we_can_also_take_away()).

