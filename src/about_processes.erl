-module(about_processes).
-compile(export_all).
-include("../resources/koans.hrl").

writing_messages_to_yourself() ->
  self() ! ?ReplaceMe,
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
  FriendPid ! {self(), ?ReplaceMe},
  receive
    pong ->
      get_here;
    _ ->
      not_here
  end.

