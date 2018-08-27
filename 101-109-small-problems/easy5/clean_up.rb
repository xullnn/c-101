# 1 gsub! all non-alphabetic chars with " "
# 2 gsub! all 'one or more consecutive' spaces in to a single space

def cleanup(string)
  string.gsub!(/[^\w]/, " ")
  string.gsub!(/\s+/, " ")
end

# standard solution
# http://ruby-doc.org/core-2.5.1/String.html#method-i-squeeze
# string.gsub!(/[^\w]/, " ").squeeze(" ")
