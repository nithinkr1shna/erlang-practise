-module(factorial).
-export([fact/1]).

fact(0) ->
 1;
fact(N) when N > 0 ->
 fact(N-1)*N.  