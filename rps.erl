-module(rps).
-export([tournament/2]).


%% the Zip function pairs each moves 

zip([],X)->
    [];
zip(Y,[]) ->
    [];
zip([Y|Ys],[X|Xs]) ->
   [[Y,X] | zip(Ys,Xs)].


%%#################################################

%% means paper beats rock
%%       rock beats scissors
%%       scissors beats paper


beat(rock)->
    paper;
beat(scissors) ->
    rock;
beat(paper) ->
   scissors.

%% tournament gets the moves as two lists
%% result/2 returns a single list with the outcome
%%  of either 0, 1, -1 with in the list
%%
%% the lists:map is used to map each element in the zip pair to the fun result/1
%% the lists:foldr is used to add the values in the list ex: [-1,1,0,1] gives 1
  
tournament(X,Y)->
    who_won(lists:foldr(fun add/2,0, lists:map(fun result/1, zip(X,Y)))).

add(X,Y)->
    X+Y.

%% who_won/1 returns a draw if 0
%%           returns right won if the value is positive
%%           returns left won if the value is negative 

who_won(0)->
 'the match is draw';
who_won(X) ->
    case X > 0 of
       true->
	    'right won the match';
	false ->
             'left won the match'
   end.


%% result takes each pair say [rock, scissors] as X1 and X2
%% beat(rock) returns paper => paper beats rock
%% if the return by beat/1 equals the second value in the pair
%% means second value beats the first, if both value are same 0 is 
%% returned which  indicates a draw. Similiarly the other case.

result([X1,X2|Xs])->
   result(X1,X2).
result(X1,X1)->
0;
result(X1,X2) ->
   case beat(X1) == X2 of
     true ->
	   1;
       false ->
          -1

   end.


 
