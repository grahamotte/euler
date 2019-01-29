require_relative '../lib/helper'

# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

$sub_ten = {
  9 => 'nine', 8 => 'eight', 7 => 'seven', 6 => 'six', 5 => 'five', 4 => 'four', 3 => 'three', 2 => 'two', 1 => 'one'
}
$sub_twenty = {
  19 => 'nineteen', 18 => 'eighteen', 17 => 'seventeen', 16 => 'sixteen', 15 => 'fifteen', 14 => 'fourteen', 13 => 'thirteen', 12 => 'twelve', 11 => 'eleven', 10 => 'ten'
}
$sub_hundred = {
  90 => 'ninety', 80 => 'eighty', 70 => 'seventy', 60 => 'sixty', 50 => 'fifty', 40 => 'forty', 30 => 'thirty', 20 => 'twenty'
}

def sub_ten(n)
  $sub_ten[n]
end

def sub_twenty(n)
  return sub_ten(n) if n < 10
  $sub_twenty[n]
end

def sub_hundred(n)
  return sub_twenty(n) if n < 20

  tens, ones = n.to_s.split('').map(&:to_i)
  tens = 10 * tens

  [$sub_hundred[tens], sub_ten(ones)].compact.join('-')
end

def sub_thousand(n)
  return sub_hundred(n) if n < 100

  hundreds = n.to_s[0].to_i
  tens = n.to_s[1..-1].to_i

  [
    "#{sub_ten(hundreds)} hundred",
    sub_hundred(tens),
  ].compact.join(' and ')
end

def count_letters(string)
  string.gsub(' ', '').gsub('-', '').length
end

def simple
  (1..999).inject(count_letters('one thousand')) do |sum, n|
    sum += count_letters(sub_thousand(n))
  end
end

run(17) do
  simple
end
