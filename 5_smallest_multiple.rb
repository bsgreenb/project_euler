# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

# Brute force method would be to try every number 1 by one and then check all of the divisors, O(n), with a large n.
# A more intelligent method would go up by the largest one

def is_divisible_by_range(number, n)
  i = n

  while i > 1
    if number % i != 0
      puts "#{number} FALSE on #{i}"
      return false
    end
    i = i - 1
  end

  # If it made it this far then its divisible by all those numbers
  return true
end

def smallest_divisible(divis_by)
  number = 2520
  loop do
    if is_divisible_by_range(number, divis_by)
      return number
    end
    number = number + 2520
  end
end

# This solution works by feeding previous results in.

puts smallest_divisible(20)
