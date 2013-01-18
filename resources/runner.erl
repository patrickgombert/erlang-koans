-module(runner).
-export([lookup/0, test/0, run/0]).

lookup() ->
  try throw(purposeful_error)
  catch throw:purposeful_error ->
    StackTrace = erlang:get_stacktrace(),
    {Module, Function, _, _} = lists:nth(2, StackTrace),
    {_, Last} = lists:last(read_config()),
    {_, ModuleAnswers} = lists:keyfind(Module, 1, read_config()),
    {_, Answer} = lists:keyfind(Function, 1, ModuleAnswers),
    Answer
  end.

test() ->
  ModuleNames = lists:map(fun({Module, _}) -> atom_append(Module, '_test') end, read_config()),
  eunit:test(ModuleNames),
  halt().

run() ->
  Reporter = fun({Module, {Function, _}}) ->
               TestFunction = atom_append(Function, '_test'),
               TestModule = atom_append(Module, '_test'),
               try apply(TestModule, TestFunction, []) of
                 ok -> {ok, Module, Function, {}}
               catch
                 _:{Exception, Reason} ->
                   case Exception of
                     assertion_failed ->
                       Expected = lists:keyfind(expected, 1, Reason),
                       Value = lists:keyfind(value, 1, Reason),
                       {error, Module, Function, {Expected, Value}};
                     _ ->
                      {error, Module, Function, {Exception, Reason}}
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

