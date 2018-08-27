# assume years can be divided by 4 are all true
  # if year can be divided by 100, false
  # if year can be divided by 400, true
# otherwise false

def leap_year?(y)
  if y % 4 == 0
    if y % 100 == 0
      if y % 400 == 0
        return true
      end
      return false
    end
    return true
  end
  false
end

# standard solution

def leap_year?(y)
  if y % 400 == 0
    true
  elsif y % 100 == 0
    false
  else
    y % 4 == 0
  end
end
