# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#
# What is the 10 001st prime number?

# Approach for solving this: Build up a list of primes.  A prime is defined as a number thats not divisible by previous primes.

def is_prime(number, primes_so_far)
  primes_so_far.each do |prime|
    # This is a key time saver to advoid trying all the previous primes.
    return true if prime > Math.sqrt(number)
    return false if number % prime == 0
  end
  return true
end

def nth_prime(n)
  primes = []
  i = 2
  loop do
    if is_prime(i, primes)
      puts "Found prime #{primes.length + 1}: #{i}"
      primes.push(i)
      return primes.last if primes.length == n
    end
    i += 1
  end
end

puts nth_prime(10001)
