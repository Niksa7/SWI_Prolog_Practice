man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

%Task11
father(X,Y):- parent(X,Y),man(X).
father(X):-parent(Y,X),man(Y),write(Y).

%Task12
sister(X,Y):-woman(X),parent(Z,X),parent(Z,Y),man(Z),X\=Y,
    woman(Y).
sisters(X):-woman(X),parent(Z,X),man(Z),parent(Z,Y),woman(Y),X\=Y,write(Y).

%Task13
grand_ma(X,Y):-woman(X),parent(X,Z),parent(Z,Y).
grand_mas(X):-parent(Z,X),parent(Y,Z),woman(Y),write(Y).

%Task14
%1 option
%grand_ma_and_son(X,Y):-woman(X),parent(X,Z),parent(Z,Y),man(Y),!.
%grand_ma_and_son(X,Y):-man(X),parent(Z,X),parent(Y,Z),woman(Y),!.
%2 option
grand_ma_and_son(X,Y):-
    woman(X),parent(X,Z),parent(Z,Y),man(Y),!;
    man(X),parent(Z,X),parent(Y,Z),woman(Y),!.

