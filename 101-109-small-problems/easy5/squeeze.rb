# def crunch(string)
#   string.each_char.with_index do |c, i|
#     if c == string[i+1]
#       string[i+1] = ''
#     end
#   end
# end

def crunch(string)
  new_str = ''
  string.each_char do |c|
    new_str << c if c != new_str[-1]
  end
  new_str
end
