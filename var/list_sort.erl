-module(list_sort).
-compile(export_all).

sort(List = [_|_]) ->
  lists:sort(fun(A, B) -> A < B end, List);
sort(_) ->
  [].

test() ->
  [1,2,3,4] = sort([4,2,3,1]),
  [] = sort(mammt),
  ok.
