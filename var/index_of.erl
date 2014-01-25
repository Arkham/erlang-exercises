-module(index_of).
-compile(export_all).

index_of(Haystack, Needle) ->
  index_of(Haystack, Needle, Needle, 0, -1).

index_of(_Haystack, _Needle = [], _OriginalNeedle, _Current, Start) ->
  Start;
index_of(_Haystack = [], _Needle, _OriginalNeedle, _Current, Start) ->
  Start;
index_of(_Haystack = [HH|HT], Needle = [NH|NT], OriginalNeedle, Current, Start) when HH == NH ->
  case Needle == OriginalNeedle of
    true ->  index_of(HT, NT, OriginalNeedle, Current + 1, Current);
    false -> index_of(HT, NT, OriginalNeedle, Current + 1, Start)
  end;
index_of(_Haystack = [_|HT], _Needle, OriginalNeedle, Current, _) ->
  index_of(HT, OriginalNeedle, OriginalNeedle, Current + 1, -1).

test_index_of() ->
  10 = index_of("This is a test string", "test"),
  -1 = index_of("This is a test string", "ciao mamma"),
  4 = index_of("Hel hello hi hello", "hello").
