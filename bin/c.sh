#!/bin/zsh
platex -shell-escape -halt-on-error $1
dvipdfmx ${1%tex}dvi
pdftoppm ${1%tex}pdf out
for k in out*ppm;do
	img2sixel $k > ${k%ppm}six
done

