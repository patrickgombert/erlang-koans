%%------------------------------------------------------------------------------
%% Copyright 2013 Krzysztof Rutka
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%------------------------------------------------------------------------------

%% @author Krzysztof Rutka <krzysztof.rutka@gmail.com>
%% @copyright 2013 Krzysztof Rutka
%% @doc Parse transform for the underscores.
%% Replaces '__' variable with an appropriate term.
-module(underscore).

%% Parse transform callback
-export([parse_transform/2]).

-ifdef(run).
-define(ReplaceMe(Line), {atom, Line, replace_me}).
-endif.
-ifdef(test).
-define(ReplaceMe(Line), {call, Line,
                          {remote, Line, {atom, Line, answers},
                           {atom, Line, get_for_invoking_function}}, []}).
-endif.

%%------------------------------------------------------------------------------
%% Exported functions
%%------------------------------------------------------------------------------

parse_transform(Forms, _Options) ->
    forms(Forms).

%%------------------------------------------------------------------------------
%% Internal functions
%%------------------------------------------------------------------------------

forms(Forms) ->
    forms(Forms, []).

forms([], NewForms) ->
    lists:reverse(NewForms);
forms([Form | Forms], NewForms) ->
    forms(Forms, [form(Form) | NewForms]).

form({var, Line, '__'}) ->
    ?ReplaceMe(Line);
form({function, Line, Name, Arrity, Clauses}) ->
    {function, Line, Name, Arrity, forms(Clauses)};
form({clause, Line, Args, Guards, Body}) ->
    {clause, Line, Args, Guards, forms(Body)};
form({call, Line, Fun, Args}) ->
    {call, Line, Fun, forms(Args)};
form({match, Line, Form1, Form2}) ->
    {match, Line, form(Form1), form(Form2)};
form({'case', Line, Form, Clauses}) ->
    {'case', Line, form(Form), forms(Clauses)};
form({cons, Line, Form1, Form2}) ->
    {cons, Line, form(Form1), form(Form2)};
form({tuple, Line, Elems}) ->
    {tuple, Line, forms(Elems)};
form({op, Line, Op, Form1, Form2}) ->
    {op, Line, Op, form(Form1), form(Form2)};
form({op, Line, Op, Form}) ->
    {op, Line, Op, form(Form)};
form(Other) ->
    Other.
