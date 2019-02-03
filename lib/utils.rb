class Array
  def delete_first item
    delete_at(index(item) || length)
  end
end

class Integer
  def choose(k)
    ((self - k + 1)..self).inject(1, &:*) / (2..k).inject(1, &:*)
  end

  def factorial
    (1..self).reduce(&:*)
  end
end

def sort(array, &block)
  block ||= ->(a, b) { a <= b }
  return array if array.length <= 1

  mid = array.delete_at(array.length / 2)
  left, right = [], []

  array.each do |x|
    if block.call(x, mid)
      left << x
    else
      right << x
    end
  end

  return [*sort(left, &block), mid ,*sort(right, &block)]
end

def is_prime(n)
  c = 2

  loop do
    return false if n % c == 0
    return true if c > n / 2

    c += 1
  end
end

def is_square(n)
  Math.sqrt(n) % 1 == 0
end

def is_triangle(n)
  is_square((8 * n) + 1)
end

def proper_divisors(n)
  divisors(n) - [n]
end

def divisors(n)
  [].to_set.tap do |divs|
    (1..Math.sqrt(n).ceil).each do |d|
      next if divs.include?(d)

      if n % d == 0
        divs << d
        divs << n / d
      end
    end
  end
end

def smallest_divisor(num)
  n = 2
  while n < num && num % n != 0 do
     n += 1
  end
  n
end
