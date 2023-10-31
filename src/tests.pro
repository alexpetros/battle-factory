:- include('bf.pro').

test_suite :-
  pokemon(dragonite),
  halt(0)
  .

run_tests :-
  test_suite;
  halt(1).
