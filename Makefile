texts := $(shell cat index.txt)
imgs := $(shell find bilder -iname '*.jpg' -or -iname '*.png' | sed 's/ /\\ /g')

all: historik.pdf

%.pdf: %.tex
	#@xelatex -halt-on-error $< && \
	#	xelatex -halt-on-error $<
	@latexmk -xelatex $<

historik.pdf: historik.tex pre.tex post.tex

historik.tex: $(texts) index.txt
	$(file >$@,\input{pre.tex})
	$(foreach t,$(texts),$(file >>$@,\input{$t}))
	$(file >>$@,\input{post.tex})
	@./process_img.sh

#bilder/.processed: $(imgs)
#	@echo "$?"
#	$(foreach img,$?,@./process_img.sh "$(img)")
#	@touch $@

test.pdf: test.tex pre.tex post.tex

clean:
	rm -f *.aux *.log *.out *.toc *.fls *.*_latexmk historik.pdf historik.tex

.PHONY: clean
