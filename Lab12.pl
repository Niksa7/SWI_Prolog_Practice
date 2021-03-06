isPrime(X):-isPrime(X,2).
isPrime(X,X):-!.
isPrime(X,I):-Ost is X mod I, Ost\=0, I1 is I+1, isPrime(X,I1).

%Task11.1
%sum_pr_dig(+X,-Sum)
sum_pr_div(X,Sum):-sum_pr_div(X,2,Sum).
sum_pr_div(N,N,0):-!.
sum_pr_div(X,I,Sum):-I1 is I+1,sum_pr_div(X,I1,Sum1),
    (0 is X mod I,!, isPrime(I), Sum is Sum1+I; Sum is Sum1).

%Task11.2
%sum_pr_dig_Down(+X,-Sum)
sum_pr_div_Down(X,Sum):-sum_pr_div_Down(X,2,Sum,0).
sum_pr_div_Down(X,X,Sum,Sum):-!.
sum_pr_div_Down(X,I,Sum,CurSum):-
    0 is X mod I, isPrime(I), CurSum1 is CurSum+I, I1 is I+1, sum_pr_div_Down(X,I1,Sum,CurSum1),!;
    I1 is I+1, sum_pr_div_Down(X,I1,Sum,CurSum).

%Task12.
sum_of_Digit(0,0):-!.
sum_of_Digit(X,Sum):-X1 is X div 10, sum_of_Digit(X1,Sum1), X2 is X mod 10, Sum is Sum1+X2.

%mult_div_biggerdigit(+X,-Mult)
mult_div_biggerdigit(X,Mult):-mult_div_biggerdigit(X,2,Mult,1).
mult_div_biggerdigit(X,X,Mult,Mult):-!.
mult_div_biggerdigit(X,I,Mult,CurMult):-0 is X mod I, sum_of_Digit(X,Sum1),sum_of_Digit(I,Sum2),
    Sum1>Sum2, CurMult1 is CurMult*I, I1 is I+1, !, mult_div_biggerdigit(X,I1,Mult,CurMult1);
    I1 is I+1, mult_div_biggerdigit(X,I1,Mult,CurMult).

%Task13.
%Sum_Of_Proper_Div(+X,-Res).
sum_of_proper_div(X,Sum):- X1 is X-1,sum_of_proper_div(X,X1,Sum,0).
sum_of_proper_div(_,0,Sum,Sum):-!.
sum_of_proper_div(X,I,Sum,CurSum):-
    0 is X mod I, !, CurSum1 is CurSum+I, I1 is I-1, sum_of_proper_div(X,I1,Sum,CurSum1);
    I1 is I-1, sum_of_proper_div(X,I1,Sum,CurSum).

sum_friendly_numbers(Count):-sum_friendly_numbers(10000,10000,Count,0).
sum_friendly_numbers(0,0,Count,Count):-!.
sum_friendly_numbers(X,0,Count, CurCount):-
    X1 is X-1, sum_friendly_numbers(X1,X1,Count, CurCount).
sum_friendly_numbers(X,Y,Count,CurCount):-
    Y1 is Y-1,sum_of_proper_div(X,SumX),sum_of_proper_div(Y,SumY),
    (X is Y, CurCount1 is CurCount;
    (SumX is SumY, CurCount1 is CurCount+1;CurCount1 is CurCount)),
    sum_friendly_numbers(X,Y1,Count,CurCount1).

%Task14.
%countlist(+List,-Q).
lenght_list(List,Q):-lenght_list(List,Q,0).
lenght_list([],Q,Q):-!.
lenght_list([_|Tail],Q,CurQ):-CurQ1 is CurQ+1, lenght_list(Tail,Q,CurQ1).

%Предикат чтения
read_list(0,[]):-!.
read_list(N,[Head|Tail]):- read(Head),
    N1 is N-1, read_list(N1,Tail).

%Предикат записи
write_list([]):-!.
write_list([H|T]):-write(H),write_list(T).

%Task 15.1
index_of_max([H|T],Ind):-index_of_max(T,Ind,H,0,1).
index_of_max([],Ind,_,Ind,_):-!.
index_of_max([H|T],Ind,Max,MaxInd,CurInd):-
    (H>=Max, !, Max1 is H, MaxInd1 is CurInd;
    MaxInd1 is MaxInd, Max1 is Max),
    CurInd1 is CurInd+1, index_of_max(T,Ind,Max1,MaxInd1,CurInd1).

%count_after_max(+List,-Count)
count_after_max(List,Count):-index_of_max(List,Ind),lenght_list(List,Lenght),
    Count is Lenght-Ind-1.

%Task 15.2
index_of_min([H|T],Ind):-index_of_min(T,Ind,H,0,1).
index_of_min([],Ind,_,Ind,_):-!.
index_of_min([H|T],Ind,Min,MinInd,CurInd):-
    (H=<Min, !, Min1 is H, MinInd1 is CurInd;
    MinInd1 is MinInd, Min1 is Min),
    CurInd1 is CurInd+1, index_of_min(T,Ind,Min1,MinInd1,CurInd1).

%Task 15.12

concat([],List,List):-!.
concat([H|T],List,[H|List1]):-concat(T,List,List1).

el_before_min([H|T],List):-
    index_of_min([H|T],IndexMin),el_before_min([H|T],List,IndexMin,0,[]).
el_before_min(L1,List,IndexMin,IndexMin,L2):-concat(L1,L2,List),!.
el_before_min([H|T],List,IndexMin,CurInd,NowList):-
    NewIndex is CurInd+1,concat(NowList,[H],NewList),
    el_before_min(T,List,IndexMin,NewIndex,NewList).
