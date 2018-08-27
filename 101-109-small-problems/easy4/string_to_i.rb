# 1 use hash to build corresponding relationships between every single string and integer
# 2 use an array to get digits by enumerating chars in string
# 3 key algorithm => integer = integer * 10 + digit

DICTIONARY = {}
0.upto(9).each { |n| DICTIONARY[n.to_s] = n }

def string_to_i(string)
  digits = string.chars.map { |c| DICTIONARY[c] }
  i = 0
  digits.each { |d| i = i * 10 + d }
  i
end

# string to hexadecimal
# https://en.wikipedia.org/wiki/Hexadecimal
# https://en.wikipedia.org/wiki/Binary_number
# https://www.khanacademy.org/math/algebra-home/alg-intro-to-algebra/algebra-alternate-number-bases/v/number-systems-introduction

DICTIONARY = {}
0.upto(9).each { |n| DICTIONARY[n.to_s] = n }
x = 10
('A'..'F').each { |c| DICTIONARY[c] = x; x += 1 }
# count length of string then to know exponent range (from 0 not 1)
# highest exponent down to 0, multiply every corresponding
# then sum
def hexadecimal_to_integer(string)
  n = string.length - 1
  n.downto(0).map.with_index { |a,i| 16 ** a * DICTIONARY[string[i]] }.sum
end
