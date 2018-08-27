# Understand the problem
 # given a range of number
 # from the smallest one to the biggest one
 # if the number is divisible by 15 print FizzBuzz
 # if the number is divisible by 3 print Fizz
 # if the number id divisible by 5 print Buzz
 # else print the number itself

# Examples and Test cases
  # fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Data structure
  # array, range

# Algorithm
  # ranginize arguments
  # from special to general, 15, 3 and 5, then others

def fizzbuzz(x,y)
  (x..y).map do |n|
    if n % 15 == 0
      print "FizzBuzz "
    else
      if n % 3 == 0
        print "Fizz "
      elsif n % 5 == 0
        print "Buzz "
      else
        print "#{n} "
      end
    end
  end
end
