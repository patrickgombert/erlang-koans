-module(about_gen_fsms).
-behaviour(gen_fsm).

-export([initial_state_is_set_in_init/0,
         some_actions_will_not_trigger_a_state_change/0,
         while_others_will_trigger_a_state_change/0,
         go_ahead_and_grab_a_soda/0]).

-export([init/1,
         not_paid/3,
         paid/3,
         handle_event/3,
         terminate/3]).

initial_state_is_set_in_init() ->
    {ok, FsmPid} = gen_fsm:start(?MODULE, 0, []),
    Result = __ =:= gen_fsm:sync_send_event(FsmPid, {button, "Coke"}),
    gen_fsm:send_all_state_event(FsmPid, stop),
    Result.

some_actions_will_not_trigger_a_state_change() ->
    {ok, FsmPid} = gen_fsm:start(?MODULE, 0, []),
    Result = __ =:= gen_fsm:sync_send_event(FsmPid, {coin, 25}),
    gen_fsm:send_all_state_event(FsmPid, stop),
    Result.

while_others_will_trigger_a_state_change() ->
    {ok, FsmPid} = gen_fsm:start(?MODULE, 0, []),
    gen_fsm:sync_send_event(FsmPid, {coin, 100}),
    gen_fsm:sync_send_event(FsmPid, {coin, 25}),
    Result = __ =:= gen_fsm:sync_send_event(FsmPid, {coin, 25}),
    gen_fsm:send_all_state_event(FsmPid, stop),
    Result.

go_ahead_and_grab_a_soda() ->
    {ok, FsmPid} = gen_fsm:start(?MODULE, 0, []),
    gen_fsm:sync_send_event(FsmPid, {coin, 100}),
    gen_fsm:sync_send_event(FsmPid, {coin, 25}),
    Result = __ =:= gen_fsm:sync_send_event(FsmPid, {button, "Soda"}),
    gen_fsm:send_all_state_event(FsmPid, stop),
    Result.

%% gen fsm

init(_) ->
    {ok, not_paid, {0, 125}}.

not_paid({button, _}, _From, {Cents, Cost}) ->
    RemainingBalance = (Cost - Cents),
    Message = "You still owe " ++ integer_to_list(RemainingBalance),
    {reply, Message, not_paid, {Cents, Cost}};
not_paid({coin, Value}, _From, {Cents, Cost}) ->
    NewCents = Cents + Value,
    case NewCents >= Cost of
      true -> {reply, "Make a selection", paid, {Cost - Cents, Cost}};
      _ ->
        Message = "You still owe " ++ integer_to_list(Cost - NewCents),
        {reply, Message, not_paid, {NewCents, Cost}}
    end.

paid({button, Selection}, _From, {Cents, Cost}) ->
    {reply, "Vending a " ++ Selection, not_paid, {Cents, Cost}};
paid({coin, _Value}, _From, {Cents, Cost}) ->
    {reply, "Please make a selection, refunding coin", paid, {Cents, Cost}}.

handle_event(stop, _StateName, StateData) ->
    {stop, normal, StateData}.

terminate(_Reason, _StateName, _State) ->
    ok.
