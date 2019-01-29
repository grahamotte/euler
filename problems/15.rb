require_relative '../lib/helper'

# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

# How many such routes are there through a 20×20 grid?

# 0 = right
# 1 = down
# len = 2 * size
# must go right as many times as it goes down
# lets count the first couple

def simple_count(n)
  [[1] * n, [0] * n]
    .flatten
    .permutation
    .to_a
    .uniq
    .length
end

(1..4).each do |n|
  puts "#{n} => #{simple_count(n)}"
end
# 1 => 2, 2 => 6, 3 => 20, 4 => 70, 5 => 252
# looks like a binomial

(1..10).each do |n|
  puts "#{n} => #{(2 * n).choose(n)}"
end
# 1 => 2, 2 => 6, 3 => 20, 4 => 70, 1 => 2, 2 => 6, 3 => 20, 4 => 70, 5 => 252, 6 => 924, 7 => 3432, 8 => 12870, 9 => 48620, 10 => 184756
# yep

def simple
  (20 * 2).choose(20)
end

run(15) do
  simple
end
