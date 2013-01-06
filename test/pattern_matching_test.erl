-module(pattern_matching_test).
-include_lib("eunit/include/eunit.hrl").

what_looks_like_assignment_might_not_be_test() ->
  ?assertEqual(apple, pattern_matching:what_looks_like_assignment_might_not_be()).

assignment_with_a_tuple_test() ->
  ?assert(pattern_matching:assignment_with_a_tuple()).

sometimes_we_do_not_need_to_know_everything_test() ->
  ?assert(pattern_matching:sometimes_we_do_not_need_to_know_everything()).
