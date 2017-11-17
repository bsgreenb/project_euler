#
# The sum of the squares of the first ten natural numbers is,
#
# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,
#
# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
#
# My approach: going to start with the brute force and see if there are optimizations that can be made.  Guessing there have to be.

def sum_of_squares(n)
  sum = 0
  i = 1
  while i <= n
    sum += i * i
    i += 1
  end
  return sum
end

def square_of_sum(n)
  sum = 0
  i = 1
  while i <= n
    sum += i
    i += 1
  end

  return sum * sum
end

puts square_of_sum(100) - sum_of_squares(100)
