-module(about_gen_servers).
-behaviour(gen_server).
-export([one_may_send_synchronous_messages/0,
         one_may_also_send_asynchronous_messages/0,
         act_upon_all_messages/0
        ]).

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2
        ]).

one_may_send_synchronous_messages() ->
    {ok, ServerPid} = gen_server:start(?MODULE, [], []),
    Result = __ =:= gen_server:call(ServerPid, count),
    gen_server:cast(ServerPid, stop),
    Result.

one_may_also_send_asynchronous_messages() ->
    {ok, ServerPid} = gen_server:start(?MODULE, [], []),
    gen_server:cast(ServerPid, inc),
    gen_server:cast(ServerPid, inc),
    Result = __ =:= gen_server:call(ServerPid, count),
    gen_server:cast(ServerPid, stop),
    Result.

act_upon_all_messages() ->
    {ok, ServerPid} = gen_server:start(?MODULE, [], []),
    gen_server:cast(ServerPid, inc),
    ServerPid ! reset,
    Result = __ =:= gen_server:call(ServerPid, count),
    gen_server:cast(ServerPid, stop),
    Result.

%% gen server

init(_) ->
    {ok, 0}.

handle_call(count, _From, State) ->
    {reply, State, State}.

handle_cast(inc, State) ->
    {noreply, State + 1};
handle_cast(stop, State) ->
    {stop, shutdown, State}.

handle_info(reset, State) ->
    {noreply, 0}.

terminate(_, _) ->
    ok.
