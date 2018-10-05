require_relative '../lib/helper'

# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

class Array
  def delete_first item
    delete_at(index(item) || length)
  end
end

def smallest_divisor(num)
  n = 2
  while n < num && num % n != 0 do
     n += 1
  end
  n
end

def simple
  divisors = [600851475143]
  primes = []
  is_done = false

  while !is_done
    is_done = true

    divisors.each do |d|
      next if primes.include?(d)
      is_done = false
      smallest = smallest_divisor(d)

      if smallest == d
        primes << d
        next
      end

      divisors.delete_first(d)
      divisors << smallest
      divisors << d / smallest

      break
    end
  end

  divisors.max
end

run(3) do
  simple
end
