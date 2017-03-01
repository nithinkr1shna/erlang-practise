-module(maxpieces).
-export([pieces/1]).

pieces(0)->
 1;
pieces(N) when N >0 ->
 N+pieces(N-1).