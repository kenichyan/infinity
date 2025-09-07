FILENAME  = Infinity
TEX       = $(FILENAME).tex
IDX       = $(FILENAME).idx
PDF       = $(FILENAME).pdf
PDFOUT    = $(FILENAME)_enc.pdf

all: $(PDFOUT)

$(PDF): $(TEX)
	lualatex $(TEX)
	makeindex $(IDX)
	lualatex $(TEX)

$(PDFOUT): $(PDF)
	pdftk $(PDF) output $(PDFOUT) owner_pw PROMPT

clean:
	rm -f *.aux *.idx *.ilg *.ind *.log *.toc *.out $(PDF)

distclean: clean
	rm -f $(PDFOUT)