def count_down_to_zero(n)
  if n > 0
    puts n
    count_down_to_zero(n-1)
  else
    puts n
  end
end

count_down_to_zero(9)
