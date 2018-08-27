# Understand the problem
  # balanced meas
    # '(' and ')' at least have equal quantity
    # the usage must be legal, structure like ')illegal(' not counts

# Examples and test cases
  # balanced?('What (is) this?') == true
  # balanced?('What is) this?') == false
  # balanced?('What (is this?') == false
  # balanced?('((What) (is this))?') == true
  # balanced?('((What)) (is this))?') == false
  # balanced?('Hey!') == true
  # balanced?(')Hey!(') == false
  # balanced?('What ((is))) up(') == false

# Data structure
  # string

# Algorithm
  # return false if unbalanced quantity of each parentheses
  # strip parentheses pairs one by one from outmost one
    # stop while there only left on pair
    # if the last pair matched any of these pattern [/.*\(.*\(/, /.*\).*\(/, /.*\(.*\(/]
      # then false
    # else true

# require 'pry'
#
# def balanced?(string)
#   return false if string.count("(") != string.count(")")
#   dup = string.dup
#   while dup.count("()") > 2
#     dup[dup.index("(")] = ''
#     dup[dup.index(")")] = ''
#   end
#   [/.*\(.*\(/, /.*\).*\(/, /.*\(.*\(/].none? { |illegal| illegal.match(dup) }
# end
#
#
# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false
#
#
#
#
# # standard solution
#
# def balanced?(string)
#   balance = 0
#   string.each_char do |char|
#     balance += 1 if char == "("
#     balance -= 1 if char == ")"
#     return false if balance < 0
#   end
#   balance == 0
# end

# another simple solution


# basic idea is extract '()' from innermost to outmost
def balanced?(string)
  parentheses = string.chars.select { |char| char == "(" || char == ")" }.join
  loop do
    break if parentheses.gsub!("()", "") == nil
  end
  parentheses.empty? ? true : false
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
