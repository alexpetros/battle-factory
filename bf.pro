:- include('db/mons').
:- include('db/sets').
:- include('db/styles').

team(X, Y, Z) :-
  pokemon(X), pokemon(Y), pokemon(Z),
  X \== Y, Y\== Z, X \== Z.

team(X, Y, Z, Specialty) :-
  pokemon(X), pokemon(Y), pokemon(Z),
  X \== Y, Y\== Z, X \== Z,
  (
    (type(X, Specialty), type(Y, Specialty));
    (type(X, Specialty), type(Z, Specialty));
    (type(Z, Specialty), type(Y, Specialty))
  ).
