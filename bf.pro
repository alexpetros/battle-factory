:- include('db/mons.pro').
:- include('db/sets.pro').
:- include('db/moves.pro').

bf(Team, Phrase) :-
  % Break the team down into Mons and their Set Numbers
  Team = [(X, Xnum), (Y, Ynum), (Z, Znum)],
  pokemon(X), pokemon(Y), pokemon(Z),

  % No duplicate mons allowed
  X \== Y, Y\== Z, X \== Z,

  set(X, Xnum, [MX1, MX2, MX3, MX4]),
  set(Y, Ynum, [MY1, MY2, MY3, MY4]),
  set(Z, Znum, [MZ1, MZ2, MZ3, MZ4]),

  Moves = [MX1, MX2, MX3, MX4, MY1, MY2, MY3, MY4, MZ1, MZ2, MZ3, MZ4]

  .

% team(X, Y, Z, Specialty) :-
%   pokemon(X), pokemon(Y), pokemon(Z),
%   X \== Y, Y\== Z, X \== Z,
%   (
%     (type(X, Specialty), type(Y, Specialty));
%     (type(X, Specialty), type(Z, Specialty));
%     (type(Z, Specialty), type(Y, Specialty))
%   ).
%

% bf([(X, Xnum), Y, Z], _), set(aerodactyl, Xnum, MX), member(earthquake, MX).
