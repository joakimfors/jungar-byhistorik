kapitel := $(wildcard kapitel*.tex)

all: historik.pdf

%.pdf: %.tex
	@pdflatex $<
	@pdflatex $<

#historik.pdf: historik.tex

historik.tex: pre.tex post.tex $(kapitel)
	@cat pre.tex > $@
	@for kap in "$(basename $(kapitel))"; do \
		echo "\n\\include{$$kap}\n" >> $@; \
	done
	@cat post.tex >> $@

.PHONY:
