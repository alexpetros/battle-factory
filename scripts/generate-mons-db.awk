BEGIN {
  FS = "\t"
}

NR == 1 { next }

{
  species = $3 == "Mr. Mime" ? "mr_mime" : tolower($3)
  number = $4

  mons[species] = tolower($1)
  sets[species, number] = sprintf("%s/%s/%s/%s\n", $7, $8, $9, $10)
}

END {
  for (mon in mons) {
    print "pokemon("mon")."
  }

  for (mon in mons) {
    split(mons[mon], current_types, " ")

    has_secondary_type = !match(current_types[2], "^\w*$")
    print "type("mon", "current_types[1]")."
    if (has_secondary_type == 1) {
      print "type("mon", "current_types[2]")."
    }
  }

}
