-module(hints).
-export([hint_for_invoking_function/2]).

hint_for_invoking_function(Module, Function) ->
  case {Module, Function} of
    {about_atoms, truth} ->
"Welcome to the Erlang Koans!

For these first few koans, the goal is to get
each function to evaluate to \"true\" by
replacing the \"?ReplaceMe\" statement.

If this is your first time using Erlang,
learnyousomeerlang.com is a great resource (and
it's consciously designed for programmers who are
new to functional languages).  The \"Starting Out
(for real)\" chapter should be enough to get you
through these first few koans.";

    {about_boolean_expressions, being_strict} ->
"If you are familiar with Javascript, the '==' and
'===' are roughly equivalent to Erlang's '==' and
'=:='.  The '==' tries to coerce one variable into
the type of the other before comparing them.";

    {about_boolean_expressions, _} ->
"Look up 'boolean algebra' if you don't know how
to evaluate the truth value of a boolean expression.";

    {_, _} ->
"No hint for this one"
  end.
