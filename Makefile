.PHONY: all
all: run

.PHONY: run
run: db/*
	gprolog --consult-file bf.pro

db/mons.pro: scripts/generate-mons-db.awk data/r4-beyond-mons.tsv
	awk -f ./scripts/generate-mons-db.awk ./data/r4-beyond-mons.tsv > db/mons.pro
