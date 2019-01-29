require_relative '../lib/helper'

# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.


# --- simple ---
def simple_walk(n, steps = 0)
  return steps if n == 1
  n = n % 2 == 0 ? n / 2 : 3 * n + 1
  simple_walk(n, steps + 1)
end

# --- known ---
$known = Hash.new(0)

def known_walk(n, path = [])
  if $known[n] != 0 || n == 1
    path.each.with_index do |p, i|
      $known[p] = path.length + $known[n] - i
    end

    return path.length + $known[n]
  end

  path << n

  n = n % 2 == 0 ? n / 2 : 3 * n + 1

  known_walk(n, path)
end

def simple
  longest = 0
  longest_n = nil

  (1..1_000_000).each do |n|
    len = known_walk(n)
    if len > longest
      longest = len
      longest_n = n
    end
  end

  longest_n
end

run(14) do
  simple
end
