% True if every member of the list is distinct
no_repeats([]).
no_repeats([Head|Tail]) :-
  \+member(Head, Tail),
  no_repeats(Tail).

% True if List contains all the items in the first parameter
contains_all([], _).
contains_all([Head|Tail], List) :-
  member(Head, List),
  contains_all(Tail, List).

