-module(about_dicts).
-compile(export_all).

dictionaries_give_the_definition_of_a_key() ->
  Dict = dict:store(key, value, dict:new()),
  __ =:= dict:fetch(key, Dict).

append_assumes_something() ->
  Dict = dict:append(key, value, dict:new()),
  __ =:= dict:fetch(key, Dict).

fetching_what_is_not_available_is_troublesome() ->
  __ =:= bad_fetch().
bad_fetch() ->
  try dict:fetch(not_a_key, dict:new()) of
    _ ->
      not_possible
  catch
    _:Reason ->
     Reason
  end.

however_find_is_a_bit_safer() ->
  __ =:= dict:find(not_a_key, dict:new()).

find_reports_on_matches() ->
  Dict = dict:store(key, value, dict:new()),
  {Report, value} = dict:find(key, Dict),
  __ =:= Report.

erasing_from_a_dict() ->
  Dict = dict:store(key, value, dict:new()),
  NewDict = dict:erase(key, Dict),
  __ =:= dict:find(key, NewDict).

size_is_relative() ->
  BuiltInFunctionSize = size(dict:new()),
  DictionarySize = dict:size(dict:new()),
  __ =:= (BuiltInFunctionSize =:= DictionarySize).

