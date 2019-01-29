class Array
  def delete_first item
    delete_at(index(item) || length)
  end
end

class Integer
  def choose(k)
    ((self - k + 1)..self).inject(1, &:*) / (2..k).inject(1, &:*)
  end
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

def divisors(n)
  [].tap do |divs|
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
