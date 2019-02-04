require_relative '../lib/helper'

# A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

# 012   021   102   120   201   210

# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

def next_permutation(a)
  # Thanks Narayana!

  # Find the largest index k such that a[k] < a[k + 1].
  big_k = nil
  a.each.with_index do |_, k|
    next unless a[k + 1]
    big_k = k if a[k] < a[k + 1]
  end

  # If no such index exists, the permutation is the last permutation.
  return a unless big_k

  # Find the largest index l greater than k such that a[k] < a[l].
  big_l = nil
  a.each.with_index do |_, l|
    next unless l > big_k
    big_l = l if a[big_k] < a[l]
  end

  # Swap the value of a[k] with that of a[l].
  a[big_k], a[big_l] = a[big_l], a[big_k]

  # Reverse the sequence from a[k + 1] up to and including the final element a[n].
  a[0..big_k] + a[(big_k + 1)..-1].reverse
end

def simple
  array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  999_999.times { array = next_permutation(array) }

  array.map(&:to_s).join('').to_i
end

run(24) do
  simple
end
