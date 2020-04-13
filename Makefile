EXES := unsaturated_solinas unsaturated_solinas2
TIMER := command time -f "$@ (real: %e, user: %U, sys: %S, mem: %M ko)"

all: $(EXES)
.PHONY: all

$(EXES) : % : %.hs
	$(TIMER) ghc -o $@ $< +RTS -s -RTS -v3

unsaturated_solinas2.hs: unsaturated_solinas.hs
	cp $< $@
