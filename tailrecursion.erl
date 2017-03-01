-module(tailrecursion).
-export([fib/1, perfect/1]).

fib(N) ->
 fib(N,0,1).
 
fib(N,P,T) when N >0 ->
  fib(N-1,T,P+T);

fib(0,P,_T)->
 P.

perfect(N) ->
  perfect(N, N-1, 0).

perfect(N,0, Sum) ->
  N==Sum;

perfect(N,Divisor,Sum) when N rem Divisor  == 0 ->
  perfect(N,Divisor-1, Divisor+Sum);
perfect(N, Divisor, Sum) ->
  perfect(N,Divisor-1,Sum).
