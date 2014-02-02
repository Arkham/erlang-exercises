-module(test).
-export([bench/2, bench/3]).

bench(Host, Port) ->
  bench(Host, Port, 100).
bench(Host, Port, Runs) ->
  Start = now(),
  run(Runs, Host, Port),
  Finish = now(),
  timer:now_diff(Finish, Start).

run(N, Host, Port) ->
  if N == 0 ->
       ok;
     N /= 0 ->
       request(Host, Port),
       run(N-1, Host, Port)
  end.

request(Host, Port) ->
  Opt = [list, {active, false}, {reuseaddr, true}],
  {ok, Server} = gen_tcp:connect(Host, Port, Opt),
  gen_tcp:send(Server, http:get("foo")),
  Recv = gen_tcp:recv(Server, 0),
  case Recv of
    {ok, _} ->
      ok;
    {error, Error} ->
      io:format("test: error: ~w~n", [Error])
  end.
