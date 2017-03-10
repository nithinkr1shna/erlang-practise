-module(hfo).
-export([double_all/1,circles/1,evensv1/1,sum/1,product/1]).


%%--------~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-----------
%%--------                 MAP                -----------
%%--------____________________________________-----------
%%-------------------------------------------------------    
%%=========================
%%           MAP          =
%%           ^^^          =
%% map(F,[])->            =
%%     [];                =
%% map(F,[X|Xs]) ->       =
%%    [F(X)| map(F,Xs)].  =
%%                        =
%%=========================


double_all(List)->
   lists:map(fun double/1, List). 

double(X)->
    2*X.

%%--------~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-----------
%%--------               FILTER               -----------
%%--------____________________________________-----------
%%-------------------------------------------------------    
%%====================================
%%           FILTER                  =
%%           ^^^^^^                  =
%% filter(P,[])->                    =
%%     [];                           =
%% filter(P,[X|Xs]) ->               =
%%      case P(X) of                 =
%%        true ->                    =
%%  	        [X | filter(P,Xs)];  =
%%        false ->                   =
%%              filter(P,Xs)         =
%%      end.                         =
%%                                   =
%%====================================

is_circle({circle,{_,_},_})->
    true;
is_circle({rectangle,{_,_},_,_}) ->
    false.


circles(Shapes)->
    lists:filter(fun is_circle/1, Shapes).


%%-------------------------------------------------
%% evens returns list of even number without filter
%% evensv1 returns list of even numbvers with filter

evens([]) -> [];
evens([X|Xs]) when X rem 2 == 0 ->
    [X | evens(Xs) ];
evens([_|Xs]) ->
    evens(Xs).



evensv1(List)->
    lists:filter(fun is_even/1, List).

is_even(X) when X rem 2 == 0 ->
    true;
is_even(X) ->
    false.

%%--------~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-----------
%%--------               REDUCE               -----------
%%--------____________________________________-----------
%%-------------------------------------------------------    
%%======================================================
%%       called as foldr in the lists module            =  
%%       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^            =
%% reduce(Combine, Start, [])->                         =
%%    Start;                                            =
%% reduce(Combine,Start, [X|Xs]) ->                     =
%%   Combine(X, reduce(Combine, Start, Xs)).            =
%%======================================================

sumV0([])->
    0;
sumV0([X|Xs]) ->
    X+sumV0(Xs).


sum(Xs)->
    lists:foldr(fun plus/2,0, Xs).

plus(X,Y)->
    X+Y.


product(X)->
    lists:foldr(fun pro/2,1,X).

pro(X,Y)->
    X*Y.

%%-----------------------------------------------------------


