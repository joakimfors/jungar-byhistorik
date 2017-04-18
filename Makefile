texts := $(filter-out historik.tex pre.tex post.tex,$(wildcard *.tex))

all: historik.pdf

%.pdf: %.tex
	@pdflatex -interaction=nonstopmode -halt-on-error $< && pdflatex -interaction=nonstopmode -halt-on-error $<

#historik.pdf: historik.tex

historik.tex: pre.tex post.tex $(texts)
	@cat pre.tex > $@
	@for text in "$(basename $(texts))"; do \
		echo "\n\\include{$$text}\n" >> $@; \
	done
	@cat post.tex >> $@

.PHONY:
