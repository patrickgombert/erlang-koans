-module(about_pattern_matching_test).
-include_lib("eunit/include/eunit.hrl").

what_looks_like_assignment_might_not_be_test() ->
    ?assertEqual(apple, about_pattern_matching:what_looks_like_assignment_might_not_be()).

assignment_with_a_tuple_test() ->
    ?assert(about_pattern_matching:assignment_with_a_tuple()).

branching_on_patterns_test() ->
    ?assert(about_pattern_matching:branching_on_patterns()).

sometimes_we_do_not_need_to_know_everything_test() ->
    ?assertEqual(get_here, about_pattern_matching:sometimes_we_do_not_need_to_know_everything()).

and_sometimes_we_dont_need_to_match_anything_test() ->
    ?assert(about_pattern_matching:and_sometimes_we_dont_need_to_match_anything()).

we_can_find_patterns_in_arguments_test() ->
    ?assertEqual(right, about_pattern_matching:we_can_find_patterns_in_arguments()).

