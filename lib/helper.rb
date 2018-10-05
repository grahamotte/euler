require 'benchmark'
require_relative 'answers'

def run(prob = 'unknown')
  bm = Benchmark.measure { $result = yield }

  if ANSWERS[prob] == $result
    puts "#{$result} is the correct answer!"
  else
    aaa = ANSWERS[prob].to_f / $result
    aaa = 1 / aaa if aaa < 1
    aaa = 'a' * aaa.to_i
    aaa = aaa[0..10]

    puts "Whoa, #{$result} is w#{aaa}y off..."
  end

  puts bm
end
