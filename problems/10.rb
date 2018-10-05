require_relative '../lib/helper'

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

def primes
  sieve = (1..2_000_000).step(2).to_a
  pos = 1

  loop do
    puts "#{pos} of #{sieve.length}"
    sieve.each.with_index do |x, i|
      next if i <= pos
      sieve.delete_at(i) if x % sieve[pos] == 0
    end

    pos += 1
    return sieve if pos == sieve.length / 2
  end
end

def simple
  primes.inject(&:+)
end

run(10) do
  simple
end
