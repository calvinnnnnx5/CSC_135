%capital X is like a placeholder
human(irving). % itrving is a human
human(adrian). %spacing matters in between defenitions
mammal(X) :- human(X). %any human is a mammal rule:- facts




friends(irving,yonas).
friends(yonas,adrian).
friends(adrian,brian).
circle(X,Y):- friends(X,Z), friends(Z,Y). %



animal(rover).
animal(fido).
animal(growler).
mean(rover).
mean(growler).
big(rover).
big(growler).
big(lassie).
unsafe(X):- animal(X), mean(X), big(X).
unsafe(X):- sharpteeth(X).
