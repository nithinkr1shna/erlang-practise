-module(pattern).
-export([xOr1/2,xOr2/2,xOr3/2,maxThree/3,howManyEqual/3]).

xOr1(A,B) ->
 not(A==B).

xOr2(A,B) ->
 A=/=B.

xOr3(A,B) ->
 (not A and B)or(not B and A).

xOr4(A,B)->
  

maxThree(A,B,C) ->
 max(A,max(B,C)).

howManyEqual(A,A,A) ->
 3;
howManyEqual(A,_,A) ->
 2;
howManyEqual(A,A,_) ->
 2;
howManyEqual(_,A,A) ->
 2;
howManyEqual(_,_,_) ->
 0.
 