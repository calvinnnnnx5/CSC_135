% Konstantin Polyashenko
% A3

%------------------------------------------Problem 1 (spiralDown)-----------------------------------------%
/*
Implement a rule "spiralDown", that takes a positive integer n and
produces a list that counts down from n to 0, including negative
copies of the values along the way.

spiralDown(4,L) -> L=[4,-4,3,-3,2,-2,1,-1,0]
*/

spiralDown(0,[0]).
spiralDown(1,[1,-1,0]).

spiralDown(X,[X|Y]) :-
	X>1,
	Z is 0-X,
	spiralDown(Z,Y).

spiralDown(X,[X|Y]) :-
	X<1,
	Z is 0-X-1, spiralDown(Z,Y).

%------------------------------------------Problem 2 (secondCousinOnceRemoved)----------------------------
/*
Implement a rule "secondCousinOnceRemoved".
secondCousinOnceRemoved(gwen,harry) -> true

implimented the Second cousins once removed family tree from wikipedia
http://en.wikipedia.org/wiki/Cousin#Second_cousins_once_removed
*/

parent(adam, betty).
parent(agatha, betty).
parent(adam, charles).
parent(agatha, charles).

parent(bill, david).
parent(betty, david).

parent(charles, emma).
parent(corinda, emma).

parent(dawn, frank).
parent(david, frank).

parent(emma, gwen).
parent(eric, gwen).

parent(frank, harry).
parent(felicity, harry).

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
	parent(Z, Y),
	X \= Y.

cousinonceremoved(X, Y) :-
	cousin(Z, Y),
	child(X, Z).

secondcousin(X, Y) :-
	greatgrandparent(Z, X),
	greatgrandparent(Z, Y),
	\+sibling(X, Y),
	\+cousin(X, Y),
	X \= Y.

secondCousinOnceRemoved(H, G) :-
	child(H, F),
	secondcousin(F, G).

secondCousinOnceRemoved(H, G) :-
	child(H, F),
	secondcousin(F, G).

%------------------------------------------Problem 3 (prologCryptarothmetic)------------------------------
/*
Solve the following cryptarithmetic problem using Prolog:

      P I N G
      P O N G
    +   F U N
    ---------
    I G N I P

Each of the 7 different letters stands for a different digit.
The aim is to find a substitution of digits for the letters such
that the resulting sum is arithmetically correct.  Your program
should find ALL answers, that do not have leading zeros.

It should be possible to query your solution in this manner:
	?- crypto(P,I,N,G,O,F,U).

Your solution should then produce all of the combinations of
the digits that satisfy the addition problem above.
*/

value(1).
value(2).
value(3).
value(4).
value(5).
value(6).
value(7).
value(8).
value(9).
value(0).

solve(P,I,N,G,O,F,U):-
	I is 1,
  value(P),
  P >= 5,
  value(U),
	value(F),
  value(O),
  value(G),
  value(N),
  P\=I,P\=N,P\=G,P\=O,P\=F,P\=U,
	I\=N,I\=G,I\=O,I\=F,I\=U,
	N\=G,N\=O,N\=F,N\=U,
	G\=O,G\=F,G\=U,
	O\=F,O\=U,
	F\=U,
	P is (G+G+N) mod 10,
  C1 is truncate((G+G+N)/10),
  I is (C1+N+N+U) mod 10,
  C2 is truncate((C1+N+N+U)/10),
  N is (C2+I+O+F) mod 10,
  C3 is truncate((C2+I+O+F)/10),
  G is (C2+P+P) mod 10.

%------------------------------------------Problem 4(stepWidth)-------------------------------------------
/*
Implement a rule called "stepWith", that takes three parameters,
a list L and two integers i and j.  The rule returns true, if the
value i can be "stepped" into the value j, using only legal "steps".
The list L provides a set of integers that make up the legal steps.

stepWith([7,12,19],6,32) -> true
stepWith([7,12,19],6,31) -> false
*/

stepWith(L,I,J) :-
	Z is J-I,
	step(L,Z).

step(_,0).

step([F|L],Z) :-
	Z > 0,
	step(L,Z).

step([F|L],Z) :-
	Z > 0,
	Z1 is Z-F,
	step([F|L],Z1).

%------------------------------------------Problem 5(firstMidLast)----------------------------------------
/*
Given a list return the first, middle and last element of that list

firstMidLast([10,11,12,13,14,15,16],Answer). -> Answer = [10,13,16]
*/

firstMidLast([First|List], [First, Middle, Last]):-
  append(_, [Last], [First|List]),
  length(List, Length),
  NLength is Length >> 1,
  nth0(NLength, [First|List], Middle).
