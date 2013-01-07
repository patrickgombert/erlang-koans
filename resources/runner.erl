-module(runner).
-export([run/0, test/0]).

run() ->
  {ok, Config} = file:consult("resources/answers.config"),
  Output = run_all(Config),
  case Output of
    ok ->
      io:format("You have completed the Erlang Koans. Namaste.\n");
    {error, Reason} ->
      io:format("The following function failed its test:\n"),
      erlang:display(Reason)
  end,
  halt().

test() ->
  io:format("TODO: Implement insertion of values from answers.config\n"),
  %io:format("All tests pass"),
  halt().

run_all(Config) ->
  if
    Config == [] -> ok;
    true ->
      [Module | Tail] = Config,
      case run_module(Module) of
        ok -> run_all(Tail);
        {error, Reason} -> {error, Reason}
      end
  end.

run_module(Config) ->
  {ModuleName, FunctionToAnswer} = Config,
  TestModuleName = atom_append(ModuleName, '_test'),
  ResultList = lists:map(fun({Function, _}) ->
                   TestFunction = atom_append(Function, '_test'),
                   try apply(TestModuleName, TestFunction, [])
                   catch
                     _:_ ->
                       {error, Function}
                   end
                 end,
                 FunctionToAnswer),
  Result = lists:keyfind(error, 1, ResultList),
  if
    Result == false -> ok;
    true ->
      {_, Function} = Result,
      {error, {ModuleName, Function}}
  end.

atom_append(Atom1, Atom2) ->
  list_to_atom(atom_to_list(Atom1) ++ atom_to_list(Atom2)).

