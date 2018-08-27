# understand the problem
  # take in a string
  # upcasing all alphabetic chars in odd index
  # lowercasing all alphabetic chars in even index
  # leaving the others unchanged

# Examples and Test cases
  # staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
  # staggered_case('ALL_CAPS') == 'AlL_CaPs'
  # staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Data structure
  # string (with_index)

# Algorithm
  # consider this in terms of index

def staggered_case(string)
  string.each_char.with_index do |c,i|
    if i.even?
      string[i] = c.upcase
    else
      string[i] = c.downcase
    end
  end
  string
end
# here should return a new string

def staggered_case(string)
  new_str = ''
  string.each_char.with_index do |c,i|
    if i.even?
      new_str << string[i] = c.upcase
    else
      new_str << string[i] = c.downcase
    end
  end
  new_str
end
