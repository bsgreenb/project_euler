# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9.
# The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

def sum_of_multiples(up_to = 1000)
  sum = 0
  i = 1
  while i < up_to
    if i % 3 == 0 || i % 5 == 0
      sum = sum + i
    end
    i = i + 1
  end

  sum
end

puts sum_of_multiples()
