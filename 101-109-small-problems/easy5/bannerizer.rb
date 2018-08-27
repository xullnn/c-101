# get string's length l, the box's absolute width will be determined by l
# draw the border up
# draw the empty line
# draw the string line
# draw the empty line
# draw the border down

def print_in_box(string)
  width = string.length + 4
  puts border = '+' + '-'*(width-2) + '+'
  empty_line = '|' + " " * (width-2) + '|'
  puts empty_line
  string_line = string.center(width)
  string_line[0], string_line[-1] = '|', '|'
  puts string_line
  puts empty_line
  puts border
end
