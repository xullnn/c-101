# Understand the problem
  # Double every char in the given string

# Examples and Test cases
  # repeater('Hello') == "HHeelllloo"
  # repeater("Good job!") == "GGoooodd  jjoobb!!"
  # repeater('') == ''

# Data structure
  # string and array

# Algorithm
  # use chars + zip + join
  # Brute one:
    # chars.with_index
    # chars[i] = chars[i] * 2
    # then join

def repeater(string)
  string.chars.map { |c| c * 2 }.join
end

def repeater(string)
  chars = string.chars
  chars.zip(chars).map { |pair| pair.join }.join
end
