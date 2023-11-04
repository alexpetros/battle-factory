:- include('mons.pro').
:- include('moves.pro').
:- include('utils.pro').

% True if Style is found at least X times in the list
meets_threshold(_, 0, X) :- is_list(X).
meets_threshold(Style, Count, [Head|Tail]) :-
  style(Style, Head),
  NextCount is Count - 1,
  meets_threshold(Style, NextCount, Tail).
meets_threshold(Style, Count, [Head|Tail]) :-
  \+style(Style, Head),
  meets_threshold(Style, Count, Tail).

style_threshold(flow, Moves) :- meets_threshold(flow, 2, Moves).
style_threshold(unpredictable, Moves) :- meets_threshold(unpredictable, 2, Moves).
style_threshold(weakening, Moves) :- meets_threshold(weakening, 2, Moves).
style_threshold(risk, Moves) :- meets_threshold(risk, 2, Moves).
style_threshold(endurance, Moves) :- meets_threshold(endurance, 3, Moves).
style_threshold(slow, Moves) :- meets_threshold(slow, 3, Moves).
style_threshold(preparation, Moves) :- meets_threshold(preparation, 3, Moves).

trainer_style(free, Moves) :- \+style_threshold(_, Moves), !.
trainer_style(flexible, Moves) :-
  setof(Type, style_threshold(Type, Moves), Matches),
  length(Matches, L),
  L > 2,
  !.
trainer_style(flow, Moves) :- style_threshold(flow, Moves), !.
trainer_style(unpredictable, Moves) :- style_threshold(unpredictable, Moves), !.
trainer_style(weakening, Moves) :- style_threshold(weakening, Moves), !.
trainer_style(risk, Moves) :- style_threshold(risk, Moves), !.
trainer_style(endurance, Moves) :- style_threshold(endurance, Moves), !.
trainer_style(slow, Moves) :- style_threshold(slow, Moves), !.
trainer_style(preparation, Moves) :- style_threshold(preparation, Moves), !.

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
  no_repeats(Types),

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

r8([], Team, Phrase) :-
  Team = [(X, _), (Y, _), (Z,_)],
  sort([X, Y, Z], [X, Y, Z]),
  r8(Team, Phrase).

r8([Lead], Team, Phrase) :-
  Team = [Lead, (Y, _), (Z, _)],
  sort([Y, Z], [Y, Z]),
  r8(Team, Phrase).

r8([Lead, Mid], Team, Phrase) :-
  Team = [Lead, Mid, (_, _)],
  r8(Team, Phrase).

