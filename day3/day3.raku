#!/usr/bin/env raku

my @lines = "input.txt".IO.lines>>.comb;
my ($x, $y, $t) = 0, 0;

for @lines {
    $t++ if .[$x] eq '#';
    $x = ($x + 3) % @lines[0].elems;
}

say "Part 1: $t";

my @ptrn = |(1 => 1, 3 => 1, 5 => 1, 7 => 1, 1 => 2) xx Inf;
$t = $y = $x = 0;
while $y <= @lines.elems {
    $t++ if  @lines[$y][$x] eq '#';
    ($x, $y) <<+=>> @ptrn[$++].kv;
    $x %= @lines[0].elems;
}

say "Part 2: $t";
