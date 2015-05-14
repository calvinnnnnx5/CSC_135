% Konstantin Polyashenko
% A3

%------------------------------------------Problem 1 (spiralDown)-----------------------------------------
/*
Implement a rule "spiralDown", that takes a positive integer n and
produces a list that counts down from n to 0, including negative
copies of the values along the way.
spiralDown(4,L) -> L=[4,-4,3,-3,2,-2,1,-1,0]
/*

spiralDown(-1,[]).

spiralDown(N,[H|L]) :-
	Y is N-1,
	H=N,
	spiralDown(Y,L).

%------------------------------------------Problem 2 (secondCousinOnceRemoved)----------------------------
/*
Implement a rule "secondCousinOnceRemoved".
secondCousinOnceRemoved(scott,gail) -> true
  if gail is scott is second cousin, once removed.

Second Cousin -> a child of ones parents first cousin
Second Cousin Once Removed -> a child of ones second cousin.
                              OR
                              one is parents second cousin.
/*

%parents
%parent(X, Y) means X is parent of Y
parent(John,Rob).
parent(Jill,Rob).
parent(John,Julie).
parent(Jill,Julie).
parent(Rob,Bill).
parent(Liz,Bill).
parent(Phil,Bob).
parent(Julie,Bob).
parent(Bill, Mark).
parent(Arya, Mark).
parent(Bob, Elon).
parent(Elaine, Elon).
parent(Elon, Molly).
parent(Jade, Molly).

child(X, Y) :-
	parent(Y, X).

grandparent(X, Y) :-
	parent(X, Z),
	parent(Z, Y).

greatgrandparent(X, Y) :-
	parent(P, Y),
	grandparent(X, P).

cousin(X, Y) :-
	grandparent(Z, X),
	grandparent(Z, Y),
	\+sibling(X, Y),
  X \= Y.

sibling(X, Y) :-
	parent(Z, X),
	parent(Z, Y)
	X \= Y.

secondcousinonceremoved(X, Y) :-
	%cousin once removed
	cousin(Z, Y),
	child(X, Z),
	%second cousin
	greatgrandparent(Z, X),
  greatgrandparent(Z, Y),
  \+sibling(X, Y),
  \+cousin(X, Y),
  X \= Y.


%------------------------------------------Problem 3 (prologCryptarothmetic)------------------------------

%------------------------------------------Problem 4(stepWidth)-------------------------------------------

%------------------------------------------Problem 5(firstMidLast)----------------------------------------
