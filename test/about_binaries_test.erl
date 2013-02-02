-module(about_binaries_test).
-include_lib("eunit/include/eunit.hrl").

binaries_of_strings_test() ->
  ?assert(about_binaries:binaries_of_strings()).

and_also_strings_of_binaries_test() ->
  ?assert(about_binaries:and_also_strings_of_binaries()).

returning_the_first_byte_test() ->
  ?assert(about_binaries:the_first_byte_is_a_byte___right()).

then_what_is_the_last_test() ->
  ?assert(about_binaries:then_what_is_the_last()).

