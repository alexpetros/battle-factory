.PHONY: all
all: run

.PHONY: run
run: bf
	./bf

bf: db/%.pro
	gplc ./db/bf.pro -o bf

.PHONY: inter
inter: db/%.pro
	gprolog --consult-file db/bf.pro

db/%.pro: scripts/generate-mons-db.awk data/r4-beyond-mons.tsv
	awk -f ./scripts/generate-mons-db.awk ./data/r4-beyond-mons.tsv
