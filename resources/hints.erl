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
"If you are familiar with Javascript, the '===' is
roughly equivalent to Erlang's '=:='.  So the two
sides can only be equal if they are the same type.";

    {about_boolean_expressions, being_not_so_strict} ->
"Erlang's '==' is like Javascript's '==': things
can be equal even if they aren't the same type.";

    {about_boolean_expressions, _} ->
"Look up 'boolean algebra' if you don't know how
to evaluate the truth value of a boolean expression.";

    {about_strings, a_substring_is_shorter_than_the_original} ->
"Not zero-indexed...";

    {about_lists, constructing_with_cons} ->
"The '|' is called the 'cons' operator.  When it is
inside square brackets, it splits the list into the
head (first element) and tail (a list of the rest of
the elements).  It can be used either for pattern
matching, or for adding an element to the front of
the list.";

    {about_lists, comprehending_a_list} ->
"Since functional languages don't allow mutable
variables, there's no way to increment a counter
variable.  This means we can't iterate through
each element in a list, so instead we have to use
list comprehensions to manipulate/refine lists
until we have a set with the information we need.";

    {about_dicts, append_assumes_something} ->
"dict:append() can be used to associate multiple
values with a single key.  So the value can't just
be an atom...";

    {about_dicts, fetching_what_is_not_available_is_troublesome} ->
"If you try a bad fetch in `erl` (the Erlang
console), you can see the error that is thrown.
So what is the abbreviation of that?";

    {about_higher_order_functions, function_passed_to_a_function} ->
"The syntax that will satisfy `is_function()` looks
like this:  `fun(Args, ...) -> (function body) end,`.
This is how you define an anonymous function in
Erlang.";

    {about_processes, _} ->
"`receive` uses pattern matching to decide how to
react to a message.";

    {_, _} ->
"No hint for this one.
learnyousomeerlang.com might help."
  end.
