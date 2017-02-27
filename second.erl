-module(second).
-export([size_of_hypotenuse/2,perimeter/2]).

size_of_hypotenuse(X,Y) ->
  math:sqrt(first:square(X)+first:square(Y)).

perimeter(X,Y) ->
  size_of_hypotenuse(X,Y)+X+Y.

