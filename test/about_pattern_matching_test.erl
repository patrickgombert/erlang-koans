-module(about_pattern_matching_test).
-include_lib("eunit/include/eunit.hrl").

what_looks_like_assignment_might_not_be_test() ->
  ?assertEqual(apple, about_pattern_matching:what_looks_like_assignment_might_not_be()).

assignment_with_a_tuple_test() ->
  ?assert(about_pattern_matching:assignment_with_a_tuple()).

sometimes_we_do_not_need_to_know_everything_test() ->
  ?assert(about_pattern_matching:sometimes_we_do_not_need_to_know_everything()).

