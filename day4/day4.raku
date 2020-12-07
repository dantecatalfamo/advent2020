#!/usr/bin/env raku

my @passports = "input.txt".IO.split("\n\n")>>.words>>.split(':').map(*.flat.Hash);
my ($valid1, $valid2);

for @passports {
    next if .keys !(>=) <byr iyr eyr hgt hcl ecl pid>;
    ++$valid1;
    next if .<byr> !~~ 1920..2002;
    next if .<iyr> !~~ 2010..2020;
    next if .<eyr> !~~ 2020..2030;
    next if .<hgt> !~~ / ^ (\d+) ("in" || "cm") $ /;
    next if $/[0] !~~ ($/[1] eq "cm" ??  150..193 !!  59..76);
    next if .<hcl> !~~ / ^ '#' <[0..9 a..f]> ** 6 $ /;
    next if .<ecl> !(elem) <amb blu brn gry grn hzl oth>;
    next if .<pid> !~~ / ^ \d ** 9 $ /;
    ++$valid2;
}

say "Part 1: $valid1";
say "Part 2: $valid2";
