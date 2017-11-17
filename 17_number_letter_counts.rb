# Number letter counts
# Problem 17
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
#
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

# Seems simple enough.. just need to

require 'byebug'

def number_to_word(number)
  return '' if number == 0

  if number / 1000 > 0
    return number_to_word(number.to_s[-4].to_i) + " thousand " + number_to_word(number.to_s[-3, 3].to_i)
  elsif number / 100 > 0
    if number % 100 == 0
      return number_to_word(number.to_s[-3].to_i) + " hundred"
    else
      return number_to_word(number.to_s[-3].to_i) + " hundred and " + number_to_word(number.to_s[-2,2].to_i)
    end  
  elsif number / 10 > 0
    case (number / 10)
    when 9
      return "ninety " + number_to_word(number.to_s[-1,1].to_i)
    when 8
      return "eighty " + number_to_word(number.to_s[-1,1].to_i)
    when 7
      return "seventy " + number_to_word(number.to_s[-1,1].to_i)
    when 6
      return "sixty " + number_to_word(number.to_s[-1,1].to_i)
    when 5
      return "fifty " + number_to_word(number.to_s[-1,1].to_i)
    when 4
      return "forty " + number_to_word(number.to_s[-1,1].to_i)
    when 3
      return "thirty " + number_to_word(number.to_s[-1,1].to_i)
    when 2
      return "twenty " + number_to_word(number.to_s[-1,1].to_i)
    when 1
      case (number % 10)
      when 0
        return "ten"
      when 1
        return "eleven"
      when 2
        return "twelve"
      when 3
        return "thirteen"
      when 4
        return "fourteen"
      when 5
        return "fifteen"
      when 6
        return "sixteen"
      when 7
        return "seventeen"
      when 8
        return "eighteen"
      when 9
        return "nineteen"
    end
  end
  else
    case number
    when 1
      return "one"
    when 2
      return "two"
    when 3
      return "three"
    when 4
      return "four"
    when 5
      return "five"
    when 6
      return "six"
    when 7
      return "seven"
    when 8
      return "eight"
    when 9
      return "nine"
    end
  end
end

def number_letter_counts(up_to = 1000)
  total_count = 0
  i = 1
  while i <= up_to
    puts number_to_word(i)
    total_count += number_to_word(i).gsub(/\s/, '').length
    i += 1
  end

  return total_count
end

puts number_letter_counts(1000)
