-module(three_five_sum).
-compile(export_all).

three_five_sum(Num) when Num < 0 ->
  0;
three_five_sum(Num) ->
  Multiples = [ X || X <- lists:seq(1, Num-1), (X rem 3 == 0) or (X rem 5 == 0) ],
  lists:foldl(fun(X, Acc) -> X + Acc end, 0, Multiples).

test() ->
  23 = three_five_sum(10).

