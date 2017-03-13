-module(composition).
-export([compose/2,test_compose_all/0,test_twice/0]).

compose(F,G)->
    fun(X) ->
	    G(F(X)) end.
add(X)->
    fun(Y)->
	    X+Y end.

times(X) ->
    fun(Y) ->
	     X*Y end.


id(X)->
    X.

compose_all([])->
    fun id/1;
compose_all(Fns) ->
   fun(X)->
     lists:foldl(fun (F, Acc) -> F(Acc) end,X,Fns) end.

test_compose_all() ->
    F1 = compose_all([]),
    42 = F1(42),
    F2 = compose_all([add(4)]),
    46 = F2(42),
    F3 = compose_all([add(1),times(2)]),
    86 = F3(42),
    F4 = compose_all([times(2),add(1)]),
    85 = F4(42),
    'compose_all tests PASSED'.




twice(G)->
    compose(G,G).
    

test_twice()->
    T1= twice(times(3)),
    18=T1(2),
    'passed'.


%% Define a function iterate that takes a number N and 
%% returns a function that takes a function and returns that
%% function iterated N times. When N is zero, it should return the
%% identity function (that is, the function that returns its argument unchanged).




iterate(0)->
   fun(_Y)->
       fun id/1
   end;
iterate(N) ->
     fun(Y)->
	     NF=iterate(N-1),   
	     compose(NF(Y),Y)
     end.


    





