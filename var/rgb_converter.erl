-module(rgb_converter).
-compile(export_all).

hex_to_rgb([35, R1, R2, G1, G2, B1, B2]) ->
  Result = [{r, [R1, R2]}, {g, [G1, G2]}, {b, [B1, B2]}],
  lists:map(fun({Type, Str}) -> {Type, erlang:list_to_integer(Str, 16)} end, Result).

test() ->
  [{r, 255}, {g, 153}, {b, 51}] = hex_to_rgb("#FF9933"),
  ok.
