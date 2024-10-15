#!/bin/bash

render_file=$(echo $1_RENDER)
output_file=$(echo "${1%.typ}.png")
render_file1=$(echo $1_RENDER1)

sed 's/"@preview\/great-theorems:0.1.0"/"lib.typ"/' $1 > $render_file1
sed 's/"@preview\/headcount:0.1.0"/"headcount.typ"/' $render_file1 > $render_file

typst compile \
  --root . \
  --input file="$render_file" \
  build/render_template.typ \
  "$output_file"

rm $render_file
rm $render_file1
