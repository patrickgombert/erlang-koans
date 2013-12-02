-module(runner).
-export([test/0, run/0, hint/0]).

test() ->
    ModuleNames = lists:map(fun({Module, _}) -> atom_append(Module, '_test') end, read_config()),
    eunit:test(ModuleNames),
    halt().

run() ->
  Report = generate_report(),
  case lists:keyfind(error, 1, Report) of
      false -> io:format("You have completed the Erlang Koans. Namaste.\n");
      {error, Module, Function, Reason} ->
          io:format("The following function failed its test:\n"),
          case Reason of
              {Expected, Actual} ->
                  erlang:display({Module, Function}),
                  io:format("For the following reason:\n"),
                  erlang:display(Expected),
                  erlang:display(Actual),
                  case Actual of
                      undef ->
                          io:format("(There's probably a syntax error in '" ++ atom_to_list(Module) ++ ".erl' - make sure each function ends with a period!)\n");
                      _ ->
                          ignore
                  end;
              {Exception, Reason} ->
                  erlang:display({Module, Function}),
                  io:format("With the exception"),
                  erlang:display(Exception),
                  erlang:display(Reason);
              AnyReason ->
                  erlang:display({Module, Function}),
                  erlang:display(AnyReason)
          end
  end,
  halt().

generate_report() ->
    Reporter = fun({Module, {Function, _}}) ->
                 TestFunction = atom_append(Function, '_test'),
                 TestModule = atom_append(Module, '_test'),
                 try apply(TestModule, TestFunction, []) of
                     ok -> {ok, Module, Function, {}}
                 catch
                     _:{Exception, Reason} ->
                         if
                             (Exception =:= assertion_failed) orelse (Exception =:= assertEqual_failed) ->
                                 Expected = lists:keyfind(expected, 1, Reason),
                                 Value = lists:keyfind(value, 1, Reason),
                                 {error, Module, Function, {Expected, Value}};
                             true ->
                                 {error, Module, Function, {Exception, Reason}}
                         end;
                     _:Reason -> {error, Module, Function, {failure, Reason}}
                 end
               end,
    exercise_all(read_config(), Reporter).

exercise_all(Answers, Reporter) ->
    exercise_all(Answers, Reporter, []).
exercise_all(Answers, Reporter, Report) ->
    if
        Answers == [] -> Report;
        true ->
            [ModuleAnswers | Tail] = Answers,
            exercise_all(Tail, Reporter, (Report ++ exercise_module(ModuleAnswers, Reporter)))
    end.

exercise_module(ModuleAnswers, Reporter) ->
    {ModuleName, FunctionAnswerKey} = ModuleAnswers,
    lists:map(Reporter, lists:map(fun(FunctionAnswer) -> {ModuleName, FunctionAnswer} end, FunctionAnswerKey)).

eval(RawCode) ->
    {ok, Tokens, _} = erl_scan:string(RawCode),
    {ok, [Form]} = erl_parse:parse_exprs(Tokens),
    Bindings = erl_eval:add_binding('B', 2, erl_eval:new_bindings()),
    {value, Fun, _} = erl_eval:expr(Form, Bindings),
    Fun.

atom_append(Atom1, Atom2) ->
    list_to_atom(atom_to_list(Atom1) ++ atom_to_list(Atom2)).

read_config() ->
    answers:cheat_sheet().

hint() ->
    Report = generate_report(),
    case lists:keyfind(error, 1, Report) of
        false -> io:format("You have completed the Erlang Koans. Namaste.\n");
        {error, Module, Function, _} ->
            io:format("\n==== " ++ atom_to_list(Module) ++ ":" ++ atom_to_list(Function) ++ "() ====\n" ++ hints:hint_for_invoking_function(Module, Function) ++ "\n\n")
    end,
    halt().

