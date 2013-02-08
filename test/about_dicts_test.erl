-module(about_dicts_test).
-include_lib("eunit/include/eunit.hrl").

dictionaries_give_the_definition_of_a_key_test() ->
  ?assert(about_dicts:dictionaries_give_the_definition_of_a_key()).

append_assumes_something_test() ->
  ?assert(about_dicts:append_assumes_something()).

fetching_what_is_not_available_is_troublesome_test() ->
  ?assert(about_dicts:fetching_what_is_not_available_is_troublesome()).

however_find_is_a_bit_safer_test() ->
  ?assert(about_dicts:however_find_is_a_bit_safer()).

find_reports_on_matches_test() ->
  ?assert(about_dicts:find_reports_on_matches()).

erasing_from_a_dict_test() ->
  ?assert(about_dicts:erasing_from_a_dict()).

size_is_relative_test() ->
  ?assert(about_dicts:size_is_relative()).

