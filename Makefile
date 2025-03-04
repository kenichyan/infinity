FILENAME  = Infinity
TEX       = $(FILENAME).tex
IDX       = $(FILENAME).idx
DVI       = $(FILENAME).dvi
PDF       = $(FILENAME).pdf
PDFOUT    = $(FILENAME)_enc.pdf
all:
	make tex
	make tex
	make idx
	make tex
	make pw
distclean:
	rm $(PDFOUT)
	make clean
clean:
	rm *.aux *.idx *.ilg *.ind *.log  *.toc *.out $(PDF)
tex:
	lualatex $(TEX)
idx:
	makeindex $(IDX)
pw:
	pdftk $(PDF) output $(PDFOUT) owner_pw PROMPT
