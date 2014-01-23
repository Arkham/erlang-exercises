-module(basic_calculator).
-compile(export_all).

calculate(Num1, "+", Num2) ->
  Num1 + Num2;
calculate(Num1, "-", Num2) ->
  Num1 - Num2;
calculate(Num1, "*", Num2) ->
  Num1 * Num2;
calculate(_, "/", 0) ->
  null;
calculate(Num1, "/", Num2) ->
  Num1 / Num2;
calculate(_, _, _) ->
  null.

test_calculate() ->
  11.2 = calculate(3.2,"+", 8),
  -4.8 = calculate(3.2,"-", 8),
  0.4 = calculate(3.2,"/", 8),
  25.6 = calculate(3.2,"*", 8),
  -3 = calculate(-3,"+", 0),
  -3 = calculate(-3,"-", 0),
  null = calculate(-3,"/", 0),
  0 = calculate(-3,"*", 0),
  null = calculate(-3,"w", 0).
