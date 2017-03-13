-module(rpse).
-export([play/1,echo/1,play_two/3,rock/1,no_repeat/1,const/1,enum/1,cycle/1,rand/1,val/1,tournament/2]).


%
% play one strategy against another, for N moves.
%

play_two(StrategyL,StrategyR,N) ->
    play_two(StrategyL,StrategyR,[],[],N,0).

% tail recursive loop for play_two/3
% 0 case computes the result of the tournament

% FOR YOU TO DEFINE
% REPLACE THE dummy DEFINITIONS

play_two(_,_,PlaysL,PlaysR,0,Acc) ->
    io:format("strategy vs strategy -Game ended~n"),
    decisionSvS(Acc);

play_two(StrategyL,StrategyR,PlaysL,PlaysR,N,Acc) ->
    RightMove = StrategyL(PlaysR),
    LeftMove = StrategyR(PlaysR),
    Match_result= outcome(result(LeftMove, RightMove)),
    Acc1 = Acc+ Match_result,
    play_two(StrategyL,StrategyR,PlaysL,PlaysR,N-1,Acc1).

%
% interactively play against a strategy, provided as argument.
%

play(Strategy) ->
    io:format("Rock - paper - scissors~n"),
    io:format("Play one of rock, paper, scissors, ...~n"),
    io:format("... r, p, s, stop, followed by '.'~n"),
    play(Strategy,[],0).

% tail recursive loop for play/1

play(Strategy,Moves,Acc) ->
    {ok,P} = io:read("Play: "),
    Play = expand(P),
    case Play of
	stop ->
	    io:format("Stopped~n"),
            decision(Acc);
	_    ->
	    Result = result(Play,Strategy(Moves)),
            Acc1 = Acc+outcome(Result),
	    io:format("Result: ~p~n",[Result]),
	    play(Strategy,[Play|Moves],Acc1)
    end.

%
% auxiliary functions
%
 
%result decision for game strategy vs strategy defined by play_two/3

decisionSvS(0)->
    'Result :  The game is a draw';
decisionSvS(A) when A > 0->
    'Result :  Strategy 1 won';
decisionSvS(A) when A<0 ->
    'Result :  Strategy 2 won'.


%result decision for game play/1

decision(0)->
    'The game is a draw';    
decision(A) when A > 0 ->
     '**********The Player won*********';
decision(A) when A < 0 ->
    'The Machine won'.



% transform shorthand atoms to expanded form
    
expand(r) -> rock;
expand(p) -> paper;		    
expand(s) -> scissors;
expand(X) -> X.

% result of one set of plays

result(rock,rock) -> draw;
result(rock,paper) -> lose;
result(rock,scissors) -> win;
result(paper,rock) -> win;
result(paper,paper) -> draw;
result(paper,scissors) -> lose;
result(scissors,rock) -> lose;
result(scissors,paper) -> win;
result(scissors,scissors) -> draw.

% result of a tournament

tournament(PlaysL,PlaysR) ->
    lists:sum(
      lists:map(fun outcome/1,
		lists:zipwith(fun result/2,PlaysL,PlaysR))).

outcome(win)  ->  1;
outcome(lose) -> -1;
outcome(draw) ->  0.

% transform 0, 1, 2 to rock, paper, scissors and vice versa.

enum(1) ->
    rock;
enum(2) ->
    paper;
enum(3) ->
    scissors.

val(rock) ->
    1;
val(paper) ->
    2;
val(scissors) ->
    3.

% give the play which the argument beats.

beats(rock) ->
    scissors;
beats(paper) ->
    rock;
beats(scissors) ->
    paper.

%
% strategies.
%
echo([]) ->
     paper;
echo([Last|_]) ->
    Last.

rock(_) ->
    rock.



% FOR YOU TO DEFINE
% REPLACE THE dummy DEFINITIONS

no_repeat([]) ->
    enum(rand:uniform(3));
no_repeat([X|_]) ->
    removes_last_move(X).

removes_last_move(X)->
    N= [rock,paper,scissors]--[X],
    lists:nth(rand:uniform(length(N)), N).

const(Play) ->
    dummy.

cycle(Xs) ->
    lists:nth(1 + length(Xs) rem 3, [rock,paper,scissors]).

 
rand([]) ->
    enum(rand:uniform(3));
rand([X|Xs])->
    enum(rand:uniform(3)).

