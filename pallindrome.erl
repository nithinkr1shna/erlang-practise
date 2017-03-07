-module(pallindrome).
-export([pallindrome/1]).

pallindrome([])->
 true;
pallindrome(X) ->
 S1= re:replace(X, "[^A-Za-z0-9]", "", [global, {return, list}]),
 S2= lists:reverse(S1),
 pallindromicity(S1,S2).

pallindromicity(S1,X) when S1== X ->
 true;
pallindromicity(_S1,_X)->
 false.



 

