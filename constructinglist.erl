-module(constructinglist).
-export([double/1,evens/1,median/1]).

%%----------------------
double([])->
[];

double([A|B])->
 [A*2|double(B)].

%%-----------------------

evens([])->
[];
evens([A|B]) when A rem 2 == 0->
 [A|evens(B)];
evens([A|B])->
 evens(B).

%%--------------------------

median(X)->
 OrderedList=lists:sort(X),
 Length = erlang:length(OrderedList),
 med(OrderedList,Length).

med(A,B) when B rem 2 /=0 ->
 lists:nth((B div 2)+1, A);
med(A,B)->
 (lists:nth((B div 2),A)+ lists:nth((B div 2)+1,A) )/2.
 

 


