-ifdef(run).
-define(ReplaceMe, replace_me).
-endif.

-ifdef(test).
-define(ReplaceMe, runner:lookup()).
-endif.
