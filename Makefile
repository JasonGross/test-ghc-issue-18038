EXES := unsaturated_solinas unsaturated_solinas2
TIMER := command time -f "$@ (real: %e, user: %U, sys: %S, mem: %M ko)"

all: $(EXES)
.PHONY: all

$(EXES) : % : %.hs
	$(TIMER) perf sched record ghc -o $@ $< +RTS -s -RTS -v3
	perf sched latency

unsaturated_solinas2.hs: unsaturated_solinas.hs
	cp $< $@
