# You are given the following information, but you may prefer to do some research for yourself.
#
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

# We need a method for counting the days upwards.

def get_next_day(day)
  days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  if day == "Sunday"
    return "Monday"
  else
    return days[days.index(day) + 1]
  end
end

def get_next_month(month)
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  if month == "December"
    return "January"
  else
    return months[months.index(month) + 1]
  end
end

def get_days_in_month(month, year)
  # TODO: Take into account leap year
  leap_year = false
  if (year % 4 == 0) && !(year % 100 == 0 && year % 400 !=1)
    leap_year = true
  end

  if ["September", "April", "June", "November"].include?(month)
    return 30
  elsif month == "February"
    if leap_year
      return 29
    else
      return 28
    end
  else
    return 31
  end
end


def get_next_date(day, day_num, month, year)
  day = get_next_day(day)
  if (day_num == get_days_in_month(month, year))
    day_num = 1
    if month == "December"
      year += 1
    end
    month = get_next_month(month)
  else
    day_num += 1
  end

  return [day, day_num, month, year]

end

def count_sundays
  sunday_count = 0
  day = "Monday"
  day_num = 1
  month = "January"
  year = 1900
  while year < 2001
    if day_num == 1 && year > 1900 && day == "Sunday"
      sunday_count +=1
      puts "Sunday: #{day}, #{day_num}, #{month}, #{year}"
    end
    day, day_num, month, year = get_next_date(day, day_num, month, year)

  end

  return sunday_count
end

puts count_sundays

#TODO: want to debug how its screwing up before getting to 1901, then it should be good.
