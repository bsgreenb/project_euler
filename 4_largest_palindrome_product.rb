# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

#CONTINYA here on solvin this baby..

#TODO: get this looping right..
#TODO: need to take account of it being a product
#TODO: figure out how much I need to actually check, and figure out my memoization approach.
# 999 | 999
# 999 | 998
# 999 | 997
# ...
# 999 | 1
# 998 | 999 (repeat)
# 998 | 998
# 998 | 997

def largest_palindrome_product(max=999, min=100)
  max_palindrome_product = 0
  #possible TODO: add optimization for reversals
  max.downto(min).each do |i|
    max.downto(min).each do |j|
      puts "Trying #{i} * #{j}"
      product = i * j
      if is_palindrome(product)
        puts "Product is a palindrome: " + product.to_s
        if product > max_palindrome_product
          puts " which beats current record"
          max_palindrome_product = product
        end
      end
    end
    # lower max after each run so we don't repeat
    max = max - 1
  end
  puts "MAX Palindrome product: " + max_palindrome_product.to_s
end

def is_palindrome(num)
  num == num.to_s.reverse.to_i
end

largest_palindrome_product()
