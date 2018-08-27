# build dic: 1 => '1', 2 => '2' ...
# calculate digits number by a while loop
# from highest number (for example 4321 would use 1000 )use divmod
  # div used to get corresponding string from dic
  # mod used as next number

DICTIONARY = {
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9',
  0 => '0'
}

def order_of_magnitude(integer)
  o = 1
  while integer / (10**o) != 0
    o += 1
  end
  o
end

def integer_to_string(integer)
  o = order_of_magnitude(integer)
  (o-1).downto(0).map do |m|
    x, integer = integer.divmod(10**m)
    DICTIONARY[x]
  end.join
end

# standard solution

# array 的 index 代替了 hash 中的 key
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
