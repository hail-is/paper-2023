main.pdf: main.tex bibliography
	pdflatex main
	pdflatex main  # once more for the references :facepalm:

bibliography: sample.bib
	pdflatex main
	echo The next step can take a while ...
	biber main
	touch bibliography

.PHONY: tex-deps
tex-deps:
  # preprint: authblk
  # newpx: newpxtext
  # xstring: xstring
  # kastrup: binhex
  # bera: beramono
  # newtx resolves some weird issue about stxscr
  # biber is for the bibliographytarget
  # tools: tabularx
	tlmgr install preprint newpx xstring fontaxes kastrup biblatex bera newtx biber classicthesis arsclassica mparhack titlesec tocloft footmisc soul eulervm iwona palatino mathpazo fpl tools adjustbox forest

.PHONY: watch
watch:
  # brew install fswatch
	fswatch -o main.tex sample.bib | xargs -I{} pdflatex main
