-module(about_gen_fsms).
-behaviour(gen_fsm).

-export([the_initial_state_is_set_in_init/0]).

-export([init/1,
         not_paid/3,
         paid/3,
         handle_event/3,
         terminate/3]).

the_initial_state_is_set_in_init() ->
    {ok, FsmPid} = gen_fsm:start_link(?MODULE, 0, []),
    Result = __ =:= gen_fsm:sync_send_event(FsmPid, {button, "Coke"}),
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
    case NewCents >= Value of
      true -> {reply, "Make a selection", paid, {Cost - Cents, Cost}};
      _ -> {reply, "You still owe" ++ (Cost - Cents), not_paid, {Cents, Cost}}
    end.

paid({button, Selection}, _From, {Cents, Cost}) ->
    {reply, "Vending a " ++ Selection, not_paid, {Cents, Cost}};
paid({coin, Value}, _From, {Cents, Cost}) ->
    {reply, "Please make a selection, refunding coin", paid, {Cents, Cost}}.

handle_event(stop, _StateName, StateData) ->
    {stop, normal, StateData}.

terminate(_Reason, _StateName, _State) ->
    ok.
