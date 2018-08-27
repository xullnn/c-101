DICTIONARY = {}
0.upto(9).each { |n| DICTIONARY[n.to_s] = n }

def string_to_i(string)
  digits = string.chars.map { |c| DICTIONARY[c] }
  i = 0
  digits.each { |d| i = i * 10 + d }
  i
end

def string_to_signed_integer(string)
  if string[0] == '-'
    string_to_i(string[1..-1]) * -1
  elsif string[0] == '+'
    string_to_i(string[1..-1])
  else
    string_to_i(string)
  end
end
