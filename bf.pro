:- include('db/mons.pro').
:- include('db/sets.pro').
:- include('db/moves.pro').

% trainer_style(Phrase, Moves) :-

% True if List contains all the items in the first parameter
contains_all([], _).
contains_all([Head|Tail], List) :-
  member(Head, List),
  contains_all(Tail, List).

% True if Style is found at least X times in the list
style_matches(_, Count, []) :- Count =< 0.
style_matches(Style, Count, [Head|Tail]) :-
  style(Style, Head),
  NextCount is Count - 1,
  style_matches(Style, NextCount, Tail).
style_matches(Style, Count, [Head|Tail]) :-
  \+style(Style, Head),
  style_matches(Style, Count, Tail).

% TODO add "flexible" style
trainer_style(flow, Moves) :- style_matches(flow, 2, Moves), !.
trainer_style(unpredictable, Moves) :- style_matches(unpredictable, 2, Moves), !.
trainer_style(weakening, Moves) :- style_matches(weakening, 2, Moves), !.
trainer_style(risk, Moves) :- style_matches(risk, 2, Moves), !.
trainer_style(endurance, Moves) :- style_matches(endurance, 3, Moves), !.
trainer_style(slow, Moves) :- style_matches(slow, 3, Moves), !.
trainer_style(preparation, Moves) :- style_matches(preparation, 3, Moves), !.

trainer_style(free, Moves) :-
  \+trainer_style(flow, Moves),
  \+trainer_style(unpredictable, Moves),
  \+trainer_style(weakening, Moves),
  \+trainer_style(risk, Moves),
  \+trainer_style(endurance, Moves),
  \+trainer_style(slow, Moves),
  \+trainer_style(preparation, Moves).

moves_seen(Mon, Num, Moves) :-
  set(Mon, Num, PossibleMoves),
  contains_all(Moves, PossibleMoves).

bf(Team, Phrase) :-
  % Break the team down into Mons and their Set Numbers
  Team = [(X, Xnum), (Y, Ynum), (Z, Znum)],
  pokemon(X), pokemon(Y), pokemon(Z),

  % No duplicate mons allowed
  X \== Y, Y\== Z, X \== Z,

  set(X, Xnum, [MX1, MX2, MX3, MX4]),
  set(Y, Ynum, [MY1, MY2, MY3, MY4]),
  set(Z, Znum, [MZ1, MZ2, MZ3, MZ4]),

  Moves = [MX1, MX2, MX3, MX4, MY1, MY2, MY3, MY4, MZ1, MZ2, MZ3, MZ4],
  trainer_style(Phrase, Moves)
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

