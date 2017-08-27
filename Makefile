index := index.txt
texts := $(shell cat $(index))
inputs := $(addprefix tmp/,$(texts))
imgs := $(shell find bilder -iname '*.jpg' -or -iname '*.png' | sed 's/ /\\ /g')

all: historik.pdf

%.pdf: %.tex
	@latexmk -g -xelatex -shell-escape -halt-on-error $<

historik.pdf: historik.tex pre.tex post.tex title.tex author.tex $(inputs)

historik.tex: $(index)
	$(file >$@,\input{pre.tex})
	$(foreach i,$(inputs),$(file >>$@,\input{$i}))
	$(file >>$@,\input{post.tex})
	@./process_img.sh

tmp/%.tex: %.tex tmp Makefile commands.sed
	@cat $< | sed -E -f commands.sed > $@

tmp:
	@mkdir $@

#bilder/.processed: $(imgs)
#	@echo "$?"
#	$(foreach img,$?,@./process_img.sh "$(img)")
#	@touch $@

test.pdf: test.tex pre.tex post.tex

clean:
	rm -f *.aux *.log *.out *.toc *.fls *.idx *.ilg *.ind *.*_latexmk historik.pdf historik.tex
	rm -rf tmp/

.PHONY: clean
