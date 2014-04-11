-module(about_maps_test).
-include_lib("eunit/include/eunit.hrl").

reading_a_key_test() ->
    ?assert(about_maps:reading_a_key()).

adding_a_new_key_test() ->
    ?assert(about_maps:adding_a_new_key()).

updating_an_existing_key_test() ->
    ?assert(about_maps:updating_an_existing_key()).

matching_the_interesting_bits_test() ->
    ?assert(about_maps:matching_the_interesting_bits()).

