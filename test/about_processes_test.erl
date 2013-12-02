-module(about_processes_test).
-include_lib("eunit/include/eunit.hrl").

writing_messages_to_yourself_test() ->
    ?assert(about_processes:writing_messages_to_yourself()).

writing_messages_to_your_friends_test() ->
    ?assertEqual(get_here, about_processes:writing_messages_to_your_friends()).

keeping_an_eye_on_your_friends_test() ->
    ?assert(about_processes:keeping_an_eye_on_your_friends()).

