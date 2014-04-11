-module(about_maps).
-export([reading_a_key/0,
         adding_a_new_key/0,
         updating_an_existing_key/0
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

