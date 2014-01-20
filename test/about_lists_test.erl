-module(about_lists_test).
-include_lib("eunit/include/eunit.hrl").

lists_are_not_homogenious_test() ->
    ?assert(about_lists:lists_are_not_homogenious()).

we_can_add_test() ->
    ?assertEqual([apple, banana, mango, orange], about_lists:we_can_add()).

we_can_also_take_away_test() ->
    ?assertEqual([banana], about_lists:we_can_also_take_away()).

lists_define_delete_test() ->
    ?assertEqual([banana], about_lists:lists_define_delete()).

just_how_many_are_deleted_test() ->
    ?assert(about_lists:just_how_many_are_deleted()).

lists_have_heads_test() ->
    ?assert(about_lists:lists_have_heads()).

lists_also_have_tails_test() ->
    ?assert(about_lists:lists_also_have_tails()).

constructing_with_cons_test() ->
    ?assert(about_lists:constructing_with_cons()).

length_is_as_simple_as_it_seems_test() ->
    ?assert(about_lists:length_is_as_simple_as_it_seems()).

lists_of_tuples_can_be_found_by_key_test() ->
    ?assertEqual({lunch, pasta}, about_lists:lists_of_tuples_can_be_found_by_key()).

