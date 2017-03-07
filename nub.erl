-module(nub).
-export([nub/1,deleteall/2]).


%%--------NUB----------
%%-----Function--------
%%nub([2,4,1,3,3,1])---
%%------[2,4,1,3]------
%%---------------------

nub([])->
 [];
nub([X|Xs])->
 nub(X,Xs,[]).

nub(X,[],Lt)->
 Lt++[X];
nub(X,Xs,Lt) ->
 nub(deleteall(X,Xs),Lt ++ [X]).

nub([],Lt)->
 Lt;
nub([T|Ts],Lt)->
  nub(T,Ts,Lt).

%%----DELETEALL--------------
%%-takes 2 arguments---------
%% deletes all occurances of-
%%-a element rom the list----
%%---------------------------
%%--------Example------------
%%deleteall(2,[1,2,2,4,3,2])-
%%-------[1,4,3]-------------
%%---------------------------



deleteall(A,[B|Bs])->
  deleteall(A,B,Bs,[]);
deleteall(A,[])->
  [].



deleteall(A,B,Bs,L) when A == B ->
  deleteall(A,Bs,L);
deleteall(A,B,Bs,L) when A /= B ->
  deleteall(A,Bs,L++[B]).

deleteall(A,[Bs|Bss],L) ->
  deleteall(A,Bs,Bss,L);
deleteall(_A,[],L)->
 L.
    
