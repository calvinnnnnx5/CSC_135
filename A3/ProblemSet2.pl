
%------------------------------------------Problem 1-----------------------------------------
/*Implement a rule "strangeAverage", that takes two positive integers i and j,
that are each between 0 and 100, and determines their strangeAverage.
The strangeAverage is defined as the average of four values:
0, 100, i, and j.
For example:  strangeAverage(12,6,SAverage).
should return SAverage = 29.5, because (0+100+12+6)/4 = 29.5.*/

inRange(X) :-
	X >= 0,
	X=<100.

average(X,Y,Z) :-
	S is X+Y,
	Z is S/2.

strangeAverage(X,Y,Z) :-
	inRange(X),
	inRange(Y),
	average(0,X,B),
	average(Y,100,C),
	average(C,B,Z).

%-------------------------------------------Problem 2----------------------------------------
/*Implement a rule "countdown", that takes a positive integer, and
produces a list that starts at that number and counts down to 1.
For example:  countdown(5,[5,4,3,2,1]) should return TRUE,
and countdown(5,X) should produce X=[5,4,3,2,1].*/

countdown(0,[]).
countdown(X,[H|T]) :-
	Y is X-1,
	H=X,
	countdown(Y,T).

%--------------------------------------------Problem 3----------------------------------------
/*Implement a rule "related", that returns true if Prolog can prove
that the first person is "related to" the second person.
The only facts that are available are of the form parent(p,c),
indicating that the p is a parent of c.
For example, suppose there exist facts:
	parent(fred,mary).
  parent(mary,jim).
  parent(mary,greg).
  parent(angie,terry).
  parent(terry,marge).
Then the query:  related(greg,fred) should return TRUE,
but the query:  related(greg,marge) should return FALSE.
Note that it should not matter what order the parameters are given.
That is, both related(fred,greg) and related(greg,fred) should return TRUE.*/

parent(fred,mary).
parent(mary,jim).
parent(mary,greg).
parent(angie,terry).
parent(terry,marge).

related(X,Y) :-
	parent(Y,X).
related(X,Y) :-
	parent(X,Y).
related(X,Y) :-
	parent(X,Z),
	parent(Z,Y).
related(X,Y) :-
	parent(Y,Z),
	parent(Z,X).

%--------------------------------------------Problem 4------------------------------------------
/*Here is a cryptarithmetic problem published in 1933 in a journal
called "Sphinx":

	S E P T E M B R E
- E R B M E T P E S
-------------------
  M P P B R P S S M

Use generate-and-test.  An appropriate query would be of the form:
?- crypto(S,E,P,T,M,B,R). which would return all of the combinations
of assignments for S,E,P,etc. that satisfy the subtraction problem above.
Make sure you never let S=E, or P=T, etc... all of the distinct letters
have to stand for distinct digits.*/

mynum(0).
mynum(1).
mynum(2).
mynum(3).
mynum(4).
mynum(5).
mynum(6).
mynum(7).
mynum(8).
mynum(9).

crypto(S,E,P,T,M,B,R) :-
	mynum(S),mynum(E),mynum(P),mynum(T),mynum(M),mynum(B),mynum(R),
	S\=E,S\=P,S\=T,S\=M,S\=B,S\=R,
	E\=P,E\=T,E\=M,E\=B,E\=R,
	P\=T,P\=M,P\=B,P\=R,
	T\=M,T\=B,T\=R,
	M\=B,M\=R,
	B\=R,
	C1 is 0,
	subtract(E,S,M1,C1,C2), subtract(R,E,S1,C2,C3), subtract(B,P,S2,C3,C4), subtract(M,T,P1,C4,C5), subtract(E,E,R1,C5,C6),
  subtract(T,M,B1,C6,C7), subtract(P,B,P2,C7,C8), subtract(E,R,P3,C8,C9), subtract(S,E,M2,C9, C10), C10=0,
  compare(S1,S),compare(S2,S),compare(R1,R),compare(M1,M),compare(B1,B),compare(M2,M),compare(P1,P),compare(P2,P),compare(P3,P).

compare(X,Y) :-
	X=Y.
subtract(X,Y,Result,CIn,COut) :-
	X2 is X-CIn, X2 < Y,
	X3 is X2+10,
	Result is X3-Y,
	COut is 1.
subtract(X,Y,Result,CIn,COut) :-
	X2 is X-CIn,
	X2 >= Y,
	Result is X2-Y,
	COut is 0.

%-----------------------------------------------Problem 5-------------------------------------------------
/*Convert "sumPicker" from the homework#2 Scheme assignment, to Prolog.
Of course, you will need to add an additional parameter to hold the answer.
For example,
	sumPicker([2,4,7],[8,3,2,9,1,1,6,6,7],Answer). should respond:
  Answer = 18*/

findNumber(1, [X|_], X).
findNumber(N, [_|Y], Z) :-
	N1 is N - 1,
sumPicker([], _,0).
sumPicker([W|X],L,S) :-
	sumPicker(X, L, SUM2),
	findNumber(W, L, NUM),
	S is (NUM + S2), !.
