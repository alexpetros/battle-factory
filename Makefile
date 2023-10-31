.PHONY: all
all: run

.PHONY: run
run: bf
	./bf

bf: src/mons.pro src/bf.pro
	gplc ./src/bf.pro -o bf

src/mons.pro: scripts/generate-mons-db.awk data/r4-beyond-mons.tsv
	awk -f ./scripts/generate-mons-db.awk ./data/r4-beyond-mons.tsv > src/mons.pro

.PHONY: test
test:
	gprolog --consult-file src/tests --entry-goal run_tests
	@echo "Tests Pass!"

.PHONY: inter
inter: src/mons.pro src/bf.pro
	gprolog --consult-file src/bf.pro
