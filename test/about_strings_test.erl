-module(about_strings_test).
-include_lib("eunit/include/eunit.hrl").

first_we_must_see_what_lies_underneath_test() ->
  ?assert(about_strings:first_we_must_see_what_lies_underneath()).

two_strings_are_longer_than_one_test() ->
  ?assert(about_strings:two_strings_are_longer_than_one()).

a_substring_is_shorter_than_the_original_test() ->
  ?assert(about_strings:a_substring_is_shorter_than_the_original()).

if_you_want_to_make_a_lisp_interpreter_do_not_go_alone_take_this_test() ->
  ?assert(about_strings:if_you_want_to_make_a_lisp_interpreter_do_not_go_alone_take_this()).

joining_a_list_of_strings_test() ->
  ?assert(about_strings:joining_a_list_of_strings()).

