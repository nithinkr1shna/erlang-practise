-module(list).
-export([product/1,product/2,maxlist/1,maxlist/2,maxlist/3]).

%%----PRODUCT------------
%%product([1,2,3])-------
%%-product([1,2,3],1)----
%%--product([2,3],1*1)---
%%---product([3]),2*1)---
%%---product([],3*2)-----
%%----product([],6)------
%%-------6---------------

product(X)->
 product(X,1).

product([],S) ->
S;
product([A|B],S) ->
 product(B,A*S).

%%----MAX------------------
%%maxlist([1,2,3])---------
%%-maxlist([1,2,3],0)------
%%---maxlist([[2,3],1,0])--
%%----maxlist([2,3],1)-----
%%-----maxlist([3],2,1)----
%%------maxlist([3],2)-----
%%-------maxlist([],3,2)---
%%--------maxlist([],3)----
%%-----------3-------------

maxlist(X)->
 maxlist(X,0).

maxlist([X|Xs],MAX)->
 maxlist(Xs,X,MAX);
maxlist([],MAX)->
MAX.

maxlist(Xs,X,MAX) when X > MAX ->
 maxlist(Xs,X);
maxlist(Xs,X,MAX) ->
 maxlist(Xs,MAX).

