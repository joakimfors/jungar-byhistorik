texts := $(shell cat index.txt)
inputs := $(addprefix tmp/,$(texts))
imgs := $(shell find bilder -iname '*.jpg' -or -iname '*.png' | sed 's/ /\\ /g')

all: historik.pdf

%.pdf: %.tex
	@latexmk -g -xelatex -halt-on-error $<

historik.pdf: historik.tex pre.tex post.tex Makefile

historik.tex: $(inputs) index.txt
	$(file >$@,\input{pre.tex})
	$(foreach i,$(inputs),$(file >>$@,\input{$i}))
	$(file >>$@,\input{post.tex})
	@./process_img.sh

tmp/%.tex: %.tex tmp Makefile
	@cat $< | sed -E \
		-e 's/([0-3][0-9])\.([0-2][0-9])\.([0-9]{1,4})/\1.\\allowbreak{}\2.\\allowbreak{}\3/g' \
		-e '/\\jh(house)?pic/! s/([[:alpha:]]{2,}|[[:digit:]]{2,4})-([[:alpha:]]{2,})/\1-\\allowbreak{}\2/g' > $@

tmp:
	@mkdir $@

#bilder/.processed: $(imgs)
#	@echo "$?"
#	$(foreach img,$?,@./process_img.sh "$(img)")
#	@touch $@

test.pdf: test.tex pre.tex post.tex

clean:
	rm -f *.aux *.log *.out *.toc *.fls *.*_latexmk historik.pdf historik.tex
	rm -rf tmp/

.PHONY: clean
