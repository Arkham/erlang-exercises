-module(roman_to_decimal).
-compile(export_all).

roman_to_decimal("") ->
  0;
roman_to_decimal(Str) when length(Str) == 1 ->
  case list_to_atom(Str) of
    'I' -> 1;
    'V' -> 5;
    'X' -> 10;
    'L' -> 50;
    'C' -> 100;
    'D' -> 500;
    'M' -> 1000;
    _ -> 0
  end;
roman_to_decimal(Str) ->
  case matches_composed(string:substr(Str, 1, 2)) of
    false -> roman_to_decimal(string:substr(Str, 1, 1))
             + roman_to_decimal(string:substr(Str, 2));
    Value -> Value + roman_to_decimal(string:substr(Str, 3))
  end.

matches_composed(Str) ->
  case list_to_atom(Str) of
    'IV' -> 4;
    'IX' -> 9;
    'XL' -> 40;
    'XC' -> 90;
    'CD' -> 400;
    'CM' -> 900;
    _ -> false
  end.

test() ->
  0 = roman_to_decimal(""),
  1 = roman_to_decimal("I"),
  7 = roman_to_decimal("VII"),
  9 = roman_to_decimal("IX"),
  13 = roman_to_decimal("XIII"),
  41 = roman_to_decimal("XLI"),
  1492 = roman_to_decimal("MCDXCII"),
  1900 = roman_to_decimal("MCM"),
  1986 = roman_to_decimal("MCMLXXXVI"),
  ok.
