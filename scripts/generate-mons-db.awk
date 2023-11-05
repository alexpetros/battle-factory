BEGIN {
  FS = "\t"
  print "% THIS IS A GENERATED FILE"
  print "% It's created by parsing the battle factory TSVs with an awk script."
}

NR == 1 { next }

{
  species = $3 == "Mr. Mime" ? "mr_mime" : tolower($3)
  number = $4 == "X" ? 10 : $4

  types[species] = tolower($1)
  sets[species, number] = sprintf("'%s', '%s', '%s', '%s'",
      tolower($7), tolower($8), tolower($9), tolower($10))
}

END {
  for (mon in types) {
    print "pokemon("mon")."
  }
  print ""

  for (mon in types) {
    split(types[mon], current_types, " ")

    has_secondary_type = !match(current_types[2], "^\w*$")
    print "type("mon", "current_types[1]")."
    if (has_secondary_type == 1) {
      print "type("mon", "current_types[2]")."
    }
  }
  print ""

  for (mon in sets) {
    split(mon, separate, SUBSEP)
    species = separate[1]
    num = separate[2]
    moves = sets[mon]
    printf("set(%s, %s, [%s]).\n", species, num, moves)
  }
  print ""
}
