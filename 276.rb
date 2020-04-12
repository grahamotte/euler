require_relative 'lib/helper'

# # Consider the triangles with integer sides a, b and c with a ≤ b ≤ c.
# # An integer sided triangle (a,b,c) is called primitive if gcd(a,b,c)=1.
# # How many primitive integer sided triangles exist with a perimeter not exceeding 10 000 000?

# a + b + c = 10m
# a <= b <= c

# https://oeis.org/A005044

# p = 10_000
# @count = 0

# def gcd_is_1?(*numbers)
#   limit = numbers.max / 2

#   (2..limit).each do |d|
#     return false if numbers.all? { |n| n % d == 0 }
#   end

#   true
# end

# def test(p, c, b)
#   a = p - b - c
#   if gcd_is_1?(a, b, c)
#     @count += 1
#   end

#   puts "#{gcd_is_1?(a, b, c)} #{a} + #{b} + #{c} = #{a + b + c}"
# end

# def

# run do
#   raise
#   (p/3..p).each do |c|
#     s = [1, p - c - c].max
#     f = (p - c) / 2

#     if c % 2 == 0 && s % 2 == 0
#       (s + 1..f).step(2).each { |b| test(p, c, b) }
#     elsif c % 3 == 0 && s % 3 == 0
#       (s + 2..f).step(3).each { |b| test(p, c, b) }
#     elsif c % 5 == 0 && s % 5 == 0
#       (s + 4..f).step(5).each { |b| test(p, c, b) }
#     else
#       (s..f).each { |b| test(p, c, b) }
#     end
#   end

#   @count
# end

# # count += 1 if gcd_is_1?(a, b, c)
# # ------------<c><b>------------------p
