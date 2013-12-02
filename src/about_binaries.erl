-module(about_binaries).
-export([binaries_of_strings/0,
         and_also_strings_of_binaries/0,
         the_first_byte_is_a_byte___right/0,
         then_what_is_the_last/0
        ]).

binaries_of_strings() ->
    __ =:= binary:bin_to_list(<<"What am I, really?">>).

and_also_strings_of_binaries() ->
    __ =:= binary:list_to_bin("What am I, really?").

the_first_byte_is_a_byte___right() ->
    __ =:= binary:first(<<"binary">>).

then_what_is_the_last() ->
    __ =:= binary:last(<<"binary">>).

