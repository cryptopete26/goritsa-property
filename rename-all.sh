#!/bin/bash

for dir in images/*/; do
  if [ -d "$dir" ]; then
    name=$(basename "$dir")
    i=1
    for f in "$dir"/*; do
      if [ -f "$f" ]; then
        ext="${f##*.}"
        mv "$f" "$dir/${name}-$(printf "%02d" $i).$ext"
        ((i++))
      fi
    done
  fi
done
