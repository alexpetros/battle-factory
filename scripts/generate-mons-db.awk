BEGIN {
  FS = "\t"
}

NR == 1 { next }

{
  species = $3 == "Mr. Mime" ? "mr_mime" : tolower($3)
  number = $4 == "X" ? 10 : $4

  types[species] = tolower($1)
  moves[species, number, 1] = $7
  moves[species, number, 2] = $8
  moves[species, number, 3] = $9
  moves[species, number, 4] = $10
}

END {
  for (mon in types) {
    print "pokemon("mon")." > "db/mons.pro"
  }

  for (mon in types) {
    split(types[mon], current_types, " ")

    has_secondary_type = !match(current_types[2], "^\w*$")
    print "type("mon", "current_types[1]")." > "db/mons.pro"
    if (has_secondary_type == 1) {
      print "type("mon", "current_types[2]")." > "db/mons.pro"
    }
  }

  for (mon in moves) {
    split(mon, separate, SUBSEP)
    species = separate[1]
    num = separate[2]
    move = moves[mon]
    printf("move(%s, %s, '%s').\n", species, num, tolower(move)) > "db/sets.pro"
  }
}
