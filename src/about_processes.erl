-module(about_processes).
-compile(export_all).

writing_messages_to_yourself() ->
  self() ! __,
  receive
    Message ->
      Message =:= "Hello Self!"
  end.

writing_messages_to_your_friends() ->
  FriendPid = spawn(fun() ->
                      receive
                        {Pid, ping} ->
                          Pid ! pong;
                        {Pid, _} ->
                          Pid ! "I only ping-pong!"
                      end
                    end),
  FriendPid ! {self(), __},
  receive
    pong ->
      get_here;
    _ ->
      not_here
  end.

keeping_an_eye_on_your_friends() ->
  process_flag(trap_exit, true),
  spawn_link(fun() -> exit("Goodbye!") end),
  EndMessage = receive
    {'EXIT', _, Message} ->
      Message
  end,
  __ =:= EndMessage.

