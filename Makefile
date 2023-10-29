.PHONY: all
all: run

.PHONY: run
run: bf.pro db/%.pro
	gprolog --consult-file bf.pro

db/%.pro: scripts/generate-mons-db.awk data/r4-beyond-mons.tsv
	awk -f ./scripts/generate-mons-db.awk ./data/r4-beyond-mons.tsv
