LATEX=lualatex
BIBTEX=bibtex

LATEX_OPTS=-interaction=nonstopmode -halt-on-error

all:
	@echo "large or small?"

large:
	$(LATEX) $(LATEX_OPTS) book_large_main.tex

small:
	$(LATEX) $(LATEX_OPTS) book_small_main.tex

cover-large:
	$(LATEX) $(LATEX_OPTS) cover-large.tex

cover-small:
	$(LATEX) $(LATEX_OPTS) cover-small.tex

clean:
	+rm -fv $(FILE).{dvi,ps,pdf,aux,log,bbl,blg}

