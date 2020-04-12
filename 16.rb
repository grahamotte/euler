require_relative 'lib/helper'

# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2^1000?

def simple
  (2 ** 1000).to_s.split('').inject(0) { |s, i| s += i.to_i }
end

run do
  simple
end
