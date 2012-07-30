VERSION = v10
OUTPUT_FILENAME = $(VERSION)_qualificacao.pdf
INPUT_FILENAME = masterthesis

IMAGES := $(shell ls img/*.* img/mat/*.*)
PIC_IMAGES := $(patsubst %.pic,%.tex,$(shell ls *.pic))
IMAGES += $(PIC_IMAGES)

%.tex: %.pic
	gpic -t $< > $@

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
	      $(INPUT_FILENAME).toc \
	      $(PIC_IMAGES)

distclean: clean
	rm -f $(OUTPUT_FILENAME)

.PHONY: clean distclean
