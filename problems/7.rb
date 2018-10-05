require_relative '../lib/helper'

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10 001st prime number?

def is_prime(n)
  c = 2

  loop do
    return false if n % c == 0
    return true if c > n / 2

    c += 1
  end
end

def simple
  prime_count = 0
  cursor = 1

  loop do
    prime_count += 1 if is_prime(cursor)

    return cursor if prime_count == 10_001

    cursor += 1
  end
end

run(7) do
  simple
end