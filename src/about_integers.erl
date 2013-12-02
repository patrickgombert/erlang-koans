-module(about_integers).
-export([arithmetic_is_easily_applied/0,
         remember_the_remainder/0,
         division_is_not_quite_so_straightforward/0,
         maybe_this_is_what_is_needed/0,
         absolute_integers/0,
         base_does_not_change_the_value/0,
         this_makes_applying_bitwise_operations_a_breeze/0,
         do_the_binary_shuffle/0,
         now_to_the_right/0
        ]).

arithmetic_is_easily_applied() ->
    10 - 5 =:= __.

remember_the_remainder() ->
    11 rem 2 =:= __.

division_is_not_quite_so_straightforward() ->
    11 / 2 =:= __.

maybe_this_is_what_is_needed() ->
    11 div 2 =:= __.

absolute_integers() ->
    abs(-42) =:= __.

base_does_not_change_the_value() ->
    12#36 =:= __.

this_makes_applying_bitwise_operations_a_breeze() ->
    2#01011 band
    2#11010 =:= __.

do_the_binary_shuffle() ->
    2#1010 bsl 2#101 =:= __.

now_to_the_right() ->
    2#1010 bsr 2#1 =:= __.

