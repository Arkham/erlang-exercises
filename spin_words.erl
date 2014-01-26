-module(spin_words).
-compile(export_all).

spin_words(String) ->
  Tokens = string:tokens(String, " "),
  join(lists:map(fun reverse_long_word/1, Tokens), " ").

reverse_long_word(Word) when length(Word) >= 5 ->
  lists:reverse(Word);
reverse_long_word(Word) ->
  Word.

join(List, Token) ->
  join(List, Token, "").

join([], _Token, Acc) ->
  Acc;
join([H|T], Token, "") ->
  join(T, Token, H);
join([H|T], Token, Acc) ->
  join(T, Token, Acc ++ Token ++ H).

test() ->
  "Hey wollef sroirraw" = spin_words("Hey fellow warriors"),
  "This is a test" = spin_words("This is a test"),
  "This is rehtona test" = spin_words("This is another test"),
  ok.
