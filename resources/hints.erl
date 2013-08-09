-module(hints).
-export([hint_for_invoking_function/2]).

hint_for_invoking_function(Module, Function) ->
  case {Module, Function} of
    {about_atoms, truth} ->
"Welcome to the Erlang Koans!

For these first few koans, the goal is to get
each function to evaluate to \"true\" by
replacing the \"__\" statement.

If this is your first time using Erlang,
learnyousomeerlang.com is a great resource (and
it's consciously designed for programmers who are
new to functional languages).  The \"Starting Out
(for real)\" chapter should be enough to get you
through these first few koans.";

    {about_atoms, atoms_are_the_basis_of_all_calls} ->
"Apply is a built in function (BIF) which takes
the first argument (the module) and the second argument
(the function name) and makes a call based on these
parameters. The third argument is always the arguments
to the function call as a list.";

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

    {about_integers, base_does_not_change_the_value} ->
"The value left of '#' represents the base and the
value right of '#' represents the value in that base.";

    {about_integers, division_is_not_quite_so_straightforward} ->
"The '/' operator returns a floating point value";

    {about_integers, this_makes_applying_bitwise_operations_a_breeze} ->
"band is short for binary and";

    {about_integers, do_the_binary_shuffle} ->
"bsl is a binary left shift. The integer on the left is
the receiver of the left shift by the value specified
on the right.";

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

    {about_list_comprehensions, representing_a_list} ->
"The left hand (i.e. [Item || ..]) can be read as
'Item for (...)' and the right hand side
(i.e [.. || Item <- [1, 2, 3]])
can be read as 'Item in [1, 2, 3]'.
So together, the comprehension is stating the result
list is Item for Items in [1, 2, 3].";

    {about_list_comprehensions, applying_a_filter} ->
"The far right hand side acts as a filter over the
list specified. In this case, we are finding even
number within the list [1, 2, 3].";

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
