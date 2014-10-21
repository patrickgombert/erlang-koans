-module(answers).
-export([cheat_sheet/0, get_for_invoking_function/0]).

cheat_sheet() ->
  [
    {about_atoms, [
        {truth, true},
        {truth_is_not_always_boolean, true},
        {strings_are_not_atoms, false},
        {however_atoms_might_look_like_a_string, true},
        {atoms_are_the_basis_of_all_calls, erlang}
      ]},
    {about_boolean_expressions, [
        {or_operator, true},
        {and_operator, false},
        {xor_operator, true},
        {not_operator, false},
        {being_strict, false},
        {being_not_so_strict, true},
        {special_operators_evaluate_only_what_is_necessary, false},
        {this_applies_to_or_as_well, true},
        {make_de_morgan_proud, true},
        {syntax_you_might_not_expect, true}
      ]},
    {about_strings, [
        {first_we_must_see_what_lies_underneath, true},
        {two_strings_are_longer_than_one, "Hello World"},
        {a_substring_is_shorter_than_the_original, "burger"},
        {if_you_want_to_make_a_lisp_interpreter_do_not_go_alone_take_this, ["(=", "true", "my-answer)"]},
        {joining_a_list_of_strings, "Oxford,Comma"}
      ]},
    {about_binaries, [
        {binaries_of_strings, "What am I, really?"},
        {and_also_strings_of_binaries, <<"What am I, really?">>},
        {the_first_byte_is_a_byte___right, 98},
        {then_what_is_the_last, 121}
      ]},
    {about_integers, [
        {arithmetic_is_easily_applied, 5},
        {remember_the_remainder, 1},
        {division_is_not_quite_so_straightforward, 5.5},
        {maybe_this_is_what_is_needed, 5},
        {absolute_integers, 42},
        {base_does_not_change_the_value, 42},
        {this_makes_applying_bitwise_operations_a_breeze, 2#01010},
        {do_the_binary_shuffle, 2#101000000},
        {now_to_the_right, 2#0101}
      ]},
    {about_pattern_matching, [
        {what_looks_like_assignment_might_not_be, apple},
        {assignment_with_a_tuple, banana},
        {branching_on_patterns, apple},
        {sometimes_we_do_not_need_to_know_everything, apple},
        {and_sometimes_we_dont_need_to_match_anything, anything},
        {we_can_find_patterns_in_arguments, bar}
      ]},
    {about_guard_clauses, [
        {truthfulness_is_necessary_for_guards, true},
        {there_exists_a_shorthand_for_and, 1},
        {there_also_exists_a_shorthand_for_or, 5}
      ]},
    {about_lists, [
        {lists_are_not_homogenious, 1},
        {we_can_add, [mango, orange]},
        {we_can_also_take_away, apple},
        {lists_define_delete, apple},
        {just_how_many_are_deleted, [banana, apple]},
        {lists_have_heads, apple},
        {lists_also_have_tails, [banana, mango]},
        {constructing_with_cons, [apple, banana, mango, pear]},
        {length_is_as_simple_as_it_seems, 3},
        {lists_of_tuples_can_be_found_by_key, pasta}
      ]},
    {about_list_comprehensions, [
        {representing_a_list, [1, 2, 3]},
        {applying_a_function, [2, 4, 6]},
        {applying_a_filter, [2]}
      ]},
    {about_dicts, [
        {dictionaries_give_the_definition_of_a_key, value},
        {append_assumes_something, [value]},
        {fetching_what_is_not_available_is_troublesome, badarg},
        {however_find_is_a_bit_safer, error},
        {find_reports_on_matches, ok},
        {erasing_from_a_dict, error},
        {size_is_relative, false}
      ]},
    {about_maps, [
        {reading_a_key, val},
        {adding_a_new_key, val2},
        {updating_an_existing_key, val2},
        {matching_the_interesting_bits, 0.79}
      ]},
    {about_records, [
        {fields_may_have_defaults, 0},
        {undefined_fields_may_still_be_referenced, undefined},
        {fields_may_be_set_on_initialization, apple},
        {redefine_a_field, 0.89}
      ]},
    {about_higher_order_functions, [
        {map_a_list_to_a_new_list, [2, 4, 6]},
        {fold_an_answer_from_the_left, "hello erlang koans"},
        {or_from_the_right, "hello koans erlang"},
        {filter_the_appropriate_values, [2, 4]},
        {merging_two_dicts, [first_value, second_value]},
        {function_passed_to_a_function, fun(List) -> lists:reverse(List) end}
      ]},
    {about_processes, [
        {writing_messages_to_yourself, "Hello Self!"},
        {writing_messages_to_your_friends, ping},
        {keeping_an_eye_on_your_friends, "Goodbye!"}
      ]},
    {about_gen_servers, [
        {one_may_send_synchronous_messages, 0},
        {one_may_also_send_asynchronous_messages, 2}
      ]},
    {about_gen_fsms, [
        {initial_state_is_set_in_init, "You still owe 125"},
        {some_actions_will_not_trigger_a_state_change, "You still owe 100"},
        {while_others_will_trigger_a_state_change, "Please make a selection, refunding coin"},
        {go_ahead_and_grab_a_soda, "Vending a Soda"}
      ]}
    ].

get_for_invoking_function() ->
  try throw(purposeful_error)
  catch throw:purposeful_error ->
      StackTrace = erlang:get_stacktrace(),
      UnderTest = lists:nth(2, StackTrace),
      Module = element(1, UnderTest),
      Function = element(2, UnderTest),
      {_, Last} = lists:last(cheat_sheet()),
      {_, ModuleAnswers} = lists:keyfind(Module, 1, cheat_sheet()),
      {_, Answer} = lists:keyfind(Function, 1, ModuleAnswers),
      Answer
  end.

