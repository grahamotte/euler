require_relative 'lib/helper'

# You are given the following information, but you may prefer to do some research for yourself.

#   1 Jan 1900 was a Monday.
#   Thirty days has September,
#   April, June and November.
#   All the rest have thirty-one,
#   Saving February alone,
#   Which has twenty-eight, rain or shine.
#   And on leap years, twenty-nine.
#   A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

class D
  attr_accessor :y, :m, :d, :dow

  def initialize(y = 1901, m = 1, d = 1, dow = 1)
    @y = y
    @m = m
    @d = d
    @dow = dow
  end

  def len
    return 30 if [9, 4, 6, 11].include?(m)
    return 31 if m != 2
    return 29 if (y % 4 == 0) && (y % 400 == 0)

    28
  end

  def tick
    @dow += 1
    @dow = 1 if dow == 8

    if d + 1 > len
      @d = 1
      @m += 1
    else
      @d += 1
    end

    if @m == 13
      @m = 1
      @y += 1
    end
  end

  def to_s
    "#{y} #{m.to_s.ljust(2, ' ')} #{d.to_s.ljust(2, ' ')} - #{dow}"
  end
end

def simple
  d = D.new
  c = 0
  loop do
    d.tick
    c += 1 if d.dow == 1 && d.d == 1
    break if d.y == 2000 && d.m == 12 && d.d == 31
  end

  c
end

run { simple }
