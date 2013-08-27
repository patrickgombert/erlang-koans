-module(about_integers_test).
-include_lib("eunit/include/eunit.hrl").

arithmetic_is_easily_applied_test() ->
  ?assert(about_integers:arithmetic_is_easily_applied()).

remember_the_remainder_test() ->
  ?assert(about_integers:remember_the_remainder()).

division_is_not_quite_so_straightforward_test() ->
  ?assert(about_integers:division_is_not_quite_so_straightforward()).

maybe_this_is_what_is_needed_test() ->
  ?assert(about_integers:maybe_this_is_what_is_needed()).

absolute_integers_test() ->
  ?assert(about_integers:absolute_integers()).

base_does_not_change_the_value_test() ->
  ?assert(about_integers:base_does_not_change_the_value()).

this_makes_applying_bitwise_operations_a_breeze_test() ->
  ?assert(about_integers:this_makes_applying_bitwise_operations_a_breeze()).

do_the_binary_shuffle_test() ->
  ?assert(about_integers:do_the_binary_shuffle()).

now_to_the_right_test() ->
  ?assert(about_integers:now_to_the_right()).

