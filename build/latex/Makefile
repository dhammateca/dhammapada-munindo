LATEX=lualatex
BIBTEX=bibtex

LATEX_OPTS=-interaction=nonstopmode -halt-on-error

all:
	@echo "large or small?"

large:
	$(LATEX) $(LATEX_OPTS) book_large_main.tex

small:
	$(LATEX) $(LATEX_OPTS) book_small_main.tex

cover-front:
	$(LATEX) $(LATEX_OPTS) cover_front.tex

cover-back:
	$(LATEX) $(LATEX_OPTS) cover_back.tex

cover-spine:
	$(LATEX) $(LATEX_OPTS) cover_spine.tex
	+pdftk cover_spine.pdf cat 1-endeast output cover_spine_east.pdf

cover:
	$(LATEX) $(LATEX_OPTS) cover_main.tex

cover-all:
	make cover-front
	make cover-back
	make cover-spine
	make cover

clean:
	+rm -fv $(FILE).{dvi,ps,pdf,aux,log,bbl,blg}

