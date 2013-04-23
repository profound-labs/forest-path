FILE=book_main

LATEX=lualatex
BIBTEX=bibtex

LATEX_OPTS=-interaction=nonstopmode -halt-on-error

all: book

book: glossary
	$(LATEX) $(LATEX_OPTS) $(FILE).tex;

glossary:
	makeglossaries $(FILE)
	echo $(grep -cE '\\glossaryentryfield' `$FILE`.gls)" entries"

clean:
	+rm -fv $(FILE).{dvi,ps,pdf,aux,log,bbl,blg,gls,glg,glo,xdy}

