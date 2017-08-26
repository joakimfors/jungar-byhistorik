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

tmp/%.tex: %.tex tmp Makefile
	@cat $< | sed -E \
		-e 's/(\\jhperson\{)([[:alpha:] -]*)(\})/\1\\jhname[\2]\{\2\}\3/g' -e '# add \jhname to \jhperson' \
		-e 's/(\\jhperson\{\\jhbold\{)([[:alpha:] -]*)(\}\})/\1\\jhname[\2]\{\2\}\3/g' -e '# add \jhname to \jhperson' \
		-e 's/([0-3][0-9])\.([0-2][0-9])\.([0-9]{1,4})/\1.\\allowbreak\{\}\2.\\allowbreak\{\}\3/g' -e '# allow line breaks between numbers in a date' \
		-e '/\\jh(house)?pic/! s/([[:alpha:]]{2,}|[[:digit:]]{2,4})-([[:alpha:]]{2,})/\1-\\allowbreak\{\}\2/g' -e '# allow line break in hyphenated names or year combos' \
		-e :1 -e 's/(\\jhname(\[.*\])?\{.*)\\allowbreak\{\}(.*\})/\1\3/;t1' -e '# remove allowbreak from second jhname arg' \
		> $@

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
