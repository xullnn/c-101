# Understand the problem
  # given a specific year, calculate what the day number of the 13th friday of the year

# Examples and Test cases
  # friday_13th(2015) == 3
  # friday_13th(1986) == 1
  # friday_13th(2019) == 2

# Data structure
  # Ruby class Time
  # integer
  # string

# Algorithm
  # require 'date'
  # Create a new Date object with the given year passed in
  # counter = 1
  # increment month by month and an additional 13 days
    # if the day wday == 5 then count += 1
  # return counter
require 'pry'
require 'date'

# def friday_13th(year)
#   date = Date.new(year)
#   count = 0
#   12.times do |month|
#     count += 1 if ((date >> month) + 12).wday == 5
#   end
#   count
# end

# a simpler solution from a peer student
def friday_13th(year)
  (1..12).select { |month| Time.new(year, month, 13).wday == 5 }.count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2




# def count_5_fridays(year)
#   date = Date.new(year)
#   total = 0
#   12.times do |month|
#     date >> month
#     counter = 0
#     while date.month == month + 1
#       counter += 1 if date.wday == 5
#       date += 1
#     end
#     total += 1 if counter == 5
#   end
#   total
# end
#
# p count_5_fridays 2021
# p count_5_fridays 2020
# p count_5_fridays 2016
