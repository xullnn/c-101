
def fizz_buzz(x,y)
  (x..y).map do |current|
    measure_result(current)
  end
end

def measure_result(current)
  if current % 15 == 0
    "FizzBuzz"
  elsif current % 3 == 0
    "Fizz"
  elsif current % 5 == 0
    "Buzz"
  else
    current
  end
end

def substring(string, starting, ending)
  new_str = ""
  index = starting
  ending.times do |n|
    new_str << string[index + n]
    break if (index + n) == string.length - 1
  end
  new_str
end

def substrings(string)
  new_arr = []
  string.size.times do |anchor|
    n = 2
    loop do
      break if (anchor + n) > string.size || substring(string, anchor, n).size < 2
      new_arr << substring(string, anchor, n)
      n += 1
    end
  end
  new_arr
end

def palindrome?(string)
  front_index = 0
  rear_index = -1
  (string.size / 2).times do
    return false if string[front_index] != string[rear_index]
    front_index += 1
    rear_index -= 1
  end
  true
end

def palindromes(string)
  substrings(string).select { |substring| palindrome?(substring)  }
end

def longest_palindrome(string)
  longest = ""
  palindromes(string).each do |word|
    if word.size > longest.size
      longest = word
    end
  end
  longest
end


NUM = %w[zero one two three four five six seven eight nine].map.with_index do |literal, num|
  [literal, num]
end.to_h

OPERATORS = {
  "plus" => "+",
  "minus" => "-",
  "multiply" => "*",
  "divide" => "/"
}

def calculate(english)
  num1, operator, num2 = english.split
  expression = [NUM[num1].to_s, OPERATORS[operator], NUM[num2].to_s].join(" ")
  eval(expression)
end

def ad_calculate(english)
  expression = english.split.map do |n_or_op|
    NUM[n_or_op] ? NUM[n_or_op] : OPERATORS[n_or_op]
  end.join(" ")
  eval(expression)
end

def word_cap(words)
  words.split.map do |word|
    word[0].upcase + word[1..-1]
  end.join(" ")
end

require "date"

def fridays_13th(year)
  thirteenths = (1..12).map do |month|
    Date.new(year, month, 13)
  end
  thirteenths.count { |date| date.wday == 5 }
end

NUMS = %w[zero one two three four five six seven eight nine]
OPERATORS = %w[plus minus times divided]

def mathphrase(length)
  (1..(length * 2 + 1)).map do |current|
    current.odd? ? NUMS.sample : OPERATORS.sample
  end.join(" ")
end
