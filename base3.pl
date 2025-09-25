% ----------- animal -----------
animal(X) :- mamifero(X).
animal(X) :- pajaro(X).
animal(b9).

% ----------- pajaro -----------
pajaro(paco).

% ----------- mamifero -----------
mamifero(X) :- leon(X).

% ----------- depredador -----------
depredador(X) :- leon(X).

% ----------- presa -----------
presa(f(X)) :- depredador(X).
presa(X) :- depredador(X).

% ----------- caza -----------
caza(X, f(X)) :- depredador(X).

% ----------- cazado -----------
cazado(X) :- presa(X).
cazado(X) :- vulnerable(X), depredador(X).
cazado(Y) :- leon(X), caza(X,Y).
cazado(leon) :- fail.   % restricción: nunca se permite que leon esté cazado

% ----------- vulnerable -----------
vulnerable(X) :- presa(X).

% ----------- leon -----------
leon(x13).
