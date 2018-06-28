#!/bin/bash

#rm log.log main.log
mkdir -pv build

printf "> pdflatex [first]\n\n$(pdflatex -output-directory=build/ -synctex=1 -interaction=nonstopmode main.tex)" >> log.log 2> /dev/null

cd build/
printf "\n\n> biber\n\n$(biber main)" >> ../log.log 2> /dev/null
cd ..

printf "\n\n> pdflatex\n\n$(pdflatex -output-directory=build/ -synctex=1 -interaction=nonstopmode main.tex)" >> log.log 2> /dev/null
printf "\n\n> pdflatex [last]\n\n$(pdflatex -output-directory=build/ -synctex=1 -interaction=nonstopmode main.tex)" >> log.log 2> /dev/null
printf "\n\n> pdflatex [last]\n\n$(pdflatex -output-directory=build/ -synctex=1 -interaction=nonstopmode main.tex)" >> log.log 2> /dev/null

#cat build/main.log >> main.log

#mv build/main.pdf ./

#rm -rf build
