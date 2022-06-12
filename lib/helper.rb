require "rubygems/text"
require 'benchmark'
require 'pp'
require 'set'
require_relative 'utils'

ANSWERS = File.readlines('data/answers.txt').map(&:chomp)

def problem_no
  $problem_no || $PROGRAM_NAME.rpartition('/').last.gsub('.rb', '').to_i
end

def answer
  ANSWERS.fetch(problem_no).to_s
end

def ld
  Class.new.extend(Gem::Text).method(:levenshtein_distance)
end

def run
  bm = Benchmark.measure { $result = yield.to_s }

  if $result == answer
    puts "#{$result} is correct! (#{bm.real.round(2)}s)"
  else
    aaa = 'a' * ld.call(answer, $result)
    puts "Try again... #{$result} is w#{aaa}y off. (#{bm.real.round(2)}s)"
  end
end
