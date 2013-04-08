VERSION = v25
INPUT_FILENAME = masterthesis
OUTPUT_FILENAME = $(VERSION)_$(INPUT_FILENAME).pdf

IMAGES := $(shell ls img/*.* img/mat/*.*)
IMAGES += net-miki.tex net.tex rulesel.tex net-trafaniuc.tex

$(OUTPUT_FILENAME): $(IMAGES) $(INPUT_FILENAME).tex $(INPUT_FILENAME).bib
	latex $(INPUT_FILENAME)
	bibtex $(INPUT_FILENAME)
	latex $(INPUT_FILENAME)
	latex $(INPUT_FILENAME)
	dvipdf $(INPUT_FILENAME).dvi $(OUTPUT_FILENAME)

clean:
	rm -f $(INPUT_FILENAME).dvi \
	      $(INPUT_FILENAME).aux \
	      $(INPUT_FILENAME).bbl \
	      $(INPUT_FILENAME).blg \
	      $(INPUT_FILENAME).log \
	      $(INPUT_FILENAME).out \
	      $(INPUT_FILENAME).toc

distclean: clean
	rm -f $(OUTPUT_FILENAME)

.PHONY: clean distclean
