-module(about_list_comprehensions_test).
-include_lib("eunit/include/eunit.hrl").

representing_a_list_test() ->
    ?assert(about_list_comprehensions:representing_a_list()).

mapping_a_function_test() ->
    ?assert(about_list_comprehensions:mapping_a_function()).

applying_a_filter_test() ->
    ?assert(about_list_comprehensions:applying_a_filter()).

all_together_now_test() ->
    ?assert(about_list_comprehensions:all_together_now()).

