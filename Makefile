LATEXMK = latexmk -xelatex -r .latexmkrc

.PHONY: thesis
thesis: thesis.pdf

thesis.pdf: thesis.tex
	${LATEXMK} thesis

.PHONY: preview
preview:
	${LATEXMK} -pvc thesis

.PHONY: clean
clean:
	${RM} $(filter-out thesis.tex thesis.pdf,$(shell ls thesis.*))

.PHONY: cleanall
cleanall: clean
	${RM} thesis.pdf
