all:
	latexmk -pdf -interaction=nonstopmode -halt-on-error cv.tex
clean:
	latexmk -c
