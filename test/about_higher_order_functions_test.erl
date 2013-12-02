-module(about_higher_order_functions_test).
-include_lib("eunit/include/eunit.hrl").

map_a_list_to_a_new_list_test() ->
    ?assert(about_higher_order_functions:map_a_list_to_a_new_list()).

fold_an_answer_from_the_left_test() ->
    ?assert(about_higher_order_functions:fold_an_answer_from_the_left()).

or_from_the_right_test() ->
    ?assert(about_higher_order_functions:or_from_the_right()).

filter_the_appropriate_values_test() ->
    ?assert(about_higher_order_functions:filter_the_appropriate_values()).

merging_two_dicts_test() ->
    ?assert(about_higher_order_functions:merging_two_dicts()).

function_passed_to_a_function_test() ->
    ?assert(about_higher_order_functions:function_passed_to_a_function()).

