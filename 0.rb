# $VERBOSE = nil

Dir.glob("*.rb")
  .map { |x| x.gsub('.rb', '') }
  .map(&:to_i)
  .reject { |x| x == 0 }
  .sort
  .each { |x| $problem_no = x; load "#{x}.rb" }
