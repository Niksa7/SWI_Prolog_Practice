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
countlist(List,Q):-countlist(List,Q,0).
countlist([],Q,Q):-!.
countlist([_|Tail],Q,CurQ):-CurQ1 is CurQ+1, countlist(Tail,Q,CurQ1).
