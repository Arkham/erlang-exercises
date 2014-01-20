-module(ping).

-export([ping/1, server/1, init_server/0, start_server/0]).

ping(ServerPid) ->
  ServerPid ! {self(), ping},
  receive
    {pong, Counter} -> {pong, Counter}
  end.

server(State) ->
  receive
    {Pid, ping} ->
      Pid ! {pong, State},
      server(State + 1)
  end.

init_server() ->
  server(0).

start_server() ->
  register(ping_server, Pid=spawn(?MODULE, init_server, [])),
  Pid.
