-module(about_strings).
-export([first_we_must_see_what_lies_underneath/0,
         two_strings_are_longer_than_one/0,
         a_substring_is_shorter_than_the_original/0,
         if_you_want_to_make_a_lisp_interpreter_do_not_go_alone_take_this/0,
         joining_a_list_of_strings/0
        ]).

first_we_must_see_what_lies_underneath() ->
    __ =:= is_list("Hello list!").

two_strings_are_longer_than_one() ->
    __ =:= string:concat("Hello", " World").

a_substring_is_shorter_than_the_original() ->
    __ =:= string:substr("hamburger", 4, 10).

if_you_want_to_make_a_lisp_interpreter_do_not_go_alone_take_this() ->
    __ =:= string:tokens("(= true my-answer)", " ").

joining_a_list_of_strings() ->
    __ =:= string:join(["Oxford", "Comma"], ",").

