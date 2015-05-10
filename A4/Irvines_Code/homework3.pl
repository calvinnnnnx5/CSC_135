%Irving Rodriguez
% Section 01
% Homework 3
% 12/12/14


%------------------------------------------Problem 1-----------------------------------------
inRange(X) :- X >= 0, X=<100.
average(X,Y,Z):- S is X+Y, Z is S/2.
strangeAverage(X,Y,Z):- inRange(X),inRange(Y),average(0,X,B),average(Y,100,C),average(C,B,Z).
%-------------------------------------------Problem 2----------------------------------------
countdown(0,[]).
countdown(X,[H|T]):- Y is X-1, H=X, countdown(Y,T).
%--------------------------------------------Problem 3----------------------------------------
parent(fred,mary).
parent(mary,jim).
parent(mary,greg).
parent(angie,terry).
parent(terry,marge).

related(X,Y):- parent(Y,X). 
related(X,Y):- parent(X,Y).
related(X,Y):- parent(X,Z), parent(Z,Y).
related(X,Y):- parent(Y,Z), parent(Z,X).
%--------------------------------------------Problem 4------------------------------------------
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

crypto(S,E,P,T,M,B,R):- mynum(S),mynum(E),mynum(P),mynum(T),mynum(M),mynum(B),mynum(R),
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


compare(X,Y):- X=Y.
subtract(X,Y,Result,CIn,COut) :- X2 is X-CIn, X2 < Y, X3 is X2+10, Result is X3-Y, COut is 1.
subtract(X,Y,Result,CIn,COut) :- X2 is X-CIn, X2 >= Y, Result is X2-Y, COut is 0.
%-----------------------------------------------Problem 5-------------------------------------------------

findNumber(1, [X|_], X).
findNumber(N, [_|Y], Z):- N1 is N - 1, findNumber(N1, Y, Z).
sumPicker([], _,0).
sumPicker([W|X],L,S):- sumPicker(X, L, SUM2),
						findNumber(W, L, NUM), 
						S is (NUM + S2), !.




