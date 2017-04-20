texts := $(shell cat index.txt)

all: historik.pdf

%.pdf: %.tex
	@pdflatex -interaction=nonstopmode -halt-on-error $< && \
		pdflatex -interaction=nonstopmode -halt-on-error $<

historik.pdf: historik.tex

historik.tex: pre.tex post.tex $(texts) index.txt
	@cat pre.tex > $@
	@for text in $(basename $(texts)); do \
		echo "\n\\input{$$text}\n" >> $@; \
	done
	@cat post.tex >> $@

clean:
	rm -f *.aux *.log *.out *.toc historik.pdf historik.tex

.PHONY: clean
