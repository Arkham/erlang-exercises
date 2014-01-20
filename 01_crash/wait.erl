-module(wait).

-export([hello/0]).

hello() ->
  receive
    X -> io:format("Surprise, a message: ~s~n", [X])
  end.
