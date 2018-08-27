def leap_year?(y)
  if y >= 1752
    if y % 400 == 0
      true
    elsif y % 100 == 0
      false
    else
      y % 4 == 0
    end
  else
    y % 4 == 0
  end
end

# standard solution

def leap_year?(y)
  if y <= 1752 && y % 4 == 0
    true
  elsif y % 400 == 0
    true
  elsif y % 100 == 0
    false
  else
    y % 4 == 0
  end
end
