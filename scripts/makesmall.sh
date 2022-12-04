#!/bin/bash

cd public/images;

for file in $(ls .); do
    name="${file%.*}";
    ext="${file##*.}";
    newfile="${name}-small.${ext}";
    echo "${file} -> ${newfile}";
    convert $file -resize 50 $newfile;
done
