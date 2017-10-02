# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

#CONTINYA here on solvin this baby..

#TODO: get this looping right..
#TODO: need to take account of it being a product
#TODO: figure out how much I need to actually check, and figure out my memoization approach.
def largest_palindrome_product(max=999, min=100)
  max.downto(min).each do |n|
    if is_palindrome(n)
      puts n
      break
    end
  end
end

def is_palindrome(num)
  num == num.to_s.reverse.to_i
end

largest_palindrome_product(999)
