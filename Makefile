.PHONY: all clean

DIRS = $(wildcard TP*/)
PDFS = $(addsuffix .pdf,$(addprefix out/,$(DIRS:%/=%)))

all: out $(PDFS)

out:
	mkdir -p $@

out/TP%.pdf: TP%/ejercicios.tex
	xelatex -jobname=$(subst /ejercicios.tex,,$<) -output-directory=$(CURDIR)/out $<

clean:
	rm -rf TP*/*.pdf out/
