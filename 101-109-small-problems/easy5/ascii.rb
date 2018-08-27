def ascii_value(string)
  string.each_char.map { |c| c.ord }.sum
end
