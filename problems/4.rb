require_relative '../lib/helper'

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

# 998001 = 999 * 999

def palindromes
  $pals ||= (100..999)
    .to_a
    .map { |p| "#{p.to_s}#{p.to_s.reverse}".to_i }

end

def simple
  valid = []

  (100..999).each do |a|
    (100..999).each do |b|
      if palindromes.include?(a * b)
        valid << a * b
      end
    end
  end

  valid.max
end

def better
  palindromes.sort.reverse.each do |p|
    n = 999
    while n > 500
      n -= 1
      return p if p % n == 0 && (p/n).to_s.length == 3
    end
  end
end

# run(4) do
#   simple
# end

run(4) do
  better
end
