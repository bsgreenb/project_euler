# Longest Collatz sequence
# Problem 14
# The following iterative sequence is defined for the set of positive integers:
#
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.

#TODO: this seems like a memoization Problem, basically writing a collatz step counter with a memo hash

def collatz_count(number, collatz_so_far = {})
  return collatz_so_far[number] if collatz_so_far[number]
  return 1 if number == 1 || number == 0
  return 1 + collatz_count(number/2) if number.even?
  return 1 + collatz_count((number*3) + 1) if number.odd?
end

def longest_collatz(up_to = 1000000)
  collatz_so_far = {}
  up_to.times do |number|
    puts "HERE with #{number}"
    collatz_so_far[number] = collatz_count(number, collatz_so_far)
  end

  return collatz_so_far.max_by{|k,v| v}
end

puts collatz_count(837799)
