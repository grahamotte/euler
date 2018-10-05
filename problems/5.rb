require_relative '../lib/helper'

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def dividers
  [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
end

def multiples_between(n, min, max)
  ((min / n).to_i..(max / n).to_i).to_a.map { |s| s * n }
end

def simple
  batch = 1000
  n = 2

  loop do
    commons = dividers
      .map { |d| multiples_between(d, n * batch, (n + 1) * batch) }
      .inject(&:&)

    return commons.min if commons.any?

    n += 1
  end
end

run(5) do
  simple
end
