# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?

#thoughts on solving
# Prime numbers are numbers that aren't made of other prime numbers.  We can go up to the sqrt of n

#CONTINYA here on fixing the prime finder.  It's not tripping when it should be.
def largest_prime_factors(n)
  primes = []
  i = 2
  while i < Math.sqrt(n)
    prime = true
    primes.each do |prime|
      if i % prime == 0
        prime = false
        break
      end
    end
    primes.push(i) if prime
    i = i + 1
  end
  puts primes.inspect
end

puts largest_prime_factors(13195) #5, 7, 13 and 29
