-module(find_missing).
-compile(export_all).

find_missing(List) ->
  find_missing_sorted(lists:sort(List), 1).

find_missing_sorted([], _) ->
  not_found;
find_missing_sorted([H|T], Index) ->
  case H /= Index of
    true -> Index;
    false -> find_missing_sorted(T, Index + 1)
  end.

test() ->
  3 = find_missing([1,2,4]),
  1 = find_missing([2,3]),
  5 = find_missing([4,1,2,3,6]),
  not_found = find_missing([6,4,5,3,1,2]),
  ok.
