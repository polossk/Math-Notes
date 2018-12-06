TEX      = xelatex
MAKEINDEX= makeindex
ZHMAKEIND= zhmakeindex
MAIN     = mnotes

target: close wipe clean tex clean open

tex: $(MAIN).tex
	$(TEX) $(MAIN).tex
	$(MAKEINDEX) date.idx
	$(ZHMAKEIND) -z pinyin -s zh keyword
	$(TEX) $(MAIN).tex
	$(TEX) $(MAIN).tex

open: $(MAIN).pdf
	cmd /c start $(MAIN).pdf

close:
	cmd /c taskkill /im Acrobat.exe /t /f || echo not find

clean:
	del /s /f *.aux *.bbl *.idx *.ilg *.ind *.blg *.log *.out *.gz *.toc *.thm *.fdb_latexmk *.fls *.nav *.snm *.vrb

wipe:
	del /f $(MAIN).pdf

.PHONY: open close clean wipe