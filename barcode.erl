-module(barcode).
-export([barcode/1,search/2,remove_bar_code/2,convert_to_amount/1,print_bill/1]).


%%======================================================================
%%----------Section: Get product list brought by the customer----------=
%%======================================================================

%%----------------------------------------
%%           BARCODE                     |
%%----------------------------------------
 %% accepts the list of barcodes         |
 %%---------------------------------------

barcode([])->
    [];
barcode([B|Bs]) ->
    D=[[4719, "Fish Fingers" , 121],[5643, "Nappies" , 1010],[3814, "Orange Jelly", 56],[1111, "Hula Hoops", 21],[1112, "Hula Hoops (Giant)", 133],[1234, "Dry Sherry, 1lt", 540]],
    barcode([B|Bs],D,[]).

barcode([],_D,Brought_products)->
  Brought_products;
barcode([B|Bs],D,Brought_products)->
    C_list=convert_to_amount(remove_bar_code(B,search(B,D))),
   print( barcode(Bs,D,Brought_products++[C_list])).


%%----------------------------------------
%%    CONVERT TO AMOUNT                  |
%%----------------------------------------
  %% converts the value to amount        |
  %%--------------------------------------

convert_to_amount([])->
    [];
convert_to_amount([E1,E2|_Es]) ->
    [E1,E2*0.01].




%%---------------------------------------
%%     extracts name and price
%%---------------------------------------

remove_bar_code(_I,[])->
    [];
remove_bar_code(I,[C]) ->
    New_list = C--[I],
    convert_to_atom(New_list).

convert_to_atom([])->
    [];
convert_to_atom([N1,N2|Ns]) ->
    [list_to_atom(N1),N2].




%%----------------------------------------
%%       SEARCH DATABASE                 |
%%----------------------------------------
  %% returns the list containing barcode |
  %% if no matched barcode returns       |
  %% empty list                          |
  %%--------------------------------------

search(_I,[])->
    [];
search(I,[D|Ds]) ->
    search_database(I,[D|Ds]).

search_database(_I,[])->
    [];
search_database(I,[D|Ds]) ->
            case lists:member(I,D) of
               true ->
                  [D];
	       false ->
		  search_database(I,Ds)
	    end.

%%==================================================================================
%%----End of section 1: the product list is in the list Brought_products-----------=
%%==================================================================================


print([])->
    [];
print([L|Ls]) ->
    print_bill(L),
    print(Ls).


print_bill([])->
    [];
print_bill([B1,B2|Bs]) ->
    io:format("~lp ~lp~n",[B1,B2]).
    

