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

def is_prime?(n)
  return false if n == 1
  return true if n < 4
  return false if n % 2 == 0
  return true if n < 9
  return false if n % 3 == 0

  pos = 5
  while pos <= (Math.sqrt(n)).floor
    return false if n % pos == 0
    return false if n % (pos + 2) == 0

    pos += 6
  end

  true
end

def simple
  primes.inject(&:+)
end

def better
  sum = 0

  (2..2_000_000).each do |n|
    sum += n if is_prime?(n)
  end

  sum
end

run(10) do
  better
end
