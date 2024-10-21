#!/bin/bash

render_file=$(echo $1_RENDER)
output_file=$(echo "${1%.typ}.png")

sed 's/"@preview\/great-theorems:0.1.1"/"lib.typ"/' $1 > $render_file

typst compile \
  --root . \
  --input file="$render_file" \
  build/render_template.typ \
  "$output_file"

rm $render_file
