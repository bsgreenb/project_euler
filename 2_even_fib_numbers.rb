# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
#
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#
# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

# This is where we need memoization.  Will be too slow otherwise.

def fib_bottom_up()
  a = 0
  b = 1
  i = 2
  sum = 0
  # So here we're using an iterative approach to build up.
  loop do
    c = a + b
    a = b
    b = c
    i = i + 1
    break if c > (4 * 1000 * 1000)
    sum = sum + c if c % 2 == 0
  end

  return sum
end

#TODO: let's build up an array from this and then report the sum of evens

puts fib_bottom_up()
#CONTINYA on chapter 8 before proceeding, but I think converting recursive to iterative and understanding how that works is key.
#TODO: figure out stack level too deep issue.  ah, iteration vs recursion
#TODO: convert into iterative problem.
