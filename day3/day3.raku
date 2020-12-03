#!/usr/bin/env raku

my @lines = "input.txt".IO.lines>>.comb;
my ($y, $t) = 0;

for @lines {
    $t++ if .[$y] eq '#';
    $y = ($y + 3) % @lines[0].elems;
}

say "Part 1: $t";
