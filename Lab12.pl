isPrime(X):-isPrime(X,2).
isPrime(X,X):-!.
isPrime(X,I):-Ost is X mod I, Ost\=0, I1 is I+1, isPrime(X,I1).

%Task11
%sum_pr_dig(+X,-Sum)
sum_pr_dig(X,Sum):-sum_pr_dig(X,2,Sum).
sum_pr_dig(N,N,0):-!.
sum_pr_dig(X,I,Sum):-I1 is I+1,sum_pr_dig(X,I1,Sum1),
    (0 is X mod I,!, isPrime(I), Sum is Sum1+I; Sum is Sum1).
