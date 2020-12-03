#!/usr/bin/env raku

my @lines = "input.txt".IO.lines>>.comb;

my $y = 0;
my $line-length = @lines[0].elems;
my $run = 3;
my $hit;

for @lines -> @line {
    $hit++ if @line[$y] eq '#';
    $y = ($y + $run) % $line-length;
}

say $hit;
