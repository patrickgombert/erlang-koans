-module(about_guard_clauses_test).
-include_lib("eunit/include/eunit.hrl").

truthfulness_is_necessary_for_guards_test() ->
    ?assertEqual(get_here, about_guard_clauses:truthfulness_is_necessary_for_guards()).

there_exists_a_shorthand_for_and_test() ->
    ?assertEqual(get_here, about_guard_clauses:there_exists_a_shorthand_for_and()).

there_also_exists_a_shorthand_for_or_test() ->
    ?assertEqual(get_here, about_guard_clauses:there_also_exists_a_shorthand_for_or()).

