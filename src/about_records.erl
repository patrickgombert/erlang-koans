-module(about_records).
-export([fields_may_have_defaults/0,
         undefined_fields_may_still_be_referenced/0,
         fields_may_be_set_on_initialization/0,
         redefine_a_field/0
        ]).

-record(fruit, {name, price, vitamin_c=0}).

fields_may_have_defaults() ->
    Fruit = #fruit{},
    __ =:= Fruit#fruit.vitamin_c.

undefined_fields_may_still_be_referenced() ->
    Fruit = #fruit{},
    __ =:= Fruit#fruit.name.

fields_may_be_set_on_initialization() ->
    Apple = #fruit{name=apple},
    __ =:= Apple#fruit.name.

redefine_a_field() ->
    Apple = #fruit{name=apple,price=0.99},
    AppleOnSale = Apple#fruit{price=0.89},
    __ =:= AppleOnSale#fruit.price.

