.PHONY: all
all: run

.PHONY: run
run: bf
	./bf

.PHONY: test
test: bf
	gprolog --consult-file tests --entry-goal run_tests
	@echo "Tests Pass!"

bf: db/%.pro
	gplc ./db/bf.pro -o bf

.PHONY: inter
inter: db/%.pro
	gprolog --consult-file db/bf.pro

db/%.pro: scripts/generate-mons-db.awk data/r4-beyond-mons.tsv
	awk -f ./scripts/generate-mons-db.awk ./data/r4-beyond-mons.tsv
