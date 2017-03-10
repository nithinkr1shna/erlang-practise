-module(hof_practice2).
-export([zip/2,zip_with/3,zip_withv2/2,zipv2/2]).


%% Define a function zip/2 that “zips together” pairs of elements
%% from two lists like this:
%% zip([1,3,5,7], [2,4]) = [ {1,2}, {3,4} ]


zip([],X)->
    [];
zip(Y,[]) ->
    [];
zip([Y|Ys],[X|Xs]) ->
   [{Y,X} | zip(Ys,Xs)].



%% Define a function zip_with/3 that “zips together” 
%% pairs of elements from two lists using the function
%% in the first argument, like this:

%% zip_with(fun(X,Y) -> X+Y end, [1,3,5,7], [2,4]) = [ 3, 7 ]

zip_with(F,[],_)->
    [];
zip_with(F,_,[]) ->
    [];
zip_with(F,[X|Xs],[Y|Ys]) ->
  [F(X,Y)| zip_with(F,Xs,Ys)].



%%Re-define the function zip_with/3 using zip and lists:map.

zip_withv2(X,Y)->
    lists:map(fun add/1,zip(X,Y)).

add({X,Y})->
    X+Y.


%%Re-define zip/2 using zip_with/3.

zipv2(X,Y)->
    zip_with(fun to_tuple/2,X,Y).
    

to_tuple(X,Y)->
   {X,Y}.

