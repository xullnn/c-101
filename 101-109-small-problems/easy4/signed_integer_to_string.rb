DICTIONARY = ['0','1','2','3','4','5','6','7','8','9']

def integer_to_string(integer)
  string = ''
  loop do
    integer, num = integer.divmod(10)
    string.prepend(DICTIONARY[num])
    break if integer == 0
  end
  string
end

# def signed_integer_to_string(integer)
#   if integer < 0
#     integer_to_string(-integer).prepend('-')
#   elsif integer > 0
#     integer_to_string(integer).prepend('+')
#   else
#     '0'
#   end
# end


def signed_integer_to_string(integer)
  if integer < 0
    prefix = '-'
    integer = - integer
  elsif integer > 0
    prefix = '+'
  end
  integer != 0 ? prefix + integer_to_string(integer) : "0"
end
