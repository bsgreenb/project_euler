# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# Let us list the factors of the first seven triangle numbers:
#
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.
#
# What is the value of the first triangle number to have over five hundred divisors?

# Ok to solve this one, I'll need to have a method for getting the number of divisors
# Ill also need a loop for generating triangle numbers

def is_prime(number, primes_so_far)
  if primes_so_far[number]
    return true
  end
  i = 2
  while i <= Math.sqrt(number)
    return false if number % i == 0
    i += 1
  end
  return true
end

def prime_factorization(number, primes_so_far)
  # Loop through primes up to sqrt(n), building up a tally, updating number as we go
  prime_factorization = {}
  n = 2
  while n <= number
    # If its a prime factor
    if is_prime(n, primes_so_far) && (number % n == 0)
      prime_factorization[n] ||= 1
      prime_factorization[n] += 1
      number = number / n
      if n == 1
        # So we don't keep dividing by 1
        n += 1
      end
    else
      n += 1
    end
  end

  return prime_factorization
end


def highly_divisible_triangle_num(num_divisors_limit = 500)
  i = 1
  triangle_num = 0
  primes_so_far = {}
  loop do
    triangle_num = triangle_num + i
    pfactorization = prime_factorization(triangle_num, primes_so_far)
    pfactorization.keys.each do |prime|
      if primes_so_far[prime].nil?
        primes_so_far[prime] = true
      end
    end
    # This multiplication step was the key I was missing
    num_divisors = pfactorization.values.inject(&:*)
    puts "#{triangle_num} has #{num_divisors} divisors"
    return triangle_num if num_divisors && num_divisors >= num_divisors_limit

    i += 1
  end
end

#TODO: this brute force approach wont work.  understand and use prime factorization:
# https://www.math.upenn.edu/~deturck/m170/wk2/numdivisors.html

puts highly_divisible_triangle_num(500)

#TODO: need to fix
