require_relative '../lib/helper'

# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a^2 + b^2 = c^2
# For example, 32 + 42 = 9 + 16 = 25 = 52.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def squares
  sqs = []
  c = 1

  while (v = c ** 2) < 1000000
    sqs << v
    c += 1
  end

  sqs
end

def simple
  squares.combination(3).each do |c|
    if c[0] + c[1] == c[2]
      sqrts = c.map { |c| Math.sqrt(c) }
      if sqrts.inject(&:+) == 1000
        return sqrts.inject(&:*)
      end
    end
  end
end

run(9) do
  simple
end
