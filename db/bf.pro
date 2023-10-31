:- include('db/mons.pro').
:- include('db/sets.pro').
:- include('db/moves.pro').

% True if List contains all the items in the first parameter
contains_all([], _).
contains_all([Head|Tail], List) :-
  member(Head, List),
  contains_all(Tail, List).

% True if Style is found at least X times in the list
style_matches(_, 0, X) :- is_list(X).
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
trainer_style(free, _).

% trainer_style(free, Moves) :-
%   \+trainer_style(flow, Moves),
%   \+trainer_style(unpredictable, Moves),
%   \+trainer_style(weakening, Moves),
%   \+trainer_style(risk, Moves),
%   \+trainer_style(endurance, Moves),
%   \+trainer_style(slow, Moves),
%   \+trainer_style(preparation, Moves).

moves_seen(Mon, Num, Moves) :-
  set(Mon, Num, PossibleMoves),
  contains_all(Moves, PossibleMoves).

% Monotype mons
monotype(Mon) :-
  pokemon(Mon),
  findall(Type, type(Mon, Type), List),
  length(List, N),
  N = 1.

% List the types of a team
types([], []).
types([(LeadMon, _)|Rest], Types) :-
  pokemon(LeadMon),
  findall(Type, type(LeadMon, Type), LeadTypes),
  types(Rest, TailTypes),
  append(LeadTypes, TailTypes, Types).

legal(Team) :-
  % Break the team down into Mons and their Set Numbers
  Team = [(X, _), (Y, _), (Z, _)],
  pokemon(X), pokemon(Y), pokemon(Z),
  % No duplicate mons allowed
  X \== Y, Y\== Z, X \== Z.

r8(Team, Phrase) :-
  % Break the team down into Mons and their Set Numbers
  Team = [(X, Xnum), (Y, Ynum), (Z, Znum)],
  legal(Team),
  types(Team, Types),
  fd_all_different(Types),

  R8_ILLEGAL_MONS = [(dragonite, _), (tyranitar, _), (articuno, 5), (articuno, 6),
    (zapdos, 5), (zapdos, 6), (moltres, 5), (moltres, 6), (raikou, 5), (raikou, 6),
    (entei, 5), (entei, 6), (suicune, 5), (suicune, 6)],
  \+member((X, Xnum), R8_ILLEGAL_MONS),
  \+member((Y, Ynum), R8_ILLEGAL_MONS),
  \+member((Z, Znum), R8_ILLEGAL_MONS),

  set(X, Xnum, [MX1, MX2, MX3, MX4]),
  set(Y, Ynum, [MY1, MY2, MY3, MY4]),
  set(Z, Znum, [MZ1, MZ2, MZ3, MZ4]),

  Moves = [MX1, MX2, MX3, MX4, MY1, MY2, MY3, MY4, MZ1, MZ2, MZ3, MZ4],
  trainer_style(Phrase, Moves)
  .

% r8(Team, Phrase, Type) :-
