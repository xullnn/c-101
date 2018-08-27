# Understand the problem
 # similar rule but ignore noe-alphabetic chars

# Algorithm
 # can't use index this time
 # use a counter

def staggered_case(string)
  i = 0
  new_str = ''
  string.each_char do |c|
    if c.match /[A-Za-z]/
      if i.even?
        new_str << c.upcase
      else
        new_str << c.downcase
      end
      i += 1
    else
      new_str << c
    end
  end
  new_str
end
