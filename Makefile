all: publications
	@quarto render

publications: publications.bib apa-cv.csl lua-refs.lua
	@quarto pandoc -L lua-refs.lua \
		publications.bib --csl=apa-cv.csl \
		-V --toc=false \
		--to=markdown-citations \
		-o publications.qmd
	@Rscript highlight-author.R \
		"Hernández, G. G." "publications.qmd"

clean:
	rm -rf publications* *~
