# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

# lets reduce this so we can solve for stuff

# a^2 + b^2 = c^2
# c = 1000 - a - b
# let A

# hmm this ones kinda hard, will have to think on it.

# here's my plan.  simply loop through the possible values of a and b under 1000 and check the equality for c with them.

def pythagorean_triplets
  squares = []
  1000.times do |i|
    squares[i] = i * i
  end

  squares.each_with_index do |asq, a|
    squares.each_with_index do |bsq, b|
      if b > a
        c = 1000 - a - b
        puts "trying #{a}, #{b}, #{c}"
        if c > b
          return [a, b, c] if squares[c] == asq + bsq
        end
      end
    end
  end
end

puts pythagorean_triplets()
