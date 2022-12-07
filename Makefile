bibliography: sample.bib
	biber main
	touch bibliography

main.pdf: main.tex bibliography
	echo The next step can take a while ...
	pdflatex main

.PHONY: tex-deps
tex-deps:
  # preprint: authblk
  # newpx: newpxtext
  # xstring: xstring
  # fontaxes: fontaxes
  # kastrup: binhex
  # biblatex: biblatex
  # bera: beramono
  # newtx resolves some weird issue about stxscr
  # biber adds the biber command which prepares bibliographies
	tlmgr install preprint newpx xstring fontaxes kastrup biblatex bera newtx biber

.PHONY: watch
watch:
  # brew install fswatch
	fswatch -o main.tex sample.bib | xargs -n1 make main.pdf
