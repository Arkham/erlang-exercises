-module(fermat).
-compile(export_all).

mpow(N, 1, _) ->
  N;
mpow(N, K, M) ->
  mpow(K rem 2, N, K, M).

mpow(0, N, K, M) ->
  X = mpow(N, K div 2, M),
  (X * X) rem M;
mpow(_, N, K, M) ->
  X = mpow(N, K - 1, M),
  (X * N) rem M.

fermat(1) ->
  ok;
fermat(P) ->
  R = random:uniform(P-1),
  T = mpow(R, P-1, P),
  if T == 1 ->
       ok;
     true ->
       no
  end.

test(_, 0) ->
  ok;
test(P, N) ->
  case fermat(P) of
    ok ->
      test(P, N-1);
    no ->
      no
  end.

find_prime(N) when N >= 1 ->
  case test(N, 3) of
    ok ->
      io:format("~p should be prime~n", [N]);
    no ->
      no
  end,
  find_prime(N+1).

