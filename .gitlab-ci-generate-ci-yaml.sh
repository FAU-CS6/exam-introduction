#!/bin/bash

echo "stages:" > .presentations-ci.yml
echo "  - build-latex" >> .presentations-ci.yml
echo "  - upload-pdfs" >> .presentations-ci.yml
for filename in *.tex
do
  base_name=$(basename "${filename}")
  base_name_without_tex=${base_name%".tex"}
  echo "${base_name_without_tex}-presentation:" >> .presentations-ci.yml
  echo "  image: cs6-gitlab.cs6.fau.de:4567/containers/latex-builder:latest" >> .presentations-ci.yml
  echo "  stage: build-latex" >> .presentations-ci.yml
  echo "  script:" >> .presentations-ci.yml
  echo "    - echo \$CI_COMMIT_SHA > .git/refs/heads/main" >> .presentations-ci.yml
  echo "    - chmod +x .gitlab-ci-generate-presentation.sh" >> .presentations-ci.yml
  echo "    - ./.gitlab-ci-generate-presentation.sh ${base_name}" >> .presentations-ci.yml
  echo "  artifacts:" >> .presentations-ci.yml
  echo "    paths:" >> .presentations-ci.yml
  echo "      - \"*.pdf\"" >> .presentations-ci.yml
  echo "      - \"exam-introduction*/*.pdf\"" >> .presentations-ci.yml
done
echo "presentations:" >> .presentations-ci.yml
echo "  stage: upload-pdfs" >> .presentations-ci.yml
echo "  image: alpine" >> .presentations-ci.yml
echo "  script:" >> .presentations-ci.yml
echo "    - ls " >> .presentations-ci.yml
echo "    - ls exam-introduction*/" >> .presentations-ci.yml
echo "  artifacts:" >> .presentations-ci.yml
echo "    name: \"presentations\"" >> .presentations-ci.yml
echo "    paths:" >> .presentations-ci.yml
echo "      - \"*.pdf\"" >> .presentations-ci.yml
echo "      - \"exam-introduction*/*.pdf\"" >> .presentations-ci.yml

