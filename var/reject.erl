-module(reject).
-compile(export_all).

reject(L, Fn) ->
  reject(L, Fn, []).

reject([], _, Acc) ->
  lists:reverse(Acc);
reject([H|T], Fn, Acc) ->
  case Fn(H) of
    false -> reject(T, Fn, [H|Acc]);
    true -> reject(T, Fn, Acc)
  end.

test_reject() ->
  [1,3,5] = reject([1,2,3,4,5,6], fun(Num) -> Num rem 2 == 0 end).
