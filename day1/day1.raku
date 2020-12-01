#!/usr/bin/env raku

my @inputs = "input.txt".IO.lines>>.Int;

say "Part 1";
for @inputs X @inputs -> ($first, $second) {
    say("$first x $second = {$first*$second}") if $first + $second == 2020;
}

say "Part 2";
for @inputs X @inputs X @inputs -> ($first, $second, $third) {
    say("$first x $second x $third = {$first*$second*$third}") if $first + $second + $third == 2020;
}

# say "Part 2: Parallel";
# my @raced = (@inputs X @inputs X @inputs).race;
# @raced.grep({
#     my ($first, $second, $third) = $_;
#     $first + $second + $third == 2020;
# }).map(-> ($a, $b, $c) {
#     say "$a x $b x $c = {$a*$b*$c}";
# });
