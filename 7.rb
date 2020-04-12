require_relative 'lib/helper'

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10 001st prime number?

def simple
  prime_count = 0
  cursor = 1

  loop do
    prime_count += 1 if is_prime(cursor)

    return cursor if prime_count == 10_001

    cursor += 1
  end
end

run do
  simple
end
