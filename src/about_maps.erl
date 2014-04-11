-module(about_maps).
-export([reading_a_key/0,
         adding_a_new_key/0,
         updating_an_existing_key/0,
         matching_the_interesting_bits/0
        ]).

reading_a_key() ->
    Map = #{key => val},
    __ =:= maps:get(key, Map).

adding_a_new_key() ->
    Map = #{key1 => val1},
    NextMap = Map#{key2 => val2},
    __ =:= maps:get(key2, NextMap).

updating_an_existing_key() ->
    Map = #{key => val1},
    NextMap = Map#{key := val2},
    __ =:= maps:get(key, NextMap).

matching_the_interesting_bits() ->
    Map = #{apple => 0.79, banana => 0.59},
    #{apple := ApplePrice} = Map,
    __ =:= ApplePrice.

