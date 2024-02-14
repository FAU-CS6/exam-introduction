#!/bin/bash

# Überprüfen, ob genau ein Argument übergeben wurde
if [ "$#" -ne 1 ]; then
    echo "Fehler: Genau ein Parameter erwartet."
    exit 1
fi

# Der Parameter wird als Variable gespeichert
base_name=$1

# Überprüfen, ob eine Datei existiert
if [ ! -f "${base_name}" ]; then
    echo "Fehler: Datei '${base_name}' nicht gefunden."
    exit 2
fi

# Der Dateiname ohne Endung
base_name_without_tex=${base_name%".tex"}

# Ordner erstellen
mkdir presentations

# Die PDFs bauen
latexmk -pdf -interaction=nonstopmode "${base_name_without_tex}.tex" 
mv "${base_name_without_tex}.pdf" "${base_name_without_tex}-demo.pdf"
mkdir "${base_name_without_tex}"
for i in {10..30}
do
  cp "${base_name}" "${base_name_without_tex}-${i}-pages.tex"
  sed -i -e "s/pages{.*}/pages{${i}}/g" "${base_name_without_tex}-${i}-pages.tex"
  latexmk -pdf -interaction=nonstopmode "${base_name_without_tex}-${i}-pages.tex"
  mv "${base_name_without_tex}-${i}-pages.pdf" "${base_name_without_tex}/${base_name_without_tex}-${i}-pages.pdf"
done