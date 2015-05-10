person(X) :- mother_of(Y,X).
person(Y) :- mother_of(Y,X).
mother_of(mary, carmen).
mother_of(mary, alexander).
mother_of(mary, andre).