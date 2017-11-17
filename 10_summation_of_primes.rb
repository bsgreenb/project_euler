# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

def is_prime(number, primes_so_far)
  primes_so_far.each do |prime|
    return true if prime > Math.sqrt(number)
    return false if number % prime == 0
  end
  return true
end

def sum_primes(limit)
  primes = []
  i = 2
  while i < limit
    if is_prime(i, primes)
      puts "Found prime #{primes.length + 1}: #{i}"
      primes.push(i)
    end
    i += 1
  end
  return primes.inject(:+)
end

puts sum_primes(2000000)
