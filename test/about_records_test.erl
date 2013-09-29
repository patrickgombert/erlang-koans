-module(about_records_test).
-include_lib("eunit/include/eunit.hrl").

fields_may_have_defaults_test() ->
  ?assert(about_records:fields_may_have_defaults()).

undefined_fields_may_still_be_referenced_test() ->
  ?assert(about_records:undefined_fields_may_still_be_referenced()).

fields_may_be_set_on_initialization_test() ->
  ?assert(about_records:fields_may_be_set_on_initialization()).

redefine_a_field_test() ->
  ?assert(about_records:redefine_a_field()).

