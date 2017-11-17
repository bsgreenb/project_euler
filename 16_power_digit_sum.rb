# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?

# Initial thought: want to look for a pattern in how the sums increase.  Will begin with a brute force and try to identify pattern.

def sum_of_digits(num=2, exponent=15)
  product = num ** exponent
  product.to_s.split('').map(&:to_i).inject(&:+)


end

puts sum_of_digits(2, 10)
puts sum_of_digits(2, 1000)
