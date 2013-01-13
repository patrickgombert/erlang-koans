-module(runner).
-export([run/0, test/0, lookup/0]).

run() ->
  {ok, Config} = file:consult("resources/answers.config"),
  Output = run_all(Config),
  case Output of
    ok ->
      io:format("You have completed the Erlang Koans. Namaste.\n");
    {error, {ModuleName, Function, {Expected, Value}}} ->
      io:format("The following function failed its test:\n"),
      erlang:display({ModuleName, Function}),
      io:format("For the following reason:\n"),
      erlang:display(Expected),
      erlang:display(Value)
  end,
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
                     _:{BadMatch, Reason} ->
                       case BadMatch of
                         badmatch -> {error, Function, {badmatch, "A pattern failed to match correctly"}};
                         _ ->
                           Expected = lists:keyfind(expected, 1, Reason),
                           Value = lists:keyfind(value, 1, Reason),
                           {error, Function, {Expected, Value}}
                       end
                   end
                 end,
                 FunctionToAnswer),
  Result = lists:keyfind(error, 1, ResultList),
  if
    Result == false -> ok;
    true ->
      {_, Function, Reason} = Result,
      {error, {ModuleName, Function, Reason}}
  end.

test() ->
  {ok, Config} = file:consult("resources/answers.config"),
  test_all(Config),
  io:format("All tests pass.\n"),
  halt().

test_all(Config) ->
  if
    Config == [] -> ok;
    true ->
      [Module | Tail] = Config,
      case test_module(Module) of
        ok -> test_all(Tail)
      end
  end.

test_module(Config) ->
  {ModuleName, FunctionToAnswer} = Config,
  TestModuleName = atom_append(ModuleName, '_test'),
  lists:foreach(fun({Function, _}) ->
     TestFunction = atom_append(Function, '_test'),
     try apply(TestModuleName, TestFunction, [])
     catch
      _:Reason ->
        erlang:display(Reason),
        halt()
     end
   end,
   FunctionToAnswer).

lookup() ->
  {ok, Config} = file:consult("resources/answers.config"),
  try throw(a)
  catch throw:a ->
    StackTrace = erlang:get_stacktrace(),
    Caller = lists:nth(2, StackTrace),
    {Module, Function, _, _} = Caller,
    {_, ModuleAnswers} = lists:keyfind(Module, 1, Config),
    FunctionAnswer = lists:keyfind(Function, 1, ModuleAnswers),
    {_, Answer} = FunctionAnswer,
    Answer
  end.

atom_append(Atom1, Atom2) ->
  list_to_atom(atom_to_list(Atom1) ++ atom_to_list(Atom2)).

