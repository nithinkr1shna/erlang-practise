-module(take).
-export([take/2]).

%%---takes first N elements --
%%--- from a list-------------
%%--- usage-------------------
%%-- take(2,"hello")----------
%%--------"he"----------------

take(_,[]) ->
 [];
 take(0,_)->
 [];
take(N,[A|B])->
   take(N,[A|B],0).

take(N,A,_Count) when N > erlang:length(A) ->
    A;
take(N,[A|B],Count) when Count < N-1 ->
    [A|take(N,B,Count+1)];
take(_N,[A|_B],_Count) ->
    [A|[]].

    
 