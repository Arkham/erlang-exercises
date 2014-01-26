-module(array_similar).
-compile(export_all).

array_similar(First, Second) when length(First) /= length(Second) ->
  false;
array_similar(First, Second) ->
  sorted_array_similar(lists:sort(First), lists:sort(Second)).

sorted_array_similar([], []) ->
  true;
sorted_array_similar([FH|FT], [SH|ST]) when FH == SH ->
  sorted_array_similar(FT, ST);
sorted_array_similar(_, _) ->
  false.

test() ->
  Arr1 = [1, 2, 2, 3, 4],
  Arr2 = [2, 1, 2, 4, 3],
  Arr3 = [1, 2, 3, 4],
  Arr4 = [1, 2, 3, "4"],
  true = array_similar(Arr1, Arr2),
  false = array_similar(Arr2, Arr3),
  false = array_similar(Arr3, Arr4),
  ok.
