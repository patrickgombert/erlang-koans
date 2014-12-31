-module(about_gen_servers_test).
-include_lib("eunit/include/eunit.hrl").

one_may_send_synchronous_messages_test() ->
    ?assert(about_gen_servers:one_may_send_synchronous_messages()).

one_may_also_send_asynchronous_messages_test() ->
    ?assert(about_gen_servers:one_may_also_send_asynchronous_messages()).

act_upon_all_messages_test() ->
    ?assert(about_gen_servers:act_upon_all_messages()).
