-module(about_gen_fsms_test).
-include_lib("eunit/include/eunit.hrl").

initial_state_is_set_in_init_test() ->
    ?assert(about_gen_fsms:initial_state_is_set_in_init()).

some_actions_will_not_trigger_a_state_change_test() ->
    ?assert(about_gen_fsms:some_actions_will_not_trigger_a_state_change()).

while_others_will_trigger_a_state_change_test() ->
    ?assert(about_gen_fsms:while_others_will_trigger_a_state_change()).

go_ahead_and_grab_a_soda_test() ->
    ?assert(about_gen_fsms:go_ahead_and_grab_a_soda()).

