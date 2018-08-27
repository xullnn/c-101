def swap_name(string)
  name = string.split
  name[-1] + ", " + name[0]
end

# Standard solution

string.split.reverse.join ", "
