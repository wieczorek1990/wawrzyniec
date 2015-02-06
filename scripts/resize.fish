#!/usr/bin/env fish
set dir $argv[1]
set out $argv[2]
set width $argv[3]
for input in $dir/*
  set output $out/(basename $input)
  convert $input -resize $width  $output
end