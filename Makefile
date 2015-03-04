LATEXMK = latexmk -xelatex -r .latexmkrc

target = thesis
references := references.bib
includes := $(shell ls *.tex) ${references}

.PHONY: ${target}
${target}: ${target}.pdf

${target}.pdf: ${includes}
	${LATEXMK} ${target}

.PHONY: preview
preview:
	${LATEXMK} -pvc ${target}

.PHONY: clean
clean:
	${RM} $(filter-out %.tex %.pdf,$(shell ls ${target}.*))
	# The following is occasionally necessary due to a nasty bug in biber.
	${RM} -r $(shell biber --cache)

.PHONY: cleanall
cleanall: clean
	${RM} ${target}.pdf
