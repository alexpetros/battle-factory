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

% Monotype mons
monotype(Mon) :-
  pokemon(Mon),
  findall(Type, type(Mon, Type), List),
  length(List, N),
  N = 1.


delete_solo_elements([], []).
delete_solo_elements([Head|Tail], Result) :-
  \+member(Head, Tail),
  delete_solo_elements(Tail, TailResult),
  Result = TailResult.
delete_solo_elements([Head|Tail], Result) :-
  member(Head, Tail),
  delete_solo_elements(Tail, TailResult),
  append([Head], TailResult, Result).


plurality_atom([], none).
plurality_atom([Atom], Atom).
plurality_atom(List, Atom) :-
  length(List, L),
  L > 1,
  delete_solo_elements(List, Result),
  plurality_atom(Result, Atom).

