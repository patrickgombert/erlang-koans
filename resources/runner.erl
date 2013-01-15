-module(runner).
-export([lookup/0, run/0, test/0]).

lookup() ->
  Config = read_config(),
  try throw(purposeful_error)
  catch throw:purposeful_error ->
    StackTrace = erlang:get_stacktrace(),
    Caller = lists:nth(2, StackTrace),
    {Module, Function, _, _} = Caller,
    {_, ModuleAnswers} = lists:keyfind(Module, 1, Config),
    FunctionAnswer = lists:keyfind(Function, 1, ModuleAnswers),
    {_, Answer} = FunctionAnswer,
    Answer
  end.

run() ->
  Reporter = fun({Module, {Function, _}}) ->
               TestFunction = atom_append(Function, '_test'),
               TestModule = atom_append(Module, '_test'),
               try apply(TestModule, TestFunction, []) of
                 ok -> {ok, Module, Function, {}}
               catch
                 _:{BadMatch, Reason} ->
                   case BadMatch of
                     badmatch ->
                      {error, Module, Function, {badmatch, "A pattern failed to match correctly"}};
                     _ ->
                       Expected = lists:keyfind(expected, 1, Reason),
                       Value = lists:keyfind(value, 1, Reason),
                       {error, Module, Function, {Expected, Value}}
                   end;
                 _:Reason -> {error, Module, Function, {failure, Reason}}
               end
             end,
  Report = excercise_all(read_config(), Reporter),
  case lists:keyfind(error, 1, Report) of
    false -> io:format("You have completed the Erlang Koans. Namaste.\n");
    {error, Module, Function, {Expected, Actual}} ->
      io:format("The following function failed its test:\n"),
      erlang:display({Module, Function}),
      io:format("For the following reason:\n"),
      erlang:display(Expected),
      erlang:display(Actual)
  end,
  halt().

test() ->
  Reporter = fun({Module, {Function, _}}) ->
               TestFunction = atom_append(Function, '_test'),
               TestModule = atom_append(Module, '_test'),
               try apply(TestModule, TestFunction, []) of
                 ok -> {ok, Module, Function, {}}
               catch
                 _:Reason ->
                   {error, Module, Function, Reason}
               end
             end,
  Report = excercise_all(read_config(), Reporter),
  case lists:keyfind(error, 1, Report) of
    false -> io:format("All tests pass!\n");
    _ ->
      lists:foreach(fun({Status, Module, Error, Reason}) ->
          if
            Status == error ->
              erlang:display(Reason);
            true -> ok
          end
        end, Report)
  end,
  halt().

excercise_all(Answers, Reporter) ->
  excercise_all(Answers, Reporter, []).
excercise_all(Answers, Reporter, Report) ->
  if
    Answers == [] -> Report;
    true ->
      [ModuleAnswers | Tail] = Answers,
      excercise_all(Tail, Reporter, (Report ++ exercise_module(ModuleAnswers, Reporter)))
  end.

exercise_module(ModuleAnswers, Reporter) ->
  {ModuleName, FunctionAnswerKey} = ModuleAnswers,
  lists:map(Reporter, lists:map(fun(FunctionAnswer) -> {ModuleName, FunctionAnswer} end, FunctionAnswerKey)).

atom_append(Atom1, Atom2) ->
  list_to_atom(atom_to_list(Atom1) ++ atom_to_list(Atom2)).

read_config() ->
  {ok, Config} = file:consult("resources/answers.config"),
  Config.

