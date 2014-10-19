-module(about_gen_fsms_test).
-include_lib("eunit/include/eunit.hrl").

the_initial_state_is_set_in_init_test() ->
    ?assert(about_gen_fsms:the_initial_state_is_set_in_init()).
